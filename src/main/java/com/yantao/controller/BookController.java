package com.yantao.controller;

import com.yantao.pojo.Books;
import com.yantao.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 *
 * @author YanTao
 * @date 2021/5/21
 * @time 20:04
 */
@Controller
@RequestMapping("/book")
public class BookController {
//    controller 调 service 层
    private BookService bookService;

    @Autowired
    @Qualifier("bookService")
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    //    查询全部书籍，并且返回到一个书籍展示页面
    @RequestMapping({"/", "", "/all"})
    public String selectAllBooks(){
        return "allBooks";
    }

//    跳转到添加书籍页面
    @RequestMapping("/toAdd")
    public String toAddPage(){
        return "add";
    }

//    添加书籍，并跳转到书籍展示页面
    @RequestMapping("/add")
    public String insert(Books books){
        System.out.println("books==>" + books);
        bookService.insert(books);
        return "redirect:/book/all";    //使用redirect重东西，可以防止用户（使用f5刷新）重复提交表单
    }

//    跳转到修改书籍页面
    @RequestMapping("/toUpdate/{bookId}")
    public String toUpdatePage(@PathVariable("bookId") int id, Model model){
        Books book = bookService.selectOneById(id);
        model.addAttribute("book", book);
        return "update";
    }

//    更改书籍，并跳转到书籍展示页面
    @RequestMapping("/update")
    public String update(Books books){
        System.out.println("books==>" + books);
        bookService.update(books);
        return "redirect:/book/all";
    }

//    删除书籍，并跳转到书籍展示页面
    @RequestMapping("/delete")
    public String delete(@RequestParam("id") int bookId){
        bookService.delete(bookId);
        return "redirect:/book/all";
    }

    @RequestMapping("/del")
    @ResponseBody
    public Map<String, Object> del(int id){
        Integer i = bookService.delete(id);
        Map<String, Object> map = new HashMap<>();
        if (i > 0){
            map.put("code", 0);
            map.put("msg", "删除成功！");
            return map;
        }
        map.put("code", 1);
        map.put("msg", "删除失败！");
        return map;
    }

    @RequestMapping("del-multiple")
    @ResponseBody
    public Map<String, Object> deleteMultiple(@RequestParam("ids[]") Integer[] ids, HttpServletRequest request){
        int sum = 0;
        Map<String, Object> map = new HashMap<>();
        for (Integer id : ids) {
            bookService.delete(id);
            sum += 1;
        }
        if (sum > 0){
            if (sum == ids.length){
                map.put("code", 0);
                map.put("msg", "删除成功！");
                return map;
            }
            map.put("code", 0);
            map.put("msg", "但未完全删除成功！");
            return map;
        }
        map.put("code", 0);
        map.put("msg", "删除失败！");
        return map;
    }

//    按照名字查询书籍
    @RequestMapping("/search")
    public String selectBookByName(@RequestParam(value = "bookName", required = false) String name, Model model){
        List<Books> books = bookService.selectByName(name);
        model.addAttribute("books", books);
        return "allBooks";
    }

    @RequestMapping("/allBooks")
    @ResponseBody
    public Map<String, Object> getBooksByName(String name){
        List<Books> books = bookService.selectByName(name);
        Map<String, Object> map = new HashMap<>();
        if (books != null){
            map.put("code", 0);
            map.put("msg", "success");
            map.put("count", books.size());
            map.put("data", books);
            return map;
        }
        map.put("code", 1);
        map.put("msg", "暂未查询到相关书籍信息！");
        return map;
    }
}
