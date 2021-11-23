package com.yantao.service;

import com.yantao.dao.RoleMapper;
import com.yantao.pojo.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by IntelliJ IDEA.
 *
 * @author YanTao
 * @date 2021/9/12
 * @time 21:19
 */
@Service
public class RoleServiceImpl implements RoleService{
    private RoleMapper roleMapper;

    @Autowired
    public void setRoleMapper(RoleMapper roleMapper) {
        this.roleMapper = roleMapper;
    }

    @Override
    public Role selectRoleById(String id) {
        return roleMapper.selectRoleById(id);
    }
}
