//package khuong.com.webmakeupconnection.config;
//
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.stereotype.Component;
//
//import javax.annotation.PostConstruct;
//import java.io.BufferedReader;
//import java.io.InputStreamReader;
//
//@Component
//public class DatabaseInitializer {
//
//    @Value("${spring.datasource.url}")
//    private String dbUrl;
//
//    @Value("${spring.datasource.username}")
//    private String dbUsername;
//
//    @Value("${spring.datasource.password}")
//    private String dbPassword;
//
//    @PostConstruct
//    public void initializeDatabase() {
//        try {
//            String[] command = {
//                    "mysql",
//                    "-u" + dbUsername,
//                    "-p" + dbPassword,
//                    "-e", "source src/main/resources/db/backup.sql"
//            };
//
//            ProcessBuilder processBuilder = new ProcessBuilder(command);
//            processBuilder.redirectErrorStream(true);
//            Process process = processBuilder.start();
//
//            try (BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()))) {
//                String line;
//                while ((line = reader.readLine()) != null) {
//                    System.out.println(line);
//                }
//            }
//
//            int exitCode = process.waitFor();
//            if (exitCode == 0) {
//                System.out.println("Database initialized successfully.");
//            } else {
//                System.err.println("Database initialization failed.");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//}
