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
        dao.deleteBnoComment(10216);

        CommentDto commentDto = new CommentDto(10216, "hello", "song");
        int rowCnt = dao.insertComment(commentDto);
        assertTrue(rowCnt == 1);
    }

    @Test
    public void count() throws Exception {
        dao.deleteBnoComment(1);
        int rowCnt = dao.selectCommentCount(1);
        assertTrue(rowCnt == 0);

        CommentDto commentDto = new CommentDto(1, "hello", "song");
        dao.insertComment(commentDto);dao.insertComment(commentDto);dao.insertComment(commentDto);
        rowCnt = dao.selectCommentCount(1);
        assertTrue(rowCnt == 3);
    }

    @Test
    public void select() throws Exception {
        dao.deleteBnoComment(1);

        CommentDto commentDto = new CommentDto(1, "hello", "song");
        dao.insertComment(commentDto);

        List<CommentDto> list = dao.selectBnoComment(1);
        int cno = list.get(0).getCno();
        Integer bno = list.get(0).getBno();
        String comment = list.get(0).getComment();
        String commenter = list.get(0).getId();

        CommentDto select_commentDto = dao.selectCnoComment(cno);
        assertTrue(bno.equals(select_commentDto.getBno()));
        assertTrue(comment.equals(select_commentDto.getComment()));
        assertTrue(commenter.equals(select_commentDto.getId()));
        System.out.println("select_commentDto = " + select_commentDto);

    }

    @Test
    public void selectAll() throws Exception {
        dao.deleteBnoComment(1);

        CommentDto commentDto = new CommentDto(1, "hello", "song");
        dao.insertComment(commentDto);dao.insertComment(commentDto);dao.insertComment(commentDto);
        List<CommentDto> list = dao.selectBnoComment(1);
        assertTrue(list.size() == 3);
        System.out.println("list = " + list);
    }

    @Test
    public void delete() throws Exception {
        dao.deleteBnoComment(1);

        CommentDto commentDto = new CommentDto(1, "hello", "song");
        dao.insertComment(commentDto);
        List<CommentDto> list = dao.selectBnoComment(1);
        int cno = list.get(0).getCno();

        assertTrue(dao.deleteCnoComment(cno) == 1);

    }

    @Test
    public void deleteAll() throws Exception {
        dao.deleteBnoComment(1);

        CommentDto commentDto = new CommentDto(1, "hello", "song");
        dao.insertComment(commentDto);dao.insertComment(commentDto);dao.insertComment(commentDto);

        assertTrue(dao.deleteCnoComment(1) == 3);
    }

    @Test
    public void update() throws Exception {
        dao.deleteBnoComment(1);

        CommentDto commentDto = new CommentDto(1, "hello", "song");
        dao.insertComment(commentDto);

        List<CommentDto> list = dao.selectBnoComment(1);
        System.out.println("list = " + list);
        int cno = list.get(0).getCno();

        commentDto.setCno(cno);
        commentDto.setComment("nice to meet you");

        assertTrue(dao.updateComment(commentDto) == 1);

        CommentDto select_commentDto = dao.selectCnoComment(cno);

        assertTrue(commentDto.getBno().equals(select_commentDto.getBno()));
        assertTrue(commentDto.getComment().equals(select_commentDto.getComment()));
        assertTrue(commentDto.getId().equals(select_commentDto.getId()));

        System.out.println("commentDto = " + commentDto);
        System.out.println("select_commentDto = " + select_commentDto);
    }
}