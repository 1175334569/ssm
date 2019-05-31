package com.neu.service.impl;

import com.neu.bean.Student;
import com.neu.dao.IStudentDao;
import com.neu.service.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("stuService")
public class StudentServiceImpl implements IStudentService {
    @Autowired
    @Qualifier("IStudentDao")
    private IStudentDao stuDao;

    public void setStuDao(IStudentDao stuDao) {

        this.stuDao = stuDao;
    }

    @Override
    public boolean addStu(Student stu) {
        int count = stuDao.insertStu(stu);
        if (count > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean moveStu(int id) {
        return true;
    }

    @Override
    public boolean modifyStu(Student stu) {
        return true;
    }

    @Override
    public List<Student> findAll() {
        List<Student> stus=stuDao.selectAll();

        if(stus.size()>0){
            return stus;
        }else{
            return null;
        }

    }

    @Override
    public Student findById(int id) {
        return null;
    }

    @Override
    public List<Student> findByName(String name) {
        return null;
    }
}
