package com.yantao.service;

import com.yantao.dao.RoleMapper;
import com.yantao.dao.UserMapper;
import com.yantao.pojo.Role;
import com.yantao.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author YanTao
 * @date 2021/9/12
 * @time 21:15
 */
@Service
public class UserServiceImpl implements UserService{
    private UserMapper userMapper;

    private RoleMapper roleMapper;

    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Autowired
    public void setRoleMapper(RoleMapper roleMapper) {
        this.roleMapper = roleMapper;
    }

    @Override
    public User selectUserById(String id) {
        return userMapper.selectUserById(id);
    }

    @Override
    public int insert(User user) {
        return userMapper.insert(user);
    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        User user = selectUserById(s);
        org.springframework.security.core.userdetails.User userDetail;
        userDetail = new org.springframework.security.core.userdetails.User(user.getUsername(),
                user.getPassword(),
                true,
                true,
                true,
                true,
                getAuthorities(roleMapper.selectRoleById(user.getRid().toString())));
        return userDetail;
    }

//    作用就是返回一个List集合，集合中装入的是角色描述
    public List<SimpleGrantedAuthority> getAuthorities(Role role){
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
//        for (Role role : roles) {
        String[] perms = role.getRprems().split(",");
        for (String perm : perms) {
            authorities.add(new SimpleGrantedAuthority("ROLE_" + perm.toUpperCase()));
        }
//        }
//        authorities.add(new SimpleGrantedAuthority("ROLE_" + role.getRname().toUpperCase()));
        return authorities;
    }
}
