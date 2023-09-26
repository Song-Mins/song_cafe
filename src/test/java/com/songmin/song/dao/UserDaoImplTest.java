package com.songmin.song.dao;

import com.songmin.song.domain.UserDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class UserDaoImplTest {

    @Autowired
    UserDao dao;

    @Test
    public void insertUser() throws Exception {
        dao.deleteAll();
        UserDto user = new UserDto("song", "0928", "민석", new Date(),"sss@sss", "01053096821");
        int rowCnt = dao.insertUser(user);
        assertTrue(rowCnt == 1);
    }

    @Test
    public void deleteUser() throws Exception {
        dao.deleteAll();
        UserDto user = new UserDto("song", "0928", "민석", new Date(),"sss@sss", "01053096821");        dao.insertUser(user);

        int rowCnt = dao.deleteUser("song");
        assertTrue(rowCnt == 1);
    }

    @Test
    public void updateUser() throws Exception {
        dao.deleteAll();
        UserDto user = new UserDto("song", "0928", "민석", new Date(),"sss@sss", "01053096821");
        UserDto user1 = new UserDto("song", "0928", "민석", new Date(),"sss@sss", "01053096821");
        dao.insertUser(user);

        int rowCnt = dao.updateUser(user1);
        assertTrue(rowCnt == 1);
    }

    @Test
    public void selectUser() throws Exception {
        dao.deleteAll();
        UserDto user = new UserDto("song", "0928", "민석", new Date(),"sss@sss", "01053096821");
        dao.insertUser(user);

        UserDto user1 = dao.selectUser("song");
        System.out.println("user = " + user);
        System.out.println("user1 = " + user1);
    }

    @Test
    public void selectDtoUser() throws Exception {
        dao.deleteAll();
        UserDto user = new UserDto("song", "0928", "민석", new Date(),"sss@sss", "01053096821");
        dao.insertUser(user);

        UserDto user1 = new UserDto();
        user1.setName("민석");
        user1.setEmail("sss@sss");
        user1.setPhone("01053096821");

        System.out.println("user1 = " + user1);

        UserDto user2 = dao.selectUser(user1);
        System.out.println("user2 = " + user2);

    }

    @Test
    public void deleteAll() throws Exception {
        dao.deleteAll();
    }
}