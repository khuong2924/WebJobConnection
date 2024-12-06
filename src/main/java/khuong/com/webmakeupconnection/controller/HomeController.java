package khuong.com.webmakeupconnection.controller;

import jakarta.servlet.http.HttpSession;
import khuong.com.webmakeupconnection.config.SessionUtils;
import khuong.com.webmakeupconnection.dto.ProfileDTO;
import khuong.com.webmakeupconnection.dto.UserDTO;
import khuong.com.webmakeupconnection.entity.*;
import khuong.com.webmakeupconnection.repository.*;
import khuong.com.webmakeupconnection.service.JobPostService;
import khuong.com.webmakeupconnection.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

@Controller
public class HomeController {

    private final ProfileService profileService;
    private final JobPostRepository jobPostRepository;
    private final ApplyInfoRepository applyInfoRepository;
    private final NotificationRepository notificationRepository;
    private final UserRepository userRepository;
    private final JobPostService jobPostService;
    @Autowired
    private ProfileRepository profileRepository;

    public HomeController(ProfileService profileService, JobPostRepository jobPostRepository, ApplyInfoRepository applyInfoRepository, NotificationRepository notificationRepository, UserRepository userRepository, JobPostService jobPostService) {
        this.profileService = profileService;
        this.jobPostRepository = jobPostRepository;
        this.applyInfoRepository = applyInfoRepository;
        this.notificationRepository = notificationRepository;
        this.userRepository = userRepository;
        this.jobPostService = jobPostService;
    }

    @GetMapping("/")
    public String index() {
        return "login";
    }

    @GetMapping("/chatbot")
    public String chatbot(Model model) {
        Long userId = SessionUtils.getCurrentUserId();
        ProfileDTO profileDTO = profileService.getByUserId(userId);
        System.out.println(profileDTO.getPortfolioPhoto());
        System.out.println(profileDTO.getCoverPhoto());
        model.addAttribute("profile", profileDTO);

        List<ProfileDTO> profiles = profileService.getAll();
        model.addAttribute("profiles", profiles);

        List<User> users = userRepository.findAll();
        model.addAttribute("users", users);


        List<JobPost> jobPosts = jobPostRepository.findByUserId(userId);
        model.addAttribute("jobPosts", jobPosts);

        return "chatBox";
    }

    @GetMapping("/home")
    public String home(Model model) {
        List<JobPost> jobPosts = jobPostRepository.findAll();
        Long userId = SessionUtils.getCurrentUserId();

        List<ApplyInfo> infos = applyInfoRepository.findAllByJobPostUserId(userId);
        model.addAttribute("infos", infos);

        // Sort the list based on the createdAt field
        jobPosts.sort((jobPost1, jobPost2) -> jobPost2.getCreatedAt().compareTo(jobPost1.getCreatedAt()));

        // Add the sorted list to the model
        model.addAttribute("jobPosts", jobPosts);
        return "homePage";
    }

    @GetMapping("/search")
    public String searchJobPosts(
            @RequestParam(required = false) String jobType,
            @RequestParam(required = false) String date,  // Receive date as String
            @RequestParam(required = false) BigDecimal startSalary,
            @RequestParam(required = false) BigDecimal endSalary,
            Model model) {

        if (jobType != null && jobType.equals("")) {
            jobType = null;
        }

        System.out.println("Job Type: " + jobType);

        LocalDateTime localDateTime = null;
        if (date != null && !date.isEmpty()) {
            date += "T00:00:00";
            localDateTime = LocalDateTime.parse(date);
        }

        List<JobPost> jobPosts = jobPostService.searchJobPosts(jobType, localDateTime, startSalary, endSalary);

        jobPosts.sort((jobPost1, jobPost2) -> jobPost2.getCreatedAt().compareTo(jobPost1.getCreatedAt()));

        model.addAttribute("jobPosts", jobPosts);

        return "homePage";
    }


