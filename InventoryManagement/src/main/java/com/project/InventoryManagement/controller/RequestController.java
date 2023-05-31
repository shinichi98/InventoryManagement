package com.project.InventoryManagement.controller;
import java.util.List;

import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.project.InventoryManagement.model.Request;
import com.project.InventoryManagement.service.RequestService;
@RestController
@RequestMapping("/requests")
public class RequestController {

    private final RequestService requestService;

    public RequestController(RequestService requestService) {
        this.requestService = requestService;
    }

    @PostMapping("/{userId}/{equipmentId}")
    public ResponseEntity<Request> raiseRequest(@PathVariable Long userId, @PathVariable Long equipmentId) {
        Request request = requestService.raiseRequest(userId, equipmentId);
        return ResponseEntity.status(HttpStatus.CREATED).body(request);
    }

    @PutMapping("/approve/{requestId}")
    public ResponseEntity<Void> approveRequest(@PathVariable Long requestId) {
        requestService.approveRequest(requestId);
        return ResponseEntity.noContent().build();
    }

    @PutMapping("/reject/{requestId}")
    public ResponseEntity<Void> rejectRequest(@PathVariable Long requestId) {
        requestService.rejectRequest(requestId);
        return ResponseEntity.noContent().build();
    }

    @GetMapping
    public ResponseEntity<List<Request>> getAllRequests() {
        List<Request> requests = requestService.getAllRequests();
        return ResponseEntity.ok(requests);
    }

    @GetMapping("/{requestId}")
    public ResponseEntity<Request> getRequestById(@PathVariable Long requestId) {
        Request request = requestService.getRequestById(requestId);
        return ResponseEntity.ok(request);
    }
}
