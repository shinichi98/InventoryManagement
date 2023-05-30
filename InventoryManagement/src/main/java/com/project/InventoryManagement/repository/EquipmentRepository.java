package com.project.InventoryManagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.InventoryManagement.model.Equipment;

public interface EquipmentRepository extends JpaRepository<Equipment, Long> {
    // Define custom query methods if needed
}