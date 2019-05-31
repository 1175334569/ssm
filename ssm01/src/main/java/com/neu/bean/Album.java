package com.neu.bean;

import java.util.Date;
import java.util.List;

public class Album {

    private Integer albumid;
    private String albumname;
    private Integer uid;
    private String albumdate;
    private String albumdiscribe;
    private String albumnotes;

    //以下类用于数据库操作
    //需要添加或修改先商议一下
    private List<Picture> pictures;

    public Integer getAlbumid() {
        return albumid;
    }

    public void setAlbumid(Integer albumid) {
        this.albumid = albumid;
    }

    public String getAlbumname() {
        return albumname;
    }

    public void setAlbumname(String albumname) {
        this.albumname = albumname;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getAlbumdate() {
        return albumdate;
    }

    public void setAlbumdate(String albumdate) {
        this.albumdate = albumdate;
    }

    public String getAlbumdiscribe() {
        return albumdiscribe;
    }

    public void setAlbumdiscribe(String albumdiscribe) {
        this.albumdiscribe = albumdiscribe;
    }

    public String getAlbumnotes() {
        return albumnotes;
    }

    public void setAlbumnotes(String albumnotes) {
        this.albumnotes = albumnotes;
    }

    public List<Picture> getPictures() {
        return pictures;
    }

    public void setPictures(List<Picture> pictures) {
        this.pictures = pictures;
    }

    public Album(){}
    public Album(Integer albumid, String albumname, Integer uid,
                 //Date albumdate,
                 String albumdiscribe, String albumnotes) {
        this.albumid = albumid;
        this.albumname = albumname;
        this.uid = uid;
        //this.albumdate = albumdate;
        this.albumdiscribe = albumdiscribe;
        this.albumnotes = albumnotes;
    }

    @Override
    public String toString() {
        return "Album{" +
                "albumid=" + albumid +
                ", albumname='" + albumname + '\'' +
                ", uid=" + uid +
                ", albumdate=" + albumdate +
                ", albumdiscribe='" + albumdiscribe + '\'' +
                ", albumnotes='" + albumnotes + '\'' +
                ", pictures=" + pictures +
                '}';
    }
}
