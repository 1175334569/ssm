package com.neu.service;

import com.neu.bean.Admin;

import java.util.List;

public interface IAdminService {
    /*插入数据*/
    boolean addAdmin(Admin admin);
    /*删除数据*/
    boolean removeAdmin(int id);
    /*修改数据*/
    boolean modifyAdmin(Admin admin);
    /*查询所有管理员*/
    List<Admin> findAllAdmin();
    /*根据id查询*/
    Admin FindById(int id);
    /*根据姓名模糊查询*/
    List<Admin> findByName(String name);

    /*通过账户和密码查询用户*/
    public Admin fillAdmin(String adminname, String adminpassword);


}
