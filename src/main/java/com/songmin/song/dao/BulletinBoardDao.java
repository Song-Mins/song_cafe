package com.songmin.song.dao;

import com.songmin.song.domain.BulletinBoardDto;

import java.util.List;

public interface BulletinBoardDao {
    int insertBulletinBoard(BulletinBoardDto bulletinBoardDto) throws Exception;

    List<String> selectBulletin_board(String cafe_name) throws Exception;

}
