package com.example.motivationalquotes;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("quote", "Believe you can and you're halfway there.");
        model.addAttribute("ipAddress", "127.0.0.1"); // You can make this dynamic later
        model.addAttribute("username", "Amy");
        return "index"; // This matches templates/index.html
    }
}
