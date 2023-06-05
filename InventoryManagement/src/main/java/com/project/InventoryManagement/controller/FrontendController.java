package com.project.InventoryManagement.controller;

import com.project.InventoryManagement.model.User;
import com.project.InventoryManagement.model.Equipment;
import com.project.InventoryManagement.model.Request;
import com.project.InventoryManagement.service.UserService;
import com.project.InventoryManagement.service.EquipmentService;
import com.project.InventoryManagement.service.RequestService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.NoSuchElementException;

@Controller
@RequestMapping("/frontend")
public class FrontendController {

    private final UserService userService;
    private final EquipmentService equipmentService;
    private final RequestService requestService;

    public FrontendController(UserService userService, EquipmentService equipmentService, RequestService requestService) {
        this.userService = userService;
        this.equipmentService = equipmentService;
        this.requestService = requestService;
    }
    @GetMapping("/home")
    public String showHomePage(Model model) {
//        model.addAttribute("user", new User()); // Create a new User object for the login form
        return "home";
    }
    @GetMapping("/login")
    public String showloginPage(Model model) {
//        model.addAttribute("user", new User()); // Create a new User object for the login form
        return "login";
    }
    @PostMapping("/login")
    public String loginUser(@RequestParam String username, @RequestParam String password, Model model, HttpSession session) {
        try {
            User user = userService.loginUser(username, password);
            session.setAttribute("user", (User) user);
            System.out.println(user.getClass().getName() + " " + user.getUserID() +" "+user.getUsername());
            System.out.println(session.getAttribute("user") != null);
            return "redirect:/frontend/welcome";
        } catch (NoSuchElementException e) {
            model.addAttribute("error", "Invalid username or password");
            return "login";
        }
    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // Invalidate the session and remove the user attribute
        session.invalidate();
        
        // Redirect the user to the login page
        return "redirect:/frontend/login";
    }

    @GetMapping("/register")
    public String showRegistrationPage() {
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute("user") User user, RedirectAttributes redirectAttributes) {
        try {
            userService.registerUser(user);
            redirectAttributes.addFlashAttribute("message", "Registration successful. Please log in.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/frontend/login";
    }

    @GetMapping("/welcome")
    public String showWelcomePage(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/frontend/login";
        }
        return "welcome";
    }

    @GetMapping("/equipment")
    public String getAllEquipment(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/frontend/home";
        }
        List<Equipment> allEquipment = equipmentService.getAllEquipment();
        model.addAttribute("equipmentList", allEquipment);
        return "equipmentList";
    }

    @GetMapping("/requestequipment")
    public String showRequestEquipmentForm(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/frontend/home";
        }
        return "requestequipment";
    }

    @PostMapping("/requestequipment")
    public String requestEquipment(@RequestParam("equipmentId") String equipmentId, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/frontend/home";
        }

        try {
            
            Request request = requestService.raiseRequest(user.getUserID(), Long.parseLong(equipmentId));
            // Show success message
            model.addAttribute("successMessage", "Request raised successfully");
        } catch (IllegalArgumentException e) {
            // Show error message
            model.addAttribute("errorMessage", "Equipment not available");
        } catch (NoSuchElementException e) {
            // Show error message
            model.addAttribute("notFoundMessage", "Equipment not found");
        }

        

        return "requestequipment";
    }
    @GetMapping("/changepassword")
    public String showChangePasswordForm(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/frontend/home";
        }
        return "changepassword";
    }

    @PostMapping("/updatepassword")
    public String changePassword(@RequestParam String newPassword, HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/frontend/home";
        }
        try {
            userService.changePassword( user.getUserID(), newPassword);
            redirectAttributes.addFlashAttribute("message", "Password changed successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Failed to change password: " + e.getMessage());
        }
        return "redirect:/frontend/welcome";
    }

    @GetMapping("/equipment/{equipmentId}")
    public String getEquipmentDetails(@PathVariable("equipmentId") Long equipmentId, Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/frontend/home";
        }
        Equipment equipment = equipmentService.getEquipmentById(equipmentId);
        model.addAttribute("equipment", equipment);
        return "equipmentDetails";
    }
    @GetMapping("/changeuserdetails")
    public String showChangeUserDetailsForm(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/frontend/login";
        }

        model.addAttribute("user", user);
        return "changeuserdetails";
    }

    @PostMapping("/updateuserdetails")
    public String updateUserDetails(@ModelAttribute("user") User updatedUser, HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/frontend/login";
        }

        try {
            updatedUser.setUserID(user.getUserID());
            userService.updateUser(updatedUser);
            session.setAttribute("user", updatedUser);
            redirectAttributes.addFlashAttribute("message", "User details updated successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Failed to update user details: " + e.getMessage());
        }

        return "redirect:/frontend/welcome";
    }
    
    @GetMapping("/equipmentheld")
    public String displayEquipmentHeld(Model model, HttpSession session, HttpServletResponse response) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/frontend/login";
        }

        List<Equipment> equipmentList = userService.getEquipmentHeldByUser(user);
        model.addAttribute("equipmentList", equipmentList);

        // Set cache control headers to disable caching
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        return "equipmentheld";
    }
    @GetMapping("/equipmentdetails")
    public String showEquipmentDetails(Model model) {
        List<Equipment> equipmentList = equipmentService.getAllEquipment();
        model.addAttribute("equipmentList", equipmentList);
        return "equipmentdetails";
    }
    @GetMapping("/returnequipment")
    public String displayEquipmentReturn(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/frontend/login";
        }

        List<Equipment> equipmentList = userService.getEquipmentHeldByUser(user);
        model.addAttribute("equipmentList", equipmentList);

        return "returnequipment";
    }
    @PostMapping("/returnequipment")
    public String returnEquipment(@RequestParam("equipmentId") String equipmentId, HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/frontend/login";
        }
        
        try {
            userService.returnEquipment(user, Long.parseLong(equipmentId));
            redirectAttributes.addFlashAttribute("successMessage", "Equipment returned successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to return equipment: " + e.getMessage());
        }
        
        return "redirect:/frontend/returnequipment";
    }
    
}
