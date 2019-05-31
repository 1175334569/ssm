package com.neu.dao;

import com.neu.bean.Student;

import java.util.List;

public interface IStudentDao {
    //添加用户
    int  insertStu(Student stu);

    //删除
    int  deleteStu(int id);

    //修改
    int  updateStu(Student stu);

    //查询所有
    List<Student> selectAll();

    //根据id查询
    Student selectById(int id);

    List<Student> selectByName(String name);
}
