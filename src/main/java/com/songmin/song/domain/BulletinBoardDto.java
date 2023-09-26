package com.songmin.song.domain;

import java.util.Date;

//int와 Integer의 차이
public class BulletinBoardDto {

    private String cafe_name;
    private String name;

    public String getCafe_name() {
        return cafe_name;
    }

    public void setCafe_name(String cafe_name) {
        this.cafe_name = cafe_name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "BulletinBoardDto{" +
                "cafe_name='" + cafe_name + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
