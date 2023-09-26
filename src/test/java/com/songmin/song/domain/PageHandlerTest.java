package com.songmin.song.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class PageHandlerTest {

    @Test
    public void test() {
        PageCondition pc = new PageCondition();
        System.out.println("pc.getReadId() = " + pc.getReadId());
        System.out.println("pc.getKeyword() = " + pc.getKeyword());
        System.out.println("pc.getCommentBnoList() = " + pc.getCommentBnoList());
        System.out.println("pc = " + pc);
    }

}