package com.songmin.song.controller;

import com.songmin.song.domain.UserDto;
import com.songmin.song.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class RestUserController {

    @Autowired
    UserService userService;

    @PostMapping("/users")
    public ResponseEntity<String> get(@RequestBody UserDto userDto) {

        System.out.println("userDto = " + userDto);

        UserDto readUserDto = null;

        try {
            readUserDto = userService.get(userDto);
            if (readUserDto == null) {
                throw new Exception();
            }
        } catch (Exception e) {
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }

        if (userDto.getId() == null) {
            return new ResponseEntity<String>(readUserDto.getId(), HttpStatus.OK);
        }
        else {
            return new ResponseEntity<String>(readUserDto.getPwd(), HttpStatus.OK);
        }
    }

}
