package com.project.InventoryManagement.model;


import lombok.Data;

import jakarta.persistence.*;


@Data
@Entity
@Table(name = "User")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long userID;
    
    private String username;
    
    private String password;
    
    private String firstName;
    
    private String lastName;
    
    private String email;
    
    private String phoneNumber;
    
    @Enumerated(EnumType.STRING)
    private UserRole role;
}
