package com.songmin.song.service;

import com.songmin.song.dao.JoinCafeDao;
import com.songmin.song.domain.JoinCafeDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JoinCafeServiceImpl implements JoinCafeService {

    @Autowired
    JoinCafeDao joinCafeDao;

    @Override
    public List<String> read(String id) throws Exception {
        return joinCafeDao.selectJoinCafe(id);
    }

    @Override
    public int add(JoinCafeDto joinCafeDto) throws Exception{
        return joinCafeDao.insertJoinCafe(joinCafeDto);
    }

}
