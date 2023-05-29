package com.project.InventoryManagement.model;

import lombok.Data;

@Data
public class Equipment {
    private Long equipmentID;
    private String name;
    private String category;
    private String description;
    private int quantity;
}