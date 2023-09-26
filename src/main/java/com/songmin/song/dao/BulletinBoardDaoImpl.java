package com.songmin.song.dao;

import com.songmin.song.domain.BulletinBoardDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BulletinBoardDaoImpl  implements BulletinBoardDao {

    @Autowired
    SqlSession session;

    String namespace = "com.songmin.song.dao.BulletinBoardMapper.";

    @Override
    public List<String> selectBulletin_board(String cafe_name) throws Exception {
        return session.selectList(namespace+"selectBulletin_board", cafe_name);
    }

    @Override
    public int insertBulletinBoard(BulletinBoardDto bulletinBoardDto) throws Exception {
        return session.insert(namespace + "insert", bulletinBoardDto);
    }

}