    @PostMapping("/create")
    public String createJobPost(
            @RequestParam("title") String title,
            @RequestParam("description") String description,
            @RequestParam("time") String time,  // String format for time
            @RequestParam("style") String style,
            @RequestParam("location") String location,
            @RequestParam("cost") Double cost,
            @RequestParam(value = "file", required = false) MultipartFile file,
            RedirectAttributes redirectAttributes) {

        try {
            // If time string is only a date, append the default time (00:00)
            if (time.length() == 10) {  // Check if the string has only the date part (yyyy-MM-dd)
                time += "T00:00";  // Append default time to create a valid LocalDateTime
            }

            // Convert the time string to LocalDateTime
            JobPost jobPost = new JobPost();
            jobPost.setTitle(title);
            jobPost.setDescription(description);
            jobPost.setStart(LocalDateTime.parse(time));  // Parse the LocalDateTime with date and time
            jobPost.setLocation(location);
            jobPost.setSalary(BigDecimal.valueOf(cost));
            jobPost.setCreatedAt(LocalDateTime.now());

            if(file != null) {
                jobPost.setPostPhoto(imageUploadService.uploadImage(file));
                System.out.println(1);
            }
            Long userId = SessionUtils.getCurrentUserId();

            User user = userRepository.findById(userId).orElse(null);
            jobPost.setUser(user);
            JobPost post = jobPostRepository.save(jobPost);
            System.out.println(post);
            redirectAttributes.addFlashAttribute("message", "Job post created successfully!");
            return "redirect:/home";

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Error creating job post.");
            return "redirect:/home";
        }
    }


    @PostMapping("/follow")
    public String followJobPost(@RequestParam("jobPostId") Long jobPostId, HttpSession session,
                                @RequestParam(value = "content", required = false) String content,
                                @RequestParam(value = "image", required = false) MultipartFile file) {
        Long userId = SessionUtils.getCurrentUserId();
        User user = userRepository.findById(userId).orElse(null);
        if (user != null) {
            JobPost jobPost = jobPostRepository.findById(jobPostId).orElse(null);

            if (jobPost != null) {
                ApplyInfo applyInfo = new ApplyInfo();
                applyInfo.setUser(user);
                applyInfo.setJobPost(jobPost);
                applyInfo.setApplyContent(content);
                if(!file.isEmpty() && file != null) {
                    try {
                        String url = imageUploadService.uploadImage(file);
                        applyInfo.setApplyImage(url);
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
                }
                applyInfoRepository.save(applyInfo);
            }
        }
        return "redirect:/home";
    }

    @PostMapping("/accept")
    public String acceptNotification(
            @RequestParam("jobPostId") Long jobPostId,
            @RequestParam("userId") Long userId,
            RedirectAttributes redirectAttributes) {

        User user = userRepository.findById(userId).orElse(null);
        if (user == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "User not found!");
            return "redirect:/home";
        }

        JobPost jobPost = jobPostRepository.findById(jobPostId).orElse(null);
        if (jobPost == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Job post not found!");
            return "redirect:/home";
        }

        Optional<Notification> existingNotification = notificationRepository.findByUserAndJobPost(user, jobPost);

        if (existingNotification.isPresent()) {
            redirectAttributes.addFlashAttribute("errorMessage", "User has already followed this job post.");
        } else {
            Notification notification = new Notification();
            notification.setUser(user);
            notification.setJobPost(jobPost);
            notificationRepository.save(notification);
            Optional<ApplyInfo> applyInfo = applyInfoRepository.findByJobPostIdAndUserId(jobPostId, userId);
            if(applyInfo.isPresent()) {
                applyInfoRepository.delete(applyInfo.get());
            }
            redirectAttributes.addFlashAttribute("successMessage", "Notification created successfully!");
        }

        return "redirect:/home";
    }

    @PostMapping("/flagNotification")
    public String flagNotification(@RequestParam("notificationId") Long notificationId, RedirectAttributes redirectAttributes) {
        try {
            Notification notification = notificationRepository.findById(notificationId)
                    .orElseThrow(() -> new IllegalArgumentException("Notification not found"));

            notification.setFlagged(!notification.isFlagged());
            notificationRepository.save(notification);

            // Add success message
            redirectAttributes.addFlashAttribute("message", "Notification flagged successfully!");
            return "redirect:/schedule";  // Redirect to your notification list page

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error flagging notification.");
            return "redirect:/schedule";
        }
    }

    @PostMapping("jobPost/delete/{id}")
    public String deleteJobPost(@PathVariable Long id) {
        try {
            // Kiểm tra xem JobPost tồn tại hay không
            JobPost jobPost = jobPostRepository.findById(id)
                    .orElseThrow(() -> new IllegalArgumentException("Job post not found"));

            // Xóa JobPost khỏi database
            jobPostRepository.delete(jobPost);

            return "redirect:/schedule";
        } catch (Exception e) {
            return "redirect:/schedule";
        }
    }




