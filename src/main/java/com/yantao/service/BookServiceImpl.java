package com.yantao.service;

import com.yantao.dao.BooksMapper;
import com.yantao.pojo.Books;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author YanTao
 * @date 2021/5/21
 * @time 16:38
 */
public class BookServiceImpl implements BookService{
    private BooksMapper booksMapper;

    public void setBooksMapper(BooksMapper booksMapper) {
        this.booksMapper = booksMapper;
    }

    @Override
    public Integer insert(Books books) {
        return booksMapper.insert(books);
    }

    @Override
    public Integer delete(Integer id) {
        return booksMapper.delete(id);
    }

    @Override
    public Integer update(Books books) {
        return booksMapper.update(books);
    }

    @Override
    public Books selectOneById(Integer id) {
        return booksMapper.selectOneById(id);
    }

    @Override
    public List<Books> selectByName(String name) {
        return booksMapper.selectByName(name);
    }

    @Override
    public List<Books> selectAll() {
        return booksMapper.selectAll();
    }
}
