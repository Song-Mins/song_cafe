package com.songmin.song.service;

import com.songmin.song.dao.BulletinDao;
import com.songmin.song.dao.CommentDao;
import com.songmin.song.domain.BulletinDto;
import com.songmin.song.domain.CommentDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    CommentDao commentDao;

    @Autowired
    BulletinDao bulletinDao;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int write(CommentDto commentDto) throws Exception {

        Integer bno = commentDto.getBno();
        BulletinDto bulletinDto = bulletinDao.selectBulletin(bno);
        System.out.println("bulletinDto = " + bulletinDto);

        bulletinDto.setComment_cnt(bulletinDto.getComment_cnt() + 1);
        bulletinDao.updateBulletin(bulletinDto);

//        throw new Exception();

        int rowCnt = commentDao.insertComment(commentDto);

        return rowCnt;
    }


    @Override
    public List<CommentDto> getList(Integer bno) throws Exception {
        return commentDao.selectBnoComment(bno);
    }

    @Override
    public List<CommentDto> getIdComments(CommentDto commentDto) throws Exception {
        return commentDao.selectIdComment(commentDto);
    }

    @Override
    public int modify(CommentDto commentDto) throws Exception {
        return commentDao.updateComment(commentDto);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int remove(Integer cno, Integer bno) throws Exception {

        BulletinDto bulletinDto = bulletinDao.selectBulletin(bno);
        bulletinDto.setComment_cnt(bulletinDto.getComment_cnt() - 1);
        bulletinDao.updateBulletin(bulletinDto);

        int rowCnt = commentDao.deleteCnoComment(cno);
        return rowCnt;
    }




}
