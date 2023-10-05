package com.songmin.song.service;

import com.songmin.song.dao.BulletinDao;
import com.songmin.song.dao.CommentDao;
import com.songmin.song.dao.JoinCafeDao;
import com.songmin.song.domain.BulletinDto;
import com.songmin.song.domain.CommentDto;
import com.songmin.song.domain.JoinCafeDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class JoinCafeServiceImpl implements JoinCafeService {

    @Autowired
    JoinCafeDao joinCafeDao;
    @Autowired
    BulletinDao bulletinDao;
    @Autowired
    CommentDao commentDao;

    @Override
    public List<String> read(String id) throws Exception {
        return joinCafeDao.selectJoinCafe(id);
    }

    @Override
    public int add(JoinCafeDto joinCafeDto) throws Exception{
        return joinCafeDao.insertJoinCafe(joinCafeDto);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int remove(JoinCafeDto joinCafeDto) throws Exception {

        BulletinDto bulletinDto = new BulletinDto();
        bulletinDto.setCafe_name(joinCafeDto.getJoin_cafe());
        bulletinDto.setId(joinCafeDto.getId());
        bulletinDao.deleteBulletin(bulletinDto);

        CommentDto commentDto = new CommentDto();
        commentDto.setCafe_name(joinCafeDto.getJoin_cafe());
        commentDto.setId(joinCafeDto.getId());
        commentDao.deleteIdComment(commentDto);

        return joinCafeDao.deleteJoinCafe(joinCafeDto);
    }

}
