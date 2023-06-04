package com.project.InventoryManagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.InventoryManagement.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
	boolean existsByUsername(String username);
    boolean existsByPhoneNumber(String phoneNumber);
    boolean existsByEmail(String email);
    User findByUsernameAndPassword(String username, String password);
}

