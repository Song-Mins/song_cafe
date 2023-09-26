package com.songmin.song.service;

import com.songmin.song.domain.JoinCafeDto;

import java.util.List;

public interface JoinCafeService {
    List<String> read(String id) throws Exception;

    int add(JoinCafeDto joinCafeDto) throws Exception;

    int remove(JoinCafeDto joinCafeDto) throws Exception;
}
