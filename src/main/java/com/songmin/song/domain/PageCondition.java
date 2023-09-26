package com.songmin.song.domain;

import java.util.List;

//  초기값을 설정 하지 않으면 null or "" 이라는 변수가 있는데
//  ""을 초기값으로 설정하면 변수가 없음
public class PageCondition {
    //  board, cafe
    private Integer page = 1;
    private Integer pageSize = 10;
    private String keyword = "";
    //  board
    private String cafe_name;
    private String bulletin_board = "";
    private String option = "";
    private String readId = "";
    private List<Integer> commentBnoList;

    //  cafe
    private String topic = "";
    private String region1 = "";
    private String region2 = "";
    private List<String> joinCafeList;




//    page와 pageSize에 따라 바뀌는 값이라 변수로 만들필요가 없음. - getter만 만들기
//    private Integer offset;

    public Integer getOffset() {
        return (page-1)*pageSize;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getBulletin_board() {
        return bulletin_board;
    }

    public void setBulletin_board(String bulletin_board) {
        this.bulletin_board = bulletin_board;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public String getReadId() {
        return readId;
    }

    public void setReadId(String readId) {
        this.readId = readId;
    }

    public List<Integer> getCommentBnoList() {
        return commentBnoList;
    }

    public void setCommentBnoList(List<Integer> commentBnoList) {
        this.commentBnoList = commentBnoList;
    }

    public String getCafe_name() {
        return cafe_name;
    }

    public void setCafe_name(String cafe_name) {
        this.cafe_name = cafe_name;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getRegion1() {
        return region1;
    }

    public void setRegion1(String region1) {
        this.region1 = region1;
    }

    public String getRegion2() {
        return region2;
    }

    public void setRegion2(String region2) {
        this.region2 = region2;
    }

    public List<String> getJoinCafeList() {
        return joinCafeList;
    }

    public void setJoinCafeList(List<String> joinCafeList) {
        this.joinCafeList = joinCafeList;
    }

    @Override
    public String toString() {
        return "PageCondition{" +
                "page=" + page +
                ", pageSize=" + pageSize +
                ", keyword='" + keyword + '\'' +
                ", cafe_name='" + cafe_name + '\'' +
                ", bulletin_board='" + bulletin_board + '\'' +
                ", option='" + option + '\'' +
                ", readId='" + readId + '\'' +
                ", commentBnoList=" + commentBnoList +
                ", topic='" + topic + '\'' +
                ", region1='" + region1 + '\'' +
                ", region2='" + region2 + '\'' +
                ", joinCafeList=" + joinCafeList +
                '}';
    }
}
