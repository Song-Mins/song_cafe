package com.songmin.song.service;

import com.songmin.song.dao.BulletinDao;
import com.songmin.song.dao.CommentDao;
import com.songmin.song.domain.BulletinDto;
import com.songmin.song.domain.PageCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class BulletinServiceImpl implements BulletinService {

    @Autowired
    BulletinDao bulletinDao;

    @Autowired
    CommentDao commentDao;

    @Override
    public int addBulletin(BulletinDto bulletinDto) throws Exception {
        return bulletinDao.insertBulletin(bulletinDto);
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public BulletinDto readBulletin(Integer bno) throws Exception {

        //  게시글 읽어오기
        BulletinDto bulletinDto = bulletinDao.selectBulletin(bno);

        //  게시글의 조회수 +1 하기
        bulletinDto.setView_cnt(bulletinDto.getView_cnt() + 1);

        // DB 업데이트 하기
        bulletinDao.updateBulletin(bulletinDto);

        return bulletinDto;
    }



    @Override
    public List<BulletinDto> readBulletins() throws Exception {
        return bulletinDao.selectBulletin();
    }

    @Override
    public List<BulletinDto> readPageConditionBulletins(PageCondition pc) throws Exception {
        return bulletinDao.selectBulletin(pc);
    }

    @Override
    public int countBulletins() throws Exception {
        return bulletinDao.countBulletin();
    }

    @Override
    public int countPageConditionBulletins(PageCondition pc) throws Exception {
        return bulletinDao.countBulletin(pc);
    }


    @Override
    public int updateBulletin(BulletinDto bulletinDto) throws Exception {
        return bulletinDao.updateBulletin(bulletinDto);
    }


    @Override
    @Transactional
    public int removeBulletin(Integer bno) throws Exception {
        commentDao.deleteBnoComment(bno);
        return bulletinDao.deleteBulletin(bno);
    }



}
