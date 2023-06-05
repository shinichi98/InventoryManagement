package com.project.InventoryManagement.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.InventoryManagement.model.Request;

public interface RequestRepository extends JpaRepository<Request, Long> {
    // Define custom query methods if needed
	List<Request> findAllByUser_UserID(Long userID);
}