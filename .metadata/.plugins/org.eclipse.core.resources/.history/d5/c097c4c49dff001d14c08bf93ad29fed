package com.project.InventoryManagement.model;


import lombok.Data;

import jakarta.persistence.*;

import java.time.LocalDate;

@Data
@Entity
@Table(name = "Request")
public class Request {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long requestID;
    
    @ManyToOne
    @JoinColumn(name = "UserID")
    private User user;
    
    @ManyToOne
    @JoinColumn(name = "EquipmentID")
    private Equipment equipment;
    
    private LocalDate requestDate;
    
    @Enumerated(EnumType.STRING)
    private RequestStatus status;
}
