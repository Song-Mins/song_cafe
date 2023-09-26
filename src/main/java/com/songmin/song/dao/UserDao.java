package com.songmin.song.dao;

import com.songmin.song.domain.UserDto;

import java.util.List;

public interface UserDao {
    //  C(생성)
    int insertUser(UserDto user) throws Exception;

    //  R(읽기)
    UserDto selectUser(String id) throws Exception;

    UserDto selectUser(UserDto userDto) throws Exception;


    //  U(수정)
    int updateUser(UserDto user) throws Exception;

    //  D(삭제)
    int deleteUser(String id) throws Exception;

    void deleteAll() throws Exception;
}
