package com.neu.service.impl;

import com.neu.bean.Album;
import com.neu.bean.Picture;
import com.neu.bean.User;
import com.neu.dao.IAlbumDao;
import com.neu.dao.IPictureDao;
import com.neu.dao.IPictypeDao;
import com.neu.dao.IUserDao;
import com.neu.service.IPictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("PictureService")
public class PictureServiceImpl implements IPictureService {

    @Autowired
    @Qualifier("IPictureDao")
    private IPictureDao dao;

    @Override
    public void addPicture(Picture picture) {
        dao.insertPicture(picture);
    }

    @Override
    public boolean deleteByPictureId(int pid) {
        int count = dao.deletePicture(pid);
        if (count>0){
            return true;
        }
        return false;
    }

    @Override
    public boolean updatePicture(Picture picture) {
        int count = dao.updatePicture(picture);
        if (count>0){
            return true;
        }
        return false;
    }

    @Override
    public List<Picture> selectAllPicture() {
        List<Picture> pictures = dao.selectAllPicture();
        if (pictures!=null){
            return pictures;
        }
        return null;
    }

    @Override
    public Picture selectByPictureId(int pid) {
        Picture picture = dao.selectById(pid);
        if (picture!=null){
            return picture;
        }
        return null;
    }

    @Override
    public List<Picture> selectByUserId(int uid) {
        List<Picture> pictures = dao.selectByUserId(uid);
        if (pictures!=null){
            return pictures;
        }
        return null;
    }

    @Override
    public List<Picture> selectByAlbumId(int aid) {
        List<Picture> pictures = dao.selectByAlbumId(aid);
        if (pictures!=null){
            return pictures;
        }
        return null;
    }

    @Override
    public List<Picture> selectByType(String type) {
        List<Picture> pictures = dao.selectByTypeId(type);
        if (pictures!=null){
            return pictures;
        }
        return null;
    }

    @Override
    public List<Picture> selectByPictureName(String name) {
        List<Picture> pictures = dao.selectPictureByName(name);
        if (pictures!=null){
            return pictures;
        }
        return null;
    }

    @Override
    public boolean Jsamename(String name, int uid) {
        int count = dao.Jsamename(name,uid);
        if (count>0){
            return true;
        }
        return false;
    }

    @Override
    public Picture selectPictureByRealName(String pname) {
        Picture picture = dao.selectPictureByRealName(pname);
        return picture;
    }

    @Autowired
    @Qualifier("IUserDao")
    private IUserDao iUserDao;

    @Override
    public int getNameId(String name) {
        return iUserDao.getNameId(name);
    }

    @Override
    public String getName(int id) {
        return  iUserDao.getName(id);
    }

    @Override
    public Picture getfirstpic(int aid,int uid) {
        return dao.getfirstpic(aid,uid);
    }

    @Override
    public List<Picture> selectByAidAndUid(int aid, int uid) {
       return dao.selectByAidAndUid(aid,uid);
    }

    @Override
    public User selectById(int id) {
        return iUserDao.selectById(id);
    }

    @Autowired
    @Qualifier("IAlbumDao")
    private IAlbumDao albumDao;

    @Override
    public Album selectByRealName(String name) {
        return albumDao.selectByRealAlbumName(name);
    }

    @Autowired
    @Qualifier("IPictypeDao")
    private IPictypeDao iPictypeDao;

    @Override
    public int selecttypeIdByName(String name) {
        return iPictypeDao.selectIdByName(name);
    }

    @Override
    public List<Picture> selectPictureByNameAndUid(String name, int uid) {
        return dao.selectPictureByNameAndUid(name,uid);
    }

    @Override
    public Album selectByAlbumNameAndUid(String name, int uid) {
        return albumDao.selectByAlbumNameAndUid(name,uid);
    }
}
