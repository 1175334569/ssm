package com.neu.dao;

import com.neu.bean.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IAdminDao {
    // 插入数据
    int insertAdmin(Admin admin);
    // 修改数据
    boolean updateAdmin(Admin admin);
    // 删除数据
    int deleteAdmin(int id);
    // 查询所有的数据
    List<Admin> selectAllAdmin();
    //根据id查询
    Admin selectById(int id);
    //根据姓名模糊查询
    List<Admin> selectAdminByName(String name);

    /*通过账号和密码查询用户*/
    /*@Param("adminname")表示为参数adminname命名，命名后，
    在映射文件的SQL中，使用#{adminname}就可以获取adminname的参数值*/
    public Admin findAdmin(@Param("adminName") String adminname,
                           @Param("adminpassWord") String adminpassword);
}
