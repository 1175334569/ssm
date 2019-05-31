package com.neu.dao;

import com.neu.bean.Pictype;

import java.util.List;

public interface IPictypeDao {
    int selectIdByName(String name);
    List<Pictype> selectAll();
}
