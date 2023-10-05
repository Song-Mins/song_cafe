package com.songmin.song.service;

import com.songmin.song.domain.UserDto;


public interface UserService {
    void register(UserDto user) throws Exception;

    UserDto get(String id) throws Exception;
    UserDto get(UserDto userDto) throws Exception;

    boolean registerCheck(UserDto user) throws Exception;

    boolean loginCheck(String id, String pwd) throws Exception;
}
