package com.neu.service.impl;

import com.neu.bean.User;
import com.neu.dao.IUserDao;
import com.neu.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements IUserService {
@Autowired
@Qualifier("IUserDao")
    private IUserDao userDao;
    public IUserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(IUserDao userDao) {
        this.userDao = userDao;
    }



    @Override
    public void addUser(User user) { /*添加用户*/
         userDao.insertUser(user);
    }

    @Override
    public int selectUserByName(String name) {
        int i=userDao.selectUserByName(name);
        return i;
    }

    @Override
    public boolean change(String p, String y) {
        if(p==y){
            return true;
        }
        else return false;
    }

    @Override
    public User selectByNames(String name) {
        User user=new User();
        user=userDao.selectByName(name);
        return user;
    }

    @Override
    public boolean selectByNameAndPwds(String user,String password) {
        int i=userDao.selectByNameAndPwd(user,password);
      if(i>0){
          return true;
      }
      else return false;
    }

    @Override
    public boolean updateSUser(User user) {

        if(userDao.updateUser(user))
            return true;
        else return false;
    }

    @Override
    public int getNameId(String name) {
        return userDao.getNameId(name);
    }

    @Override
    public String getName(int id) {
        return userDao.getName(id);
    }

    @Override
    public List<User> selectAllUser() {
        return userDao.selectAllUser();
    }

    @Override
    public void deleteUser(int id) {
        userDao.deleteUser(id);
    }
}
