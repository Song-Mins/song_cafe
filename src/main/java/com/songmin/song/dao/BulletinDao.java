package com.songmin.song.dao;

import com.songmin.song.domain.BulletinDto;
import com.songmin.song.domain.PageCondition;

import java.util.List;
import java.util.Map;

public interface BulletinDao {
    //  C(생성)
    int insertBulletin(BulletinDto bulletinDto) throws Exception;

    //  R(읽기)
    BulletinDto selectBulletin(Integer bno) throws Exception;
    List<BulletinDto> selectBulletin() throws Exception;
    List<BulletinDto> selectBulletin(PageCondition pc) throws Exception;
    int countBulletin() throws Exception;
    int countBulletin(PageCondition pc) throws Exception;

    //  U(수정)
    int updateBulletin(BulletinDto bulletinDto) throws Exception;

    //  D(삭제)
    int deleteBulletin(Integer bno) throws Exception;
    int deleteBulletin(BulletinDto bulletinDto) throws Exception;
    void deleteBulletin() throws Exception;



}
