package com.songmin.song.service;

import com.songmin.song.dao.BulletinBoardDao;
import com.songmin.song.dao.BulletinDao;
import com.songmin.song.dao.CafeDao;
import com.songmin.song.dao.JoinCafeDao;
import com.songmin.song.domain.BulletinBoardDto;
import com.songmin.song.domain.CafeDto;
import com.songmin.song.domain.JoinCafeDto;
import com.songmin.song.domain.PageCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CafeServiceImpl implements CafeService {

    @Autowired
    CafeDao cafeDao;

    @Autowired
    BulletinBoardDao bulletinBoardDao;

    @Autowired
    JoinCafeDao joinCafeDao;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int add(CafeDto cafeDto) throws Exception {
        //  카페 생성
        cafeDao.insertCafe(cafeDto);

        // 게시판 생성
        BulletinBoardDto bulletinBoardDto = new BulletinBoardDto();
        bulletinBoardDto.setCafe_name(cafeDto.getName());
        bulletinBoardDto.setName("전체 게시판");
        int rowCnt = bulletinBoardDao.insertBulletinBoard(bulletinBoardDto);


        //  가입 카페 생성
        JoinCafeDto joinCafeDto = new JoinCafeDto();
        joinCafeDto.setJoin_cafe(cafeDto.getName());
        joinCafeDto.setId(cafeDto.getManager_id());
        joinCafeDao.insertJoinCafe(joinCafeDto);

        return rowCnt;
    }

    @Override
    public CafeDto read(String cafe_kind) throws Exception {
        return cafeDao.selectCafe(cafe_kind);
    }

    @Override
    public List<CafeDto> getAllCafe() throws Exception {
        return cafeDao.selectCafe();
    }

    @Override
    public int count(PageCondition pc) throws Exception {
        return cafeDao.countCafe(pc);
    }


    @Override
    public List<CafeDto> getPageConditionBoard(PageCondition pc) throws Exception {
        return cafeDao.selectCafe(pc);
    }


}
