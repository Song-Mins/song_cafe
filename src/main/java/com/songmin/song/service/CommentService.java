package com.songmin.song.service;

import com.songmin.song.domain.CommentDto;

import java.util.List;

public interface CommentService {

    int write(CommentDto commentDto) throws Exception;

    List<CommentDto> getList(Integer bno) throws Exception;

    List<CommentDto> getIdComments(CommentDto commentDto) throws Exception;

    int modify(CommentDto commentDto) throws Exception;

    int remove(Integer cno, Integer bno) throws Exception;




}
