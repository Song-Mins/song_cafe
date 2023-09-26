package com.songmin.song.dao;

import com.songmin.song.domain.JoinCafeDto;

import java.util.List;

public interface JoinCafeDao {
    List<String> selectJoinCafe(String id) throws Exception;

    int insertJoinCafe(JoinCafeDto joinCafeDto) throws Exception;

    int deleteJoinCafe(JoinCafeDto joinCafeDto) throws Exception;
}
