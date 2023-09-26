package com.songmin.song.service;

import com.songmin.song.domain.BulletinDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BulletinServiceImplTest {

    @Autowired
    BulletinService service;

    @Test
    public void bulletins() throws Exception {
        List<BulletinDto> list = service.readBulletins();
        System.out.println("list = " + list);
    }

    @Test
    public void bulletinCounts() throws Exception {
        int cnt = service.countBulletins();
        System.out.println("cnt = " + cnt);
    }

    @Test
    public void read()throws Exception {
        Integer bno = 15111;
        BulletinDto bulletinDto = service.readBulletin(bno);
        System.out.println("bulletinDto = " + bulletinDto);

    }
}