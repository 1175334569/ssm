package com.neu.service;

import com.neu.bean.Student;

import java.util.List;

public interface IStudentService {
    //添加用户
    boolean addStu(Student stu);

    //删除
    boolean moveStu(int id);

    //修改
    boolean modifyStu(Student stu);

    //查询所有
    List<Student> findAll();

    //根据id查询
    Student findById(int id);

    List<Student> findByName(String name);
}
