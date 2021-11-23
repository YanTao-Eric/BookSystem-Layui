package com.yantao.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 *
 * @author YanTao
 * @date 2021/9/12
 * @time 20:54
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private Integer id;
    private String username;
    private String password;
    private String nickname;
    private Integer age;
    private Character sex;
    private Date birthday;
    private Integer status;
    private Date createdtime;
    private Integer rid;

    public User(String username, String password, String nickname, Integer age, Character sex, Date birthday, Integer rid) {
        this.username = username;
        this.password = password;
        this.nickname = nickname;
        this.age = age;
        this.sex = sex;
        this.birthday = birthday;
        this.rid = rid;
    }
}
