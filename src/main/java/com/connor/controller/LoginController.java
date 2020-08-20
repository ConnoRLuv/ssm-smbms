package com.connor.controller;

import com.connor.domain.User;
import com.connor.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;

/**
 * 用户web
 */
@Controller
@RequestMapping("/login")
@SessionAttributes("loginUser")

public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping("/doLogin")
    public String doLogin(User user, Model model) {
        User tmp = userService.getUserByCode(user.getUserCode());
        if (tmp != null) {
            if (tmp.getUserPassword().equals(user.getUserPassword())) {
                model.addAttribute("loginUser", tmp);
                return "welcome";
            } else {
                return "redirect:../login.jsp";
            }
        }

        return "redirect:../login.jsp";
    }
}


