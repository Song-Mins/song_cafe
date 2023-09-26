package com.songmin.song.service;

import com.songmin.song.dao.UserDao;
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
public class UserServiceImplTest {

    @Autowired
    UserService userService;

    @Autowired
    UserDao userDao;

    @Test
    public void register() {
    }

    @Test
    public void get() throws Exception {

    }

    @Test
    public void registerCheck() {
    }

    @Test
    public void loginCheck() throws Exception {

        userDao.deleteUser("song");

        UserDto userDto = new UserDto("song", "1234", "song", new Date(), "s.com", "01053096821");
        String id = "song";
        String pwd = "1234";

        userDao.insertUser(userDto);

        assertTrue(userService.loginCheck(id, pwd));

        userDao.deleteUser("song");

        assertFalse(userService.loginCheck(id, pwd));

    }
}