package com.neu.bean;

public class Praise {
    private Integer praiseid;
    private Integer picid;
    private int allnum;
    private int praisenum;

    public Praise(){
    }
    public Praise(Integer picid, int allnum, int praisenum) {
        this.picid = picid;
        this.allnum = allnum;
        this.praisenum = praisenum;
    }

    public Integer getPraiseid() {
        return praiseid;
    }

    public Integer getPicid() {
        return picid;
    }

    public int getAllnum() {
        return allnum;
    }

    public int getPraisenum() {
        return praisenum;
    }

    public void setPraiseid(Integer praiseid) {
        this.praiseid = praiseid;
    }

    public void setPicid(Integer picid) {
        this.picid = picid;
    }

    public void setAllnum(int allnum) {
        this.allnum = allnum;
    }

    public void setPraisenum(int praisenum) {
        this.praisenum = praisenum;
    }

    @Override
    public String toString() {
        return "Praise{" +
                "praiseid=" + praiseid +
                ", picid=" + picid +
                ", allnum=" + allnum +
                ", praisenum=" + praisenum +
                '}';
    }
}
