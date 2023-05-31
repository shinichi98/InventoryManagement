package com.project.InventoryManagement.service;

import java.util.*;
import java.util.NoSuchElementException;

import org.springframework.stereotype.Service;

import com.project.InventoryManagement.model.Equipment;
import com.project.InventoryManagement.model.User;
import com.project.InventoryManagement.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final EquipmentService equipmentService;

    public UserService(UserRepository userRepository,EquipmentService equipmentService) {
        this.userRepository = userRepository;
        this.equipmentService = equipmentService;
    }

    public User registerUser(User user) {
        validateUniqueFields(user);
        return userRepository.save(user);
    }

    public User updateUser(User updatedUser) {
        User existingUser = getUserById(updatedUser.getUserID());
        updateFields(existingUser, updatedUser);
        return userRepository.save(existingUser);
    }

    public void deleteUser(Long userId) {
        userRepository.deleteById(userId);
    }

    public User getUserById(Long userId) {
        return userRepository.findById(userId)
                .orElseThrow(() -> new NoSuchElementException("User not found"));
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }
    public void addEquipmentToUser(User user, Long equipmentId) {
        String equipmentIds = user.getEquipmentIds();
        if (equipmentIds == null || equipmentIds.isEmpty()) {
            equipmentIds = String.valueOf(equipmentId);
        } else {
            equipmentIds += "," + equipmentId;
        }
        user.setEquipmentIds(equipmentIds);
        userRepository.save(user);
    }

    public void removeEquipmentFromUser(User user, Long equipmentId) {
        String equipmentIds = user.getEquipmentIds();
        if (equipmentIds != null && !equipmentIds.isEmpty()) {
            List<String> equipmentIdList = new ArrayList<>(Arrays.asList(equipmentIds.split(",")));
            equipmentIdList.remove(String.valueOf(equipmentId));
            equipmentIds = String.join(",", equipmentIdList);
            user.setEquipmentIds(equipmentIds);
            userRepository.save(user);
        }
    }

    public List<Equipment> getEquipmentHeldByUser(User user) {
        List<Equipment> equipmentList = new ArrayList<>();
        String equipmentIds = user.getEquipmentIds();
        if (equipmentIds != null && !equipmentIds.isEmpty()) {
            List<String> equipmentIdList = Arrays.asList(equipmentIds.split(","));
            for (String equipmentId : equipmentIdList) {
                Long id = Long.parseLong(equipmentId);
                Equipment equipment = equipmentService.getEquipmentById(id);
                if (equipment != null) {
                    equipmentList.add(equipment);
                }
            }
        }
        return equipmentList;
    }

    public void changePassword(Long userId, String newPassword) {
        User existingUser = getUserById(userId);
        String storedPassword = existingUser.getPassword();
        if(newPassword.equals(storedPassword)) {
        	throw new IllegalArgumentException("Password are matching");
        }
        userRepository.save(existingUser);
    }

    private void validateUniqueFields(User user) {
        if (userRepository.existsByUsername(user.getUsername())) {
            throw new IllegalArgumentException("Username already exists");
        }

        if (userRepository.existsByPhoneNumber(user.getPhoneNumber())) {
            throw new IllegalArgumentException("Phone number already exists");
        }

        if (userRepository.existsByEmail(user.getEmail())) {
            throw new IllegalArgumentException("Email already exists");
        }
    }

    private void updateFields(User existingUser, User updatedUser) {
        existingUser.setFirstName(updatedUser.getFirstName());
        existingUser.setLastName(updatedUser.getLastName());
        existingUser.setEmail(updatedUser.getEmail());
        existingUser.setPhoneNumber(updatedUser.getPhoneNumber());
        existingUser.setRole(updatedUser.getRole());
    }
    
    
}