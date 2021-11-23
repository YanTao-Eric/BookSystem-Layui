import com.yantao.pojo.Books;
import com.yantao.service.BookService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by IntelliJ IDEA.
 *
 * @author YanTao
 * @date 2021/5/22
 * @time 14:01
 */
public class BookTest {
    @Test
    public void test1(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        BookService bookService = context.getBean("bookService", BookService.class);
        for (Books books : bookService.selectAll()) {
            System.out.println(books.toString());
        }
    }
}
