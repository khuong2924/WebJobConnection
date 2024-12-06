package khuong.com.webmakeupconnection.repository;

import khuong.com.webmakeupconnection.entity.Profile;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ProfileRepository extends JpaRepository<Profile, Long> {
    Optional<Profile> findByUserId(Long userId);

    @Override
    List<Profile> findAll();
}