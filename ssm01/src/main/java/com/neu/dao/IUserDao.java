package com.neu.dao;

import com.neu.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IUserDao {

    // 插入数据
    void insertUser(User user);

    // 修改数据
    boolean updateUser(User user);

    // 删除数据
    void deleteUser(int id);

    // 查询所有的数据
    List<User> selectAllUser();
    //根据id查询
    User selectById(int id);
    //模糊查询
    int selectUserByName(String name);
    int selectByNameAndPwd(@Param("username") String username, @Param("password") String password);
    User selectByName(String name);
    int getNameId(String name);
    String getName(int id);

}
