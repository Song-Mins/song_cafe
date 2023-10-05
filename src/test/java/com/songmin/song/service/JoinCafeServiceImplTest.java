package com.songmin.song.service;

import com.songmin.song.domain.BulletinDto;
import com.songmin.song.domain.CommentDto;
import com.songmin.song.domain.JoinCafeDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class JoinCafeServiceImplTest {

    @Autowired
    JoinCafeService joinCafeService;

    @Test
    public void read() {
    }

    @Test
    public void add() {
    }

    @Test
    public void remove() throws Exception {
        JoinCafeDto joinCafeDto = new JoinCafeDto();
        joinCafeDto.setJoin_cafe("프로그래밍");
        joinCafeDto.setId("s");

        assertTrue(joinCafeService.remove(joinCafeDto) == 1);

    }
}