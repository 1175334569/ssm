package com.neu.service;

import com.neu.bean.Praise;

import java.util.List;

public interface IPraiseService {
    /*插入数据*/
    boolean addPraise(Praise praise);
    /*删除数据*/
    boolean removePraise(int id);
    /*修改数据*/
    boolean modifyPraise(Praise praise);
    /*查询所有数据*/
    List<Praise> findAllPraise();
    /*根据picid查询*/
    Praise FindById(int picid);
    /*点赞数最高排序*/
    List<Praise> findMaxPraise();
    /*浏览量最高排序*/
    List<Praise> findMaxNum();

    boolean addOnePraise(int id);
    boolean deOnePraise(int id);
    boolean addOneNum(int pid);
}
