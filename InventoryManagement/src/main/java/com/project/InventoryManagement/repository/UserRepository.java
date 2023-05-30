package com.project.InventoryManagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.InventoryManagement.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    // Define custom query methods if needed
}

