package com.neu.service.impl;

import com.neu.bean.Pictype;
import com.neu.dao.IPictypeDao;
import com.neu.service.IPictureService;
import com.neu.service.IPictypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("PictypeService")
public class PictypeServiceImpl implements IPictypeService {
    @Autowired
    @Qualifier("IPictypeDao")
    private IPictypeDao iPictypeDao;
    @Override
    public List<Pictype> selectAll() {
        return iPictypeDao.selectAll();
    }
}
