package com.project.InventoryManagement.service;

import java.util.*;
import java.util.NoSuchElementException;

import org.springframework.stereotype.Service;

import com.project.InventoryManagement.model.Equipment;
import com.project.InventoryManagement.model.User;
import com.project.InventoryManagement.repository.EquipmentRepository;
import com.project.InventoryManagement.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final EquipmentRepository equipmentRepository;
    private final EquipmentService equipmentService;

    public UserService(UserRepository userRepository,EquipmentService equipmentService,EquipmentRepository equipmentRepository) {
        this.userRepository = userRepository;
        this.equipmentService = equipmentService;
        this.equipmentRepository=equipmentRepository;
    }

    public User registerUser(User user) {
        validateUniqueFields(user);
    	if (user.getEquipmentIds() == null) {
            user.setEquipmentIds("");
        }
        return userRepository.save(user);
    }
    public User loginUser(String username, String password) {
        User user = userRepository.findByUsernameAndPassword(username, password);

        if (user == null) {
            throw new NoSuchElementException("Invalid username or password");
        }

        return user;
    }

    public User updateUser(User updatedUser) {
        User existingUser = getUserById(updatedUser.getUserID());
//      validateUniqueFields(updatedUser);
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
        Equipment equipment=equipmentRepository.findById(equipmentId)
                .orElseThrow(() -> new NoSuchElementException("Equipment not found"));
        equipment.setQuantity(equipment.getQuantity()-1);
       equipmentRepository.save(equipment);
        user.setEquipmentIds(equipmentIds);
        userRepository.save(user);
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
    public void returnEquipment(User user, Long equipmentId) {
        String equipmentIds = user.getEquipmentIds();
        if (equipmentIds != null && !equipmentIds.isEmpty()) {
            String[] idsArray = equipmentIds.split(",");
            List<String> idsList = new ArrayList<>(Arrays.asList(idsArray));
            if (idsList.contains(String.valueOf(equipmentId))) {
                idsList.remove(String.valueOf(equipmentId));
                equipmentIds = String.join(",", idsList);
                user.setEquipmentIds(equipmentIds);
                userRepository.save(user);
                
                // Update the equipment quantity
                Equipment equipment = equipmentRepository.findById(equipmentId).orElseThrow(() -> new NoSuchElementException("Equipment not found"));
                equipment.setQuantity(equipment.getQuantity() + 1);
                equipmentRepository.save(equipment);
            }
        }
    }

    public User changePassword(Long userId, String newPassword) {
        User existingUser = getUserById(userId);
        String storedPassword = existingUser.getPassword();
        if(newPassword.equals(storedPassword)) {
        	throw new IllegalArgumentException("Password are matching");
        }
        existingUser.setPassword(newPassword);
        userRepository.save(existingUser);
        return existingUser;
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
        existingUser.setAge(updatedUser.getAge());
    }
    
    
}