package com.neu.service.impl;

import com.neu.bean.Praise;
import com.neu.dao.IPraiseDao;
import com.neu.service.IPraiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("PraiseService")
public class PraiseServiceImpl implements IPraiseService {
    @Autowired
    @Qualifier("IPraiseDao")
    private IPraiseDao praiseDao;

    /*插入数据*/
    @Override
    public boolean addPraise(Praise praise) {
        int count=praiseDao.insertPraise(praise);
        if(count>0){
            return true;
        }
        return false;
    }
    /*删除数据*/
    @Override
    public boolean removePraise(int id) {
        int count=praiseDao.deletePraise(id);
        if(count>0){
            return true;
        }
        return false;
    }
    /*修改数据*/
    @Override
    public boolean modifyPraise(Praise praise) {
        int count=praiseDao.updatePraise(praise);
        if(count>0){
            return true;
        }
        return false;
    }
    /*查询所有数据*/
    @Override
    public List<Praise> findAllPraise() {
        List<Praise> praises=praiseDao.selectAllPraise();
        if(praises!=null){
            return praises;
        }else {
            return null;
        }
    }
    /*根据picid查询*/
    @Override
    public Praise FindById(int picid) {
        Praise praise=praiseDao.selectByPicId(picid);
        if(praise!=null){
            return praise;
        }else {
            return null;
        }
    }
    /*点赞数最高排序*/
    @Override
    public List<Praise> findMaxPraise() {
        List<Praise> praises=praiseDao.selectMaxPraise();
        if(praises!=null){
            return praises;
        }else {
            return null;
        }
    }
    /*浏览量最高排序*/
    @Override
    public List<Praise> findMaxNum() {
        List<Praise> praises=praiseDao.selectMaxNum();
        if(praises!=null){
            return praises;
        }else {
            return null;
        }
    }

    @Override
    public boolean addOnePraise(int id) {
        if (praiseDao.addOnePraise(id)>0){
            return true;
        }
        return false;
    }

    @Override
    public boolean deOnePraise(int id) {
        if (praiseDao.deOnePraise(id)>0){
            return true;
        }
        return false;
    }

    @Override
    public boolean addOneNum(int pid) {
        if (praiseDao.addOneNum(pid)>0){
            return true;
        }
        return false;
    }
}
