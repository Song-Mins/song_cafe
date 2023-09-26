package com.songmin.song.domain;

import java.util.Date;

public class CafeDto {
    private String name;
    private String manager_id;
    private String topic;
    private String region1;
    private String region2;
    private String explanation;
    private Integer member;
    private Date reg_date;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getManager_id() {
        return manager_id;
    }

    public void setManager_id(String manager_id) {
        this.manager_id = manager_id;
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

    public String getExplanation() {
        return explanation;
    }

    public void setExplanation(String explanation) {
        this.explanation = explanation;
    }

    public Integer getMember() {
        return member;
    }

    public void setMember(Integer member) {
        this.member = member;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    @Override
    public String toString() {
        return "CafeDto{" +
                "name='" + name + '\'' +
                ", manager_id='" + manager_id + '\'' +
                ", topic='" + topic + '\'' +
                ", region1='" + region1 + '\'' +
                ", region2='" + region2 + '\'' +
                ", explanation='" + explanation + '\'' +
                ", member=" + member +
                ", reg_date=" + reg_date +
                '}';
    }
}
