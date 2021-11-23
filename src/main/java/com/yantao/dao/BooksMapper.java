package com.yantao.dao;

import com.yantao.pojo.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author YanTao
 * @date 2021/5/21
 * @time 15:57
 */
public interface BooksMapper {
    Integer insert(Books books);

    Integer delete(@Param("bookId") Integer id);

    Integer update(Books books);

    Books selectOneById(@Param("bookId") Integer id);

    List<Books> selectByName(@Param("bookName") String name);

    List<Books> selectAll();
}
