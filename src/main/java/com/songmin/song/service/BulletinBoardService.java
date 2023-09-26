package com.songmin.song.service;

import com.songmin.song.domain.BulletinBoardDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BulletinBoardService {
    int addBulletinBoard(BulletinBoardDto bulletinBoardDto) throws Exception;

    List<String> readBulletin_board(String cafe_name) throws Exception;

}
