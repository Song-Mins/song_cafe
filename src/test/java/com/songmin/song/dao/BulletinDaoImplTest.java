package com.songmin.song.dao;

import com.songmin.song.domain.BulletinDto;
import com.songmin.song.domain.BulletinDto;
import com.songmin.song.domain.PageCondition;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BulletinDaoImplTest {

    @Autowired
    BulletinDao bulletinDao;

    //  C(생성)
    @Test
    public void insertBulletin() throws Exception {
        bulletinDao.deleteBulletin();
        BulletinDto bulletinDto = new BulletinDto("프로그래밍", "프로그래밍", "fff", "ggg");
        int rowCnt = bulletinDao.insertBulletin(bulletinDto);
        assertTrue(rowCnt == 1);
    }
    @Test
    public void insertBulletins() throws Exception {
        bulletinDao.deleteBulletin();
        for(int i=1; i<45; i++) {
            BulletinDto bulletinDto = new BulletinDto("프로그래밍", "자바 게시판","자바 프로그래밍 " + i, "자바 프로그래밍 자바 프로그래밍 자바 프로그래밍 자바 프로그래밍 자바 프로그래밍 자바 프로그래밍 자바 프로그래밍", "ssoogg5309");
            bulletinDao.insertBulletin(bulletinDto);
        }
        for(int i=1; i<45; i++) {
            BulletinDto bulletinDto = new BulletinDto("프로그래밍", "파이썬 게시판","파이썬 프로그래밍 " + i, "파이썬 프로그래밍 파이썬 프로그래밍 파이썬 프로그래밍 파이썬 프로그래밍 파이썬 프로그래밍 파이썬 프로그래밍 파이썬 프로그래밍", "ssoogg5309");
            bulletinDao.insertBulletin(bulletinDto);
        }
        for(int i=1; i<45; i++) {
            BulletinDto bulletinDto = new BulletinDto("프로그래밍", "C언어 게시판","C언어 프로그래밍 " + i, "C언어 프로그래밍 C언어 프로그래밍 C언어 프로그래밍 C언어 프로그래밍 C언어 프로그래밍 C언어 프로그래밍 C언어 프로그래밍", "ssoogg5309");
            bulletinDao.insertBulletin(bulletinDto);
        }
    }

    //  R(읽기)
    @Test
    public void selectBnoBulletin() throws Exception {
        System.out.println("bulletinDao.selectBulletin(16736) = " + bulletinDao.selectBulletin(16736));

    }
    @Test
    public void selectAllBulletins() throws Exception {
        List<BulletinDto> list = bulletinDao.selectBulletin();
        System.out.println("list = " + list);
    }
    @Test
    public void selectIdBulletin() throws Exception {
    }

    @Test
    public void selectPcBulletin1() throws Exception {
        PageCondition pc = new PageCondition();
        pc.setCafe_name("programming");
        pc.setOption("A");
        System.out.println("pc = " + pc);

        List<BulletinDto> list = bulletinDao.selectBulletin(pc);
        System.out.println("list.size() = " + list.size());
        System.out.println("list = " + list);
    }

    @Test
    public void selectPcBulletin() throws Exception {
        //  게시글 모두 삭제
        bulletinDao.deleteBulletin();

        //  게시글 추가  (title = title1~100, content = hello1~100, name = song)
        for(int i=1; i<=100; i++) {
            BulletinDto bulletinDto = new BulletinDto("programming", "title" + i, "hello" + i, "song");
            bulletinDao.insertBulletin(bulletinDto);
        }

        //  게시글 저장할 리스트 생성
        List<BulletinDto> list = null;

/////// 0. option = "", keyword = "", id = ""
        PageCondition pc = new PageCondition();
        list = bulletinDao.selectBulletin(pc);
        System.out.println("list = " + list);
        assertTrue(list.size() == 10);

/////// 1. option = A,  keyword = ?
        PageCondition pc1 = new PageCondition();
        pc1.setOption("A");
        pc1.setKeyword("title2");

        list = bulletinDao.selectBulletin(pc1);
        System.out.println("list = " + list);
        assertTrue(list.size() == 10);

        pc1.setPage(2);
        list = bulletinDao.selectBulletin(pc1);
        System.out.println("list = " + list);
        assertTrue(list.size() == 1);


/////// 2. option = T,  keyword = ?
        PageCondition pc2 = new PageCondition();
        pc2.setOption("T");
        pc2.setKeyword("title2");

        list = bulletinDao.selectBulletin(pc2);
        System.out.println("list = " + list);
        assertTrue(list.size() == 10);

        pc2.setPage(2);
        list = bulletinDao.selectBulletin(pc2);
        System.out.println("list = " + list);
        assertTrue(list.size() == 1);

/////// 3. option = C,  keyword = ?
        PageCondition pc3 = new PageCondition();
        pc3.setOption("C");
        pc3.setKeyword("hello2");

        list = bulletinDao.selectBulletin(pc3);
        System.out.println("list = " + list);
        assertTrue(list.size() == 10);

        pc3.setPage(2);
        list = bulletinDao.selectBulletin(pc3);
        System.out.println("list = " + list);
        assertTrue(list.size() == 1);

/////// 4. id = ?
        PageCondition pc4 = new PageCondition();
        pc4.setReadId("song");

        list = bulletinDao.selectBulletin(pc4);
        System.out.println("list = " + list);
        assertTrue(list.size() == 10);

        pc4.setPage(10);
        list = bulletinDao.selectBulletin(pc4);
        System.out.println("list = " + list);
        assertTrue(list.size() == 10);

        pc4.setPage(11);
        list = bulletinDao.selectBulletin(pc4);
        System.out.println("list = " + list);
        assertTrue(list.size() == 0);

/////// 5. commentBnoList = ?
        PageCondition pc5 = new PageCondition();
        System.out.println("pc5 = " + pc5);

        List<BulletinDto> bulletinDtoList = bulletinDao.selectBulletin();

        List<Integer> commentBnoList = new ArrayList<>();

        for (BulletinDto bulletinDto : bulletinDtoList) {
            commentBnoList.add(bulletinDto.getBno());
        }

        pc5.setCommentBnoList(commentBnoList);

        list = bulletinDao.selectBulletin(pc5);
        System.out.println("list = " + list);
        assertTrue(list.size() == 10);

        pc5.setPage(5);
        list = bulletinDao.selectBulletin(pc5);
        System.out.println("list = " + list);
        assertTrue(list.size() == 10);

    }


    @Test
    public void countBulletin() throws Exception {
        int cnt = bulletinDao.countBulletin();
        System.out.println("cnt = " + cnt);
    }
    @Test
    public void countPcBulletin() throws Exception {
        bulletinDao.deleteBulletin();
        for(int i=1; i<=100; i++) {
            BulletinDto bulletinDto = new BulletinDto("programming", "title" + i, "hello" + i, "song");
            bulletinDao.insertBulletin(bulletinDto);
        }

        int cnt;

        PageCondition pc = new PageCondition();
        cnt = bulletinDao.countBulletin(pc);
        assertTrue(cnt == 100);

        PageCondition pc1 = new PageCondition();
        pc1.setOption("T");
        pc1.setKeyword("title1");
        cnt = bulletinDao.countBulletin(pc1);
        assertTrue(cnt == 12);

        PageCondition pc2 = new PageCondition();
        pc2.setOption("C");
        pc2.setKeyword("hello2");
        cnt = bulletinDao.countBulletin(pc2);
        assertTrue(cnt == 11);

        PageCondition pc3 = new PageCondition();
        pc3.setOption("A");
        pc3.setKeyword("hello2");
        cnt = bulletinDao.countBulletin(pc3);
        assertTrue(cnt == 11);

        PageCondition pc4 = new PageCondition();
        pc4.setReadId("song");
        cnt = bulletinDao.countBulletin(pc4);
        assertTrue(cnt == 100);
    }


    //  U(수정)
    @Test
    public void updateBulletin() throws Exception {
    }



    //  D(삭제)
    @Test
    public void deleteAllBulletins() throws Exception {
        bulletinDao.deleteBulletin();
    }
    @Test
    public void deleteBulletin() throws Exception {
    }










}