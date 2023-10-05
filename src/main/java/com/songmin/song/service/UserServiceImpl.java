package com.songmin.song.service;

import com.songmin.song.dao.JoinCafeDao;
import com.songmin.song.dao.UserDao;
import com.songmin.song.domain.JoinCafeDto;
import com.songmin.song.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Autowired
    JoinCafeDao joinCafeDao;

    @Override
    public void register(UserDto user) throws Exception {

        userDao.insertUser(user);

    }

    @Override
    public UserDto get(String id) throws Exception {
        UserDto userDto = userDao.selectUser(id);
        List<String> join_cafeList = joinCafeDao.selectJoinCafe(id);

        userDto.setJoin_cafe(join_cafeList);
        return userDto;
    }

    @Override
    public UserDto get(UserDto userDto) throws Exception {
        return userDao.selectUser(userDto);
    }

    @Override
    public boolean registerCheck(UserDto user) throws Exception {

        UserDto selectedUser = userDao.selectUser(user.getId());

        return selectedUser == null;
    }


    @Override
    public boolean loginCheck(String id, String pwd) throws Exception {

        //  아이디로 회원정보를 가져옴
        UserDto user = userDao.selectUser(id);

        //  해당 아이디의 회원정보가 없으면 로그인 실패
        //  이 구문이 없으면 아래에서 NullPointerException 발생 가능
        if(user == null) {
            return false;
        }

        //  아이디와 비밀번호 같은지 체크
        return user.getPwd().equals(pwd);
    }
}
