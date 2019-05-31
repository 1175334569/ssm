package com.neu.dao;

import com.neu.bean.Picture;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IPictureDao {

    // 插入数据
    int insertPicture(Picture picture);

    // 修改数据
    int updatePicture(Picture picture);

    // 删除数据
    int deletePicture(int id);

    // 查询所有的数据
    List<Picture> selectAllPicture();
    //根据pictureid查询
    Picture selectById(int pictureid);
    //根据userid查询
    List<Picture> selectByUserId(int userid);
    //根据albumid查询
    List<Picture> selectByAlbumId(int albumid);
    //根据typeid(typeid对应的类型)查询
    List<Picture> selectByTypeId(String type);
    //模糊查询
    List<Picture> selectPictureByName(String name);

    List<Picture> selectPictureByNameAndUid(@Param("picturename") String picturename,@Param("uid") int uid);

    int Jsamename(@Param("name")String name,@Param("uid") int uid);
    Picture getfirstpic(@Param("aid") int aid,@Param("uid") int uid);
    List<Picture> selectByAidAndUid(@Param("aid")int aid,@Param("uid")int uid);

    Picture selectPictureByRealName(String pname);

}
