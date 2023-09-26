package com.songmin.song.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import java.util.Objects;

public class CommentDto {
    private Integer cno;
    private Integer pcno;
    private Integer bno;
    public String cafe_name;
    public String bulletin_board;
    private String comment;
    private String id;
    private Date reg_date;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd. HH:mm:ss")
    private Date up_date;


    public Integer getCno() {
        return cno;
    }

    public void setCno(Integer cno) {
        this.cno = cno;
    }

    public Integer getPcno() {
        return pcno;
    }

    public void setPcno(Integer pcno) {
        this.pcno = pcno;
    }

    public Integer getBno() {
        return bno;
    }

    public void setBno(Integer bno) {
        this.bno = bno;
    }

    public String getCafe_name() {
        return cafe_name;
    }

    public void setCafe_name(String cafe_name) {
        this.cafe_name = cafe_name;
    }

    public String getBulletin_board() {
        return bulletin_board;
    }

    public void setBulletin_board(String bulletin_board) {
        this.bulletin_board = bulletin_board;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    public Date getUp_date() {
        return up_date;
    }

    public void setUp_date(Date up_date) {
        this.up_date = up_date;
    }

    @Override
    public String toString() {
        return "CommentDto{" +
                "cno=" + cno +
                ", pcno=" + pcno +
                ", bno=" + bno +
                ", cafe_name='" + cafe_name + '\'' +
                ", bulletin_board='" + bulletin_board + '\'' +
                ", comment='" + comment + '\'' +
                ", id='" + id + '\'' +
                ", reg_date=" + reg_date +
                ", up_date=" + up_date +
                '}';
    }
}
