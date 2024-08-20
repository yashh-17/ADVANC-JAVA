package com.example.profiles.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.example.profiles.models.User;
import com.example.profiles.service.UserService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/users")
public class actionController {

    @Autowired
    private UserService userService;

    @PostMapping("/add")
    public String addUser(User user, RedirectAttributes redirectAttributes) {
        userService.saveUser(user);
        redirectAttributes.addFlashAttribute("message", "User added successfully!");
        return "redirect:/users";  // Redirect to the users listing
    }

    @GetMapping
    public String getUsers(Model model) {
        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "users";
    }

}

@Controller
@RequestMapping("/admin")
class AdminController {
    @Autowired
    private UserService userService;

    @PostMapping("/authenticate")
    public String admin(@RequestParam("username") String username, @RequestParam("password") String password, RedirectAttributes redirectAttributes) {
        boolean isAuthenticated = userService.authenticate(username, password);

        if (isAuthenticated) {
            return "redirect:/admin/viewUsers";
        } else {
            redirectAttributes.addFlashAttribute("error", "Invalid username or password");
            return "redirect:/admin/login";
        }
    }
    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        userService.deleteUser(id);
        redirectAttributes.addFlashAttribute("message", "User deleted successfully!");
        return "redirect:/admin/viewUsers";
    }
    @GetMapping("/edit/{id}/")
    public String editUser(@PathVariable("id") Long id, Model model) {
        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "adminEdit";
    }
    @PostMapping("/edit/{id}/update")
    public String updateUser(@PathVariable("id") Long id, User user, RedirectAttributes redirectAttributes) {
        User existingUser = userService.getUserById(id);
        System.out.println("User: " + id +user.getId()+user.getName());
        if (existingUser != null) {
            user.setId(id);
            User updatedUser = userService.updateUser(user);

            if (updatedUser != null) {
                redirectAttributes.addFlashAttribute("message", "User updated successfully!");
            } else {
                redirectAttributes.addFlashAttribute("error", "Error updating user!");
            }
        } else {
            redirectAttributes.addFlashAttribute("error", "User not found!");
        }
        return "redirect:/admin/viewUsers";
    }

}
