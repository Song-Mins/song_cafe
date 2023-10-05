package com.songmin.song.dao;

import com.songmin.song.domain.CommentDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class CommentDaoImplTest {

    @Autowired
    CommentDao dao;

    @Test
    public void test() throws Exception {
        System.out.println("dao.selectCnoComment(16743) = " + dao.selectCnoComment(238));
    }

    @Test
    public void insert() throws Exception {

    }

    @Test
    public void count() throws Exception {

    }

    @Test
    public void select() throws Exception {


    }

    @Test
    public void selectAll() throws Exception {

    }

    @Test
    public void delete() throws Exception {


    }

    @Test
    public void deleteAll() throws Exception {

    }

    @Test
    public void update() throws Exception {

    }
}