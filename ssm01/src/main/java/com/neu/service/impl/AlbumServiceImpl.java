package com.neu.service.impl;

import com.neu.bean.Album;
import com.neu.dao.IAlbumDao;
import com.neu.dao.IUserDao;
import com.neu.service.IAlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("AlbumService")
public class AlbumServiceImpl implements IAlbumService {

    @Autowired
    @Qualifier("IAlbumDao")
    private IAlbumDao albumDao;

    @Override
    public boolean addAlbum(Album album) {
        int count = albumDao.insertAlbum(album);
        if (count > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteByAlbumId(int id) {
        int count = albumDao.deleteAlbum(id);
        if (count>0){
            return true;
        }
        return false;
    }

    @Override
    public boolean updateAlbum(Album album) {
        int count = albumDao.updateAlbum(album);
        if (count>0){
            return true;
        }
        return false;
    }

    @Override
    public List<Album> selectAllAlbum() {
        List<Album> albums = albumDao.selectAllAlbum();
        if (albums!=null){
            return albums;
        }
        return null;
    }

    @Override
    public Album selectByAlbumId(int aid) {
        Album album = albumDao.selectByAlbumId(aid);
        if (album!=null){
            return album;
        }
        return null;
    }

    @Override
    public List<Album> selectByUserId(int uid) {
        List<Album> albums = albumDao.selectByUserId(uid);
        if (albums!=null){
            return albums;
        }
        return null;
    }

    @Override
    public List<Album> selectByAlbumName(String name) {
        List<Album> albums = albumDao.selectAlbumByName(name);
        if (albums!=null){
            return albums;
        }
        return null;
    }

    @Override
    public Album selectByRealName(String name) {
        Album album = albumDao.selectByRealAlbumName(name);
        return album;
    }

    @Override
    public boolean JudeAlbum(String name,int uid) {
        if(albumDao.JudeAlbum(name,uid)>0){
            return true;
        }
        else return false;
    }

    @Override
    public Album selectByAlbumNameAndUid(String name, int uid) {
        return albumDao.selectByAlbumNameAndUid(name,uid);
    }

    @Override
    public String getNameById(int aid) {
        return albumDao.getNameById(aid);
    }

    //=======================================================================
@Autowired
@Qualifier("IUserDao")
private IUserDao iUserDao;

    @Override
    public int getNameId(String name) {
        return iUserDao.getNameId(name);
    }
}


