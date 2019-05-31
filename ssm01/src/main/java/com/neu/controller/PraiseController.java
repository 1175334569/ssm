package com.neu.controller;

import com.neu.bean.Picture;
import com.neu.bean.Praise;
import com.neu.service.IPictureService;
import com.neu.service.IPraiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
public class PraiseController {

    @Autowired
    @Qualifier("PictureService")
    IPictureService pictureService;

    @Autowired
    @Qualifier("PraiseService")
    IPraiseService praiseService;


    @RequestMapping("/mainpage/praise.do")
    @ResponseBody
    public String praise(String picname) {
        String msg="n";
        Picture picture = pictureService.selectPictureByRealName(picname);
        int pid=picture.getPictureid();
        if(praiseService.FindById(pid)!=null){
            praiseService.addOnePraise(pid);
            msg="y";
        }
        else  {
            praiseService.addPraise(new Praise(picture.getPictureid(),1,1));
        }
        return msg;
    }

    @RequestMapping("/mainpage/sumnum.do")
    @ResponseBody
    public void praise_allnum(String picname) {

        Picture picture = pictureService.selectPictureByRealName(picname);
        int pid=picture.getPictureid();
        if(praiseService.FindById(pid)!=null){
            praiseService.addOneNum(pid);
        }
        else {
            praiseService.addPraise(new Praise(picture.getPictureid(),1,0));
        }
    }

    @RequestMapping("/mainpage/popular.do")
    @ResponseBody
    public Object popular() {

        List<Picture> pictures = new ArrayList<>();
        List<Praise> praises = praiseService.findMaxPraise();
        for (Praise praise:praises){
            Picture picture = pictureService.selectByPictureId(praise.getPicid());
            pictures.add(picture);
        }
       /* Collections.reverse(pictures);*/
        return pictures;
    }

    @RequestMapping("/mainpage/maxSearch.do")
    @ResponseBody
    public Object maxSearch() {

        List<Picture> pictures = new ArrayList<>();
        List<Praise> praises = praiseService.findMaxNum();
        for (Praise praise:praises){
            Picture picture = pictureService.selectByPictureId(praise.getPicid());
            pictures.add(picture);
        }
       /* Collections.reverse(pictures);*/
        return pictures;
    }
    @RequestMapping("/mainpage/selectByPid.do")
    @ResponseBody
    public Object selectPraiseByPid(int pid) {
        Praise praise = praiseService.FindById(pid);
        if (praise==null){
            praiseService.addPraise(new Praise(pid,0,0));
        }
        return praise;
    }
}
