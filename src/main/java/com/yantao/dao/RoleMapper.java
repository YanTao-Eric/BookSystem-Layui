package com.yantao.dao;

import com.yantao.pojo.Role;
import org.apache.ibatis.annotations.Param;

/**
 * Created by IntelliJ IDEA.
 *
 * @author YanTao
 * @date 2021/9/12
 * @time 21:17
 */
public interface RoleMapper {
    Role selectRoleById(@Param("id") String id);
}