    @GetMapping("/profile")
    public String showProfilePage(Model model) {
        Long userId = SessionUtils.getCurrentUserId();
        ProfileDTO profileDTO = profileService.getByUserId(userId);
        System.out.println(profileDTO.getPortfolioPhoto());
        System.out.println(profileDTO.getCoverPhoto());
        model.addAttribute("profile", profileDTO);

        List<JobPost> jobPosts = jobPostRepository.findByUserId(userId);
        model.addAttribute("jobPosts", jobPosts);
        return "profile";
    }

    @GetMapping("/profile/{id}")
    public String showUserPage (@PathVariable("id") Long id, Model model) {
        ProfileDTO profileDTO = profileService.getByUserId(id);
        System.out.println(profileDTO.getPortfolioPhoto());
        System.out.println(profileDTO.getCoverPhoto());
        model.addAttribute("profile", profileDTO);
        List<JobPost> jobPosts = jobPostRepository.findByUserId(id);
        model.addAttribute("jobPosts", jobPosts);
        return "profile";
    }

    @Autowired
    private ImageUploadService imageUploadService;

    @GetMapping("/login")
    public String showLogin() {
        return "login";
    }

    @GetMapping("/signup")
    public String showSignupPage() {
        return "signUp";
    }




    @GetMapping("/account")
    public String showAccountPage() {
        return "account";
    }

    @GetMapping("/schedule")
    public String showSchedulePage(@RequestParam(name = "date", required = false) String date, Model model) {
        Long userId = SessionUtils.getCurrentUserId();

        LocalDate selectedDate = (date != null) ? LocalDate.parse(date) : null;

        List<Notification> notifications;
        Set<LocalDate> notificationDates = new HashSet<>();

        if (selectedDate != null) {
            notifications = notificationRepository.findByJobPostStartDateAndUserId(selectedDate, userId);
        } else {
            notifications = notificationRepository.findAllByUserId(userId);
        }

        for (Notification notification : notifications) {
            JobPost jobPost = notification.getJobPost();
            if (jobPost.getStart() != null) {
                LocalDate jobPostStartDate = jobPost.getStart().toLocalDate();
                notificationDates.add(jobPostStartDate);
            }
        }

        notifications.sort(Comparator.comparing(Notification::isFlagged).reversed()
                .thenComparing(notification -> notification.getJobPost().getStart()));

        System.out.println("notificationDates: " + notificationDates);

        model.addAttribute("notifications", notifications);
        model.addAttribute("selectedDate", selectedDate);
        model.addAttribute("notificationDates", new ArrayList<>(notificationDates));


        return "schedules";
    }

    @PostMapping("notification/delete/{id}")
    public String deleteNotification(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            // Lấy thông tin Notification
            Notification notification = notificationRepository.findById(id)
                    .orElseThrow(() -> new IllegalArgumentException("Notification not found"));

            // Thêm thông tin Notification vào RedirectAttributes
            redirectAttributes.addFlashAttribute("deletedNotification", notification);

            // Chuyển hướng đến trang khác sau khi xóa thành công
            return "redirect:/notification/deleted";  // Chuyển đến trang 'deleted'
        } catch (Exception e) {
            // Xử lý lỗi nếu cần
            return "redirect:/schedule";
        }
    }


    @GetMapping("/notification/deleted")
    public String showDeletedNotification(
            @ModelAttribute("deletedNotification") Notification notification,
            Model model) {
        if (notification == null) {
            return "redirect:/schedule"; // Nếu không có Notification, quay lại trang mặc định
        }

        // Lấy thông tin User từ Notification
        User userFromNotification = userRepository.findById(notification.getUser().getId()).orElse(null);

        // Nếu User hiện tại trùng với User của Notification
        assert userFromNotification != null;
        Profile pr = profileRepository.findByUserId(userFromNotification.getId()).orElse(null);
        model.addAttribute("userCanceled", pr);

        JobPost jp = jobPostRepository.findById(notification.getJobPost().getId()).orElse(null);
        model.addAttribute("jobPostCanceled", jp);

        // Xóa Notification khỏi database
        notificationRepository.delete(notification);

        // Chuyển đến trang homePage sau khi xử lý
        return "homePage"; // Trả về trang HomePage
    }



}
