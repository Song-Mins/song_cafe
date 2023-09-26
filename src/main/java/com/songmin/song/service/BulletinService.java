package com.songmin.song.service;

import com.songmin.song.domain.BulletinDto;
import com.songmin.song.domain.PageCondition;

import java.util.List;
import java.util.Map;

public interface BulletinService {


    int addBulletin(BulletinDto bulletinDto) throws Exception;


    BulletinDto readBulletin(Integer bno) throws Exception;


    List<BulletinDto> readBulletins() throws Exception;

    List<BulletinDto> readPageConditionBulletins(PageCondition pc) throws Exception;

    int countBulletins() throws Exception;

    int countPageConditionBulletins(PageCondition pc) throws Exception;



    int updateBulletin(BulletinDto bulletinDto) throws Exception;



    int removeBulletin(Integer bno) throws Exception;
}
