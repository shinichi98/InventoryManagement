package com.project.InventoryManagement.model;

import lombok.Data;

import java.time.LocalDate;

@Data
public class Request {
    private Long requestID;
    private Long userID;
    private Long equipmentID;
    private LocalDate requestDate;
    private RequestStatus status;
}