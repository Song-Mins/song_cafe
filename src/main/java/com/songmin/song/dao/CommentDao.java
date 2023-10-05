package com.songmin.song.dao;

import com.songmin.song.domain.CommentDto;

import java.util.List;

public interface CommentDao {
    //  C(생성)
    int insertComment(CommentDto commentDto) throws Exception;

    //  R(읽기)
    CommentDto selectCnoComment(Integer cno) throws Exception;
    List<CommentDto> selectBnoComment(Integer bno) throws Exception;
    List<CommentDto> selectIdComment(CommentDto commentDto) throws Exception;
    int selectCommentCount(Integer bno) throws Exception;

    //  U(수정)
    int updateComment(CommentDto commentDto) throws Exception;

    //  D(삭제)
    int deleteCnoComment(Integer cno) throws Exception;
    int deleteBnoComment(Integer bno) throws Exception;
    int deleteIdComment(CommentDto commentDto) throws Exception;
}
