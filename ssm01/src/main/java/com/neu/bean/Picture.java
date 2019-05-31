package com.neu.bean;

import java.util.Date;

public class Picture {

    private Integer pictureid;
    private String picturename;
    private String picture;//图片路径
    private Integer uid;
    private Integer aid;
    private String  picturediscribe;
    private String date;
    private String type;

    public Integer getPictureid() {
        return pictureid;
    }

    public void setPictureid(Integer pictureid) {
        this.pictureid = pictureid;
    }

    public String getPicturename() {
        return picturename;
    }

    public void setPicturename(String picturename) {
        this.picturename = picturename;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getPicturediscribe() {
        return picturediscribe;
    }

    public void setPicturediscribe(String picturediscribe) {
        this.picturediscribe = picturediscribe;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Picture() {
    }

    public Picture(String picturename, String picture, Integer uid, Integer aid, String type) {
        this.picturename = picturename;
        this.picture = picture;
        this.uid = uid;
        this.aid = aid;
        this.type = type;
    }

    @Override
    public String toString() {
        return "Picture{" +
                "pictureid=" + pictureid +
                ", picturename='" + picturename + '\'' +
                ", picture='" + picture + '\'' +
                ", uid=" + uid +
                ", aid=" + aid +
                ", picturediscribe='" + picturediscribe + '\'' +
                ", createdate=" + date +
                ", typeid=" + type +
                '}';
    }
}
