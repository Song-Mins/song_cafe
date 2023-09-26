package com.songmin.song.dao;

import com.songmin.song.domain.CafeDto;
import com.songmin.song.domain.PageCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CafeDaoImpl implements CafeDao {

    @Autowired
    SqlSession session;

    String namespace = "com.songmin.song.dao.CafeMapper.";

    //  C(생성)
    @Override
    public int insertCafe(CafeDto cafeDto) throws Exception {
        return session.insert(namespace+"insert", cafeDto);
    }

    //  R(읽기)
    @Override
    public CafeDto selectCafe(String name) throws Exception {
        return session.selectOne(namespace+"select", name);
    }
    @Override
    public List<CafeDto> selectCafe(PageCondition pc) throws Exception {
        return session.selectList(namespace+"selectPageCondition", pc);
    }
    @Override
    public List<CafeDto> selectCafe() throws Exception {
        return session.selectList(namespace+"selectAll");
    }
    @Override
    public int countCafe(PageCondition pc) throws Exception {
        return session.selectOne(namespace + "countPageCondition", pc);
    }

    //  U(수정)
    @Override
    public int updateCafe(String name) throws Exception {
        return session.update(namespace+"update", name);
    }

    //  D(삭제)
    @Override
    public int deleteCafe(String name) throws Exception {
        return session.delete(namespace+"delete", name);
    }
    @Override
    public void deleteCafe() throws Exception {
        session.delete(namespace+"deleteAll");
    }
}
