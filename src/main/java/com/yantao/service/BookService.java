package com.yantao.service;

import com.yantao.pojo.Books;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author YanTao
 * @date 2021/5/21
 * @time 16:36
 */
public interface BookService {
    Integer insert(Books books);

    Integer delete(Integer id);

    Integer update(Books books);

    Books selectOneById(Integer id);

    List<Books> selectByName(String name);

    List<Books> selectAll();
}
