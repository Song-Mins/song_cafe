package com.songmin.song.service;

import com.songmin.song.dao.BulletinDao;
import com.songmin.song.dao.CommentDao;
import com.songmin.song.domain.BulletinDto;
import com.songmin.song.domain.CommentDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class CommentServiceImplTest {

    @Autowired
    CommentService commentService;

    @Autowired
    BulletinDao bulletinDao;

    @Autowired
    CommentDao commentDao;

    @Test
    public void getList() {

    }

    @Test
    public void write() throws Exception {

    }

    @Test
    public void remove() throws Exception {



    }
}