package com.songmin.song.dao;

import com.songmin.song.domain.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    SqlSession session;

    String namespace = "com.songmin.song.dao.UserMapper.";

    //  C(생성)
    @Override
    public int insertUser(UserDto user) throws Exception {
        return session.insert(namespace+"insert", user);
    }

    //  R(읽기)
    @Override
    public UserDto selectUser(String id) throws Exception {
        return session.selectOne(namespace+"selectUser", id);
    }

    @Override
    public UserDto selectUser(UserDto userDto) throws Exception {
        return session.selectOne(namespace+"selectDtoUser", userDto);
    }

    //  U(수정)
    @Override
    public int updateUser(UserDto user) throws Exception {
        return session.update(namespace+"update", user);
    }

    //  D(삭제)
    @Override
    public int deleteUser(String id) throws Exception {
        return session.delete(namespace+"delete", id);
    }

    @Override
    public void deleteAll() throws Exception {
       session.delete(namespace+"deleteAll");
    }

}
