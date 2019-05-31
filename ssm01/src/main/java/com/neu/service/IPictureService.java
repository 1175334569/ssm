package com.neu.service;

import com.neu.bean.Album;
import com.neu.bean.Picture;
import com.neu.bean.User;

import java.util.List;

public interface IPictureService {

    //添加图片
    void addPicture(Picture picture);
    //删除图片
    boolean deleteByPictureId(int pid);
    //更改图片数据
    boolean updatePicture(Picture picture);
    //查询所有图片
    List<Picture> selectAllPicture();
    //查询pictureid
    Picture selectByPictureId(int pid);
    //查询uid用户的所有图片
    List<Picture> selectByUserId(int uid);
    //查询aid相册的所有图片
    List<Picture> selectByAlbumId(int aid);
    //查询tid类型的所有图片
    List<Picture> selectByType(String type);
    //查询名字带有xxx的所有图片
    List<Picture> selectByPictureName(String name);
    boolean Jsamename(String name,int uid);
    //==========================================================================
int getNameId(String name);
    String getName(int id);
    Picture getfirstpic(int aid,int uid);
    List<Picture> selectByAidAndUid(int aid,int uid);
    Album selectByRealName(String name);

    int selecttypeIdByName(String name);
    User selectById(int id);
    List<Picture> selectPictureByNameAndUid(String name,int uid);

    Album selectByAlbumNameAndUid(String name,int uid);
    Picture selectPictureByRealName(String pname);
}
