package com.songmin.song.service;

import com.songmin.song.dao.BulletinBoardDao;
import com.songmin.song.domain.BulletinBoardDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BulletinBoardServiceImpl implements BulletinBoardService {

    @Autowired
    BulletinBoardDao bulletinBoardDao;

    public int addBulletinBoard(BulletinBoardDto bulletinBoardDto) throws Exception {
        List<String> bulletinBoardList = bulletinBoardDao.selectBulletin_board(bulletinBoardDto.getCafe_name());

        if (bulletinBoardList.contains(bulletinBoardDto.getName())) {
            return 10;
        } else {
            return bulletinBoardDao.insertBulletinBoard(bulletinBoardDto);

        }

    }


    @Override
    public List<String> readBulletin_board(String cafe_name) throws Exception {
        return bulletinBoardDao.selectBulletin_board(cafe_name);
    }
}
