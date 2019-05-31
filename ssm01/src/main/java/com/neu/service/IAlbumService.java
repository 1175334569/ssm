package com.neu.service;

import com.neu.bean.Album;

import java.util.List;

public interface IAlbumService {

    //添加相册
    boolean addAlbum(Album album);

    //删除相册、通过相册id
    boolean deleteByAlbumId(int id);

    //更新相册
    boolean updateAlbum(Album album);

    //查询所有的相册
    List<Album> selectAllAlbum();

    //根据albumid查询相册
    Album selectByAlbumId(int aid);

    //根据userid查询
    List<Album> selectByUserId(int uid);

    //查询名字带有xxx的相册
    List<Album> selectByAlbumName(String name);

    Album selectByRealName(String name);
//====================================================
    int getNameId(String name);

    boolean JudeAlbum(String name,int uid);

    Album selectByAlbumNameAndUid(String name,int uid);

    String getNameById(int aid);

}
