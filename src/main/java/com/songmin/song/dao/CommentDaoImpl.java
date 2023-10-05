package com.songmin.song.dao;

import com.songmin.song.domain.CommentDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentDaoImpl implements CommentDao {

    @Autowired
    SqlSession session;

    String namespace="com.songmin.song.dao.CommentMapper.";

    //  C(생성)
    @Override
    public int insertComment(CommentDto commentDto) throws Exception {
        return session.insert(namespace+"insert", commentDto);
    }


    //  R(읽기)
    @Override
    public CommentDto selectCnoComment(Integer cno) throws Exception {
        return session.selectOne(namespace+"select", cno);
    }

    @Override
    public List<CommentDto> selectBnoComment(Integer bno) throws Exception {
        return session.selectList(namespace+"selectAll", bno);
    }

    @Override
    public List<CommentDto> selectIdComment(CommentDto commentDto) {
        return session.selectList(namespace+"selectIdComments", commentDto);
    }

    @Override
    public int selectCommentCount(Integer bno) throws Exception {
        return session.selectOne(namespace+"count", bno);
    }

    //  U(수정)
    @Override
    public int updateComment(CommentDto commentDto) throws Exception {
        return session.update(namespace+"update", commentDto);
    }


    //  D(삭제)
    @Override
    public int deleteCnoComment(Integer cno) throws Exception {
        return session.delete(namespace+"delete", cno);
    }

    @Override
    public int deleteBnoComment(Integer bno) throws Exception {
        return session.delete(namespace+"deleteAll", bno);
    }

    @Override
    public int deleteIdComment(CommentDto commentDto) throws Exception {
        return session.delete(namespace+"deleteId", commentDto);
    }


}
