package com.neu.dao;

import com.neu.bean.Album;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IAlbumDao {

    // 插入数据
    int insertAlbum(Album album);

    // 修改数据
    int updateAlbum(Album album);

    // 删除数据
    int deleteAlbum(int id);

    // 查询所有的数据
    List<Album> selectAllAlbum();
    //根据albumid查询
    Album selectByAlbumId(int albumid);
    //根据userid查询
    List<Album> selectByUserId(int userid);
    //模糊查询
    List<Album> selectAlbumByName(String name);
    //查询当前名字的信息
    Album selectByRealAlbumName(String name);

    int JudeAlbum(@Param("albumname") String name,@Param("uid") int uid);

    Album selectByAlbumNameAndUid(@Param("albumname") String name,@Param("uid") int uid);

    String getNameById(int aid);

}
