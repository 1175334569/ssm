package com.neu.dao;

import com.neu.bean.Praise;

import java.util.List;

public interface IPraiseDao {
    // 插入数据
    int insertPraise(Praise praise);
    // 修改数据
    int updatePraise(Praise praise);
    // 删除数据
    int deletePraise(int id);
    // 查询所有的数据
    List<Praise> selectAllPraise();
    //根据picid查询
    Praise selectByPicId(int picid);
    //点赞数最高排序
    List<Praise> selectMaxPraise();
    //浏览量最高排序
    List<Praise> selectMaxNum();

    int addOnePraise(int id);
    int deOnePraise(int id);
    int addOneNum(int pid);
}
