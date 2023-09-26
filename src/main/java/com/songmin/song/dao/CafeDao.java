package com.songmin.song.dao;

import com.songmin.song.domain.CafeDto;
import com.songmin.song.domain.PageCondition;

import java.util.List;

public interface CafeDao {
    //  C(생성)
    int insertCafe(CafeDto cafeDto) throws Exception;

    //  R(읽기)
    CafeDto selectCafe(String name) throws Exception;

    List<CafeDto> selectCafe(PageCondition pc) throws Exception;

    List<CafeDto> selectCafe() throws Exception;

    int countCafe(PageCondition pc) throws Exception;

    //  U(수정)
    int updateCafe(String name) throws Exception;

    //  D(삭제)
    int deleteCafe(String name) throws Exception;

    void deleteCafe() throws Exception;
}
