package kr.co.nandsoft;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;
import java.sql.Connection;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/applicationContext.xml" })
public class DBConnTest {

    @Autowired
    private DataSource dataSource;

    @Test
    public void testConnection() throws Exception {

        try (Connection con = dataSource.getConnection()) {

            System.out.println("\n >>>>>>>>>> Connection 출력 : " + con + "\n");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}