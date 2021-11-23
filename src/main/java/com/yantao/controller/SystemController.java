package com.yantao.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by IntelliJ IDEA.
 *
 * @author YanTao
 * @date 2021/9/12
 * @time 21:34
 */
@Controller
public class SystemController {

    @RequestMapping("/unauthorized.html")
    @ResponseBody
    public String unauthorized(){
        return "<h2>未经授权，禁止访问！</h2>";
    }

    @RequestMapping("/failure.html")
    public String toFailure(){
        return "failure";
    }

    @RequestMapping("/login.html")
    public String toLogin(){
        return "login";
    }

    @PostMapping("/login")
    public String login(String username, String password, Boolean rememberMe, Model model){
        return null;
    }

    @RequestMapping("/logout.html")
    public String logout(HttpSession session, Model model) {
        session.removeAttribute("user");
        model.addAttribute("msg","安全退出！");
        return "login";
    }

    @RequestMapping("/register.html")
    @PreAuthorize("permitAll()")
    public String toRegister(){
        return "register";
    }
}
