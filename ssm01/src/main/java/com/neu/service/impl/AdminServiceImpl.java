package com.neu.service.impl;

import com.neu.bean.Admin;
import com.neu.dao.IAdminDao;
import com.neu.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service("IAdminService")
@Transactional
public class AdminServiceImpl implements IAdminService {
    /*注入IAdminDao*/
    @Autowired
    @Qualifier("IAdminDao")
    private IAdminDao adminDao;

    public void setAdminDao(IAdminDao adminDao) {
        this.adminDao = adminDao;
    }
    /*插入数据*/
    @Override
    public boolean addAdmin(Admin admin) {
        int count = adminDao.insertAdmin(admin);
        if(count>0){
            return true;
        }
        return false;
    }
    /*删除数据*/
    @Override
    public boolean removeAdmin(int id) {
        int count=adminDao.deleteAdmin(id);
        if(count>0){
            return true;
        }
        return false;
    }
    /*修改数据*/
    @Override
    public boolean modifyAdmin(Admin admin) {
        /*int count=adminDao.updateAdmin(admin);
        if(count>0){
            return true;
        }
        return false;*/
        return adminDao.updateAdmin(admin);
    }
    /*查询所有管理员*/
    @Override
    public List<Admin> findAllAdmin() {
        List<Admin> adms=adminDao.selectAllAdmin();
        if(adms.size()>0){
            return adms;
        }else {
            return null;
        }
    }
    /*根据id查询*/
    @Override
    public Admin FindById(int id) {
        Admin adms=adminDao.selectById(id);
        if(adms!=null){
            return adms;
        }else {
            return null;
        }
    }
    /*根据姓名模糊查询*/
    @Override
    public List<Admin> findByName(String name) {
        List<Admin> admins=adminDao.selectAdminByName(name);
        if(admins!=null){
            return admins;
        }else {
            return null;
        }
    }

    @Override
    public Admin fillAdmin(String adminname, String adminpassword) {
        Admin admin=this.adminDao.findAdmin(adminname,adminpassword);
        return admin;
    }
}
