package com.mainacad.myproject.repository;

import com.mainacad.myproject.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepos extends JpaRepository<User, Long> {

    User findByLoginName(String username);
}
