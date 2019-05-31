package com.neu.service;

import com.neu.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IUserService {
    void addUser(User user);/*添加用户*/
    boolean updateSUser(User user);
    boolean selectByNameAndPwds(String username,String password);
    int selectUserByName(String name);
    boolean change(String p,String y);
    User selectByNames(String name);
    int getNameId(String name);
    String getName(int id);
    List<User> selectAllUser();
    void deleteUser(int id);

}
