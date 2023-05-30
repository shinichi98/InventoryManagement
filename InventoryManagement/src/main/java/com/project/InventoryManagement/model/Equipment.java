package com.project.InventoryManagement.model;


import lombok.Data;

import jakarta.persistence.*;

@Data
@Entity
@Table(name = "Equipment")
public class Equipment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long equipmentID;
    
    private String name;
    
    private String category;
    
    private String description;
    
    private int quantity;
}
