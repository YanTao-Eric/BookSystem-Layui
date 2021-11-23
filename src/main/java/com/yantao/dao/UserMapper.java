package com.yantao.dao;

import com.yantao.pojo.User;
import org.apache.ibatis.annotations.Param;

/**
 * Created by IntelliJ IDEA.
 *
 * @author YanTao
 * @date 2021/9/12
 * @time 21:10
 */
public interface UserMapper {
    User selectUserById(@Param("id") String id);

    int insert(User user);
}
