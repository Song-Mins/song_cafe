package com.songmin.song.domain;

import java.util.Date;

//int와 Integer의 차이
public class BulletinDto {
    private Integer bno;
    private String cafe_name;
    private String bulletin_board;
    private String title;
    private String content;
    private String id;
    private int view_cnt;
    private int comment_cnt;
    private Date reg_date;
    private Date up_date;

    public BulletinDto() {}
    //직접 BoardDto를 생성하는 경우는 아래경우뿐
    public BulletinDto(String cafe_nmae, String title, String content, String id) {
        this.cafe_name = cafe_nmae;
        this.title = title;
        this.content = content;
        this.id = id;
    }

    public BulletinDto(String cafe_nmae, String bulletin_board, String title, String content, String id) {
        this.cafe_name = cafe_nmae;
        this.bulletin_board = bulletin_board;
        this.title = title;
        this.content = content;
        this.id = id;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getView_cnt() {
        return view_cnt;
    }

    public void setView_cnt(int view_cnt) {
        this.view_cnt = view_cnt;
    }

    public int getComment_cnt() {
        return comment_cnt;
    }

    public void setComment_cnt(int comment_cnt) {
        this.comment_cnt = comment_cnt;
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
        return "BulletinDto{" +
                "bno=" + bno +
                ", cafe_name='" + cafe_name + '\'' +
                ", bulletin_board='" + bulletin_board + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", id='" + id + '\'' +
                ", view_cnt=" + view_cnt +
                ", comment_cnt=" + comment_cnt +
                ", reg_date=" + reg_date +
                ", up_date=" + up_date +
                '}';
    }
}
