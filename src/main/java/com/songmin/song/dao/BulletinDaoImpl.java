package com.songmin.song.dao;

import com.songmin.song.domain.BulletinDto;
import com.songmin.song.domain.PageCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BulletinDaoImpl implements BulletinDao {

    @Autowired
    SqlSession session;

    String namespace = "com.songmin.song.dao.BulletinMapper.";

    //  C(생성)
    @Override
    public int insertBulletin(BulletinDto bulletinDto) throws Exception {
        return session.insert(namespace+"insert", bulletinDto);
    }

    //  R(읽기)
    @Override
    public BulletinDto selectBulletin(Integer bno) throws Exception {
        return session.selectOne(namespace+"selectBulletin", bno);
    }

    @Override
    public List<BulletinDto> selectBulletin() throws Exception {
        return session.selectList(namespace+"selectAll");
    }

    @Override
    public List<BulletinDto> selectBulletin(PageCondition pc) throws Exception {
        return session.selectList(namespace+"selectPcBulletin", pc);
    }
    @Override
    public int countBulletin() throws Exception {
        return session.selectOne(namespace+"count");
    }
    @Override
    public int countBulletin(PageCondition pc) throws Exception {
        return session.selectOne(namespace+"countPcBulletin", pc);
    }

    //  U(수정)
    @Override
    public int updateBulletin(BulletinDto bulletinDto) throws Exception {
        return session.update(namespace+"update", bulletinDto);
    }

    //  D(삭제)
    @Override
    public void deleteBulletin() throws Exception {
        session.delete(namespace+"deleteAll");
    }
    @Override
    public int deleteBulletin(BulletinDto bulletinDto) throws Exception {
        return session.delete(namespace+"deleteId", bulletinDto);
    }
    @Override
    public int deleteBulletin(Integer bno) throws Exception {
        return session.delete(namespace+"deleteBno", bno);
    }


}
