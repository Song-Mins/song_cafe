package com.songmin.song.dao;

import com.songmin.song.domain.JoinCafeDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class JoinCafeDaoImpl implements JoinCafeDao {

    @Autowired
    SqlSession session;

    String namespace = "com.songmin.song.dao.JoinCafeMapper.";

    public List<String> selectJoinCafe(String id) throws Exception {
        return session.selectList(namespace + "select", id);
    }

    @Override
    public int insertJoinCafe(JoinCafeDto joinCafeDto) throws Exception {
        return session.insert(namespace + "insert", joinCafeDto);
    }

    @Override
    public int deleteJoinCafe(JoinCafeDto joinCafeDto) throws Exception {
        return session.delete(namespace + "delete", joinCafeDto);
    }

}
