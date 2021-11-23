package com.yantao.controller;

import com.yantao.pojo.User;
import com.yantao.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 *
 * @author YanTao
 * @date 2021/10/14
 * @time 21:59
 */
@Controller
@RequestMapping("/user")
public class UserController {
    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/add")
    @ResponseBody
    public Map<String, Object> addUser(String nickname, String username, String password, Integer age, Character sex, String birthday, Integer role){
        User user;
        Map<String, Object> map = new HashMap<>();
        try {
            user = new User(username, password, nickname, age, sex, new SimpleDateFormat("yyyy-MM-dd").parse(birthday), role);
        } catch (ParseException e) {
            map.put("code", 2);
            map.put("msg", "生日填写不符合规范！");
            return map;
        }
        System.out.println(user.getBirthday());
        user.setCreatedtime(new Date());
        int i = userService.insert(user);
        if (i > 0){
            map.put("code", 0);
            map.put("msg", "注册成功！");
            return map;
        }
        map.put("code", 1);
        map.put("msg", "注册失败！");
        return map;
    }
}
