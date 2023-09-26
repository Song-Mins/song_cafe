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
        bulletinDao.deleteBulletin();

        BulletinDto bulletinDto = new BulletinDto("programming", "BulletinTitle", "BulletinContent", "song");
        bulletinDao.insertBulletin(bulletinDto);

        Integer bnoo = bulletinDao.selectBulletin().get(0).getBno();
        Integer bno = bnoo;

        CommentDto commentDto = new CommentDto(bnoo, "commentContent", "kim");
        assertTrue(commentService.write(commentDto) == 1);

        assertTrue( bulletinDao.selectBulletin(bno).getComment_cnt() == 1);
    }

    @Test
    public void remove() throws Exception {
        bulletinDao.deleteBulletin();

        BulletinDto bulletinDto = new BulletinDto("programming","게시물 제목 입니다", "게시물 내용 입니다", "song");
        bulletinDao.insertBulletin(bulletinDto);

        int bnoo = bulletinDao.selectBulletin().get(0).getBno();
        Integer bno = bnoo;

        CommentDto commentDto = new CommentDto(bnoo, "댓글 내용 입니다.", "kim");
        commentService.write(commentDto);

        assertTrue(bulletinDao.selectBulletin(bno).getComment_cnt() == 1);

        int cno = commentService.getList(bnoo).get(0).getCno();
        assertTrue(commentService.remove(cno, bno) == 1);

        assertTrue(bulletinDao.selectBulletin(bno).getComment_cnt() == 0);


    }
}