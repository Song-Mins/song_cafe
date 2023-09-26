package com.songmin.song.service;

import com.songmin.song.domain.CafeDto;
import com.songmin.song.domain.PageCondition;

import java.util.List;

public interface CafeService {

    int add(CafeDto cafeDto) throws Exception;

    CafeDto read(String cafe_kind) throws Exception;

    List<CafeDto> getAllCafe() throws Exception;

    List<CafeDto> getPageConditionBoard(PageCondition pc) throws Exception;

    int count(PageCondition pc) throws Exception;
}
