package com.yantao.service;

import com.yantao.pojo.User;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 * Created by IntelliJ IDEA.
 *
 * @author YanTao
 * @date 2021/9/12
 * @time 21:11
 */
public interface UserService extends UserDetailsService {
    User selectUserById(String id);

    int insert(User user);
}
