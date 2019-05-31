package com.neu.controller;

import com.neu.bean.Picture;
import com.neu.bean.Pictype;
import com.neu.dao.IPictypeDao;
import com.neu.service.IPictypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class PictypeController {
    @Autowired
    @Qualifier("PictypeService")
    private IPictypeService iPictypeService;
    @RequestMapping("/userpage/type.do")
    @ResponseBody
    public Object selectAll(){
        List<Pictype> pictypes=iPictypeService.selectAll();
        return  pictypes;
    }
}
