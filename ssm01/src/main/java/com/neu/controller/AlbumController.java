package com.neu.controller;

import com.google.gson.Gson;
import com.neu.bean.Album;
import com.neu.bean.Picture;
import com.neu.service.IAlbumService;
import com.neu.service.IPictureService;
import com.neu.service.impl.AlbumServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AlbumController {

    @Autowired
    @Qualifier("AlbumService")
    IAlbumService iAlbumService;

    @Autowired
    @Qualifier("PictureService")
    IPictureService Picservice;

    // 插入数据
    @RequestMapping("/register.do")
    public String doInsertAlbum(Album album) {

        iAlbumService.addAlbum(album);
        return "/show.jsp";

    }

    // 删除数据
    @RequestMapping("/register2.do")
    public String doDeleteAlbum() {

        iAlbumService.deleteByAlbumId(3);
        return "/show.jsp";

    }
    @RequestMapping("/mainpage/allalbum.do")
    @ResponseBody
    public Object allpic() {
        List<Album> albums = iAlbumService.selectAllAlbum();
        for (Album album:albums){
            album.setPictures(Picservice.selectByAlbumId(album.getAlbumid()));
        }
        return albums;
    }

    // 查询所有数据
    @RequestMapping("/register3.do")
    public ModelAndView dofindallAlbum() {

        List<Album> albums = iAlbumService.selectAllAlbum();
        ModelAndView mv = new ModelAndView();
        mv.addObject("albums", albums.toString());

        for (Album album:albums){
            System.out.print(album);
        }
        mv.setViewName("show.jsp");
        return mv;

    }

    @RequestMapping("/userpage/useralbum.do")
    @ResponseBody
    public Object allpic(String name) { //相册名，日期，相册第一张图片
        List<Album> albums = iAlbumService.selectByUserId(iAlbumService.getNameId(name));
        return albums;
    }

    @RequestMapping(value = {"/userpage/edit.do","/userpage/edit1.do"})
    @ResponseBody
    public Object edit(String username) { /*查询全部相册*/
        List<Album> albums = iAlbumService.selectByUserId(iAlbumService.getNameId(username));
        return albums;
    }

    @RequestMapping("/userpage/delectalbum.do")
    @ResponseBody
    public void delectalbum(int albumid, HttpServletResponse httpServletResponse) throws Exception {

        Map<String, Object> map = new HashMap<String, Object>();
        if(iAlbumService.deleteByAlbumId(albumid))
            map.put("delect",1);
      /*  Picture picture=iAlbumService.selectByPictureId(pictureid);
        String name=iAlbumService.getName(picture.getUid());
        String path="C:\\Users\\Administrator\\IdeaProjects\\ssm01\\target\\ssm01\\upload\\";
        File file=new File(path+"\\"+name+"\\"+picture.getPicturename());
        Map<String, Object> map = new HashMap<String, Object>();
        if(service.deleteByPictureId(pictureid)){
            file.delete();
            map.put("delect",1);
        }
        else map.put("delect",0);*/
      else map.put("delect",0);
        Gson gson = new Gson();
        String myJson = gson.toJson(map);
        // 将数据发回客户端
        httpServletResponse.setCharacterEncoding("utf-8");
        PrintWriter out = httpServletResponse.getWriter();
        out.print(myJson);
        out.close();
    }

    @RequestMapping("/userpage/createalbum.do")
    @ResponseBody
    public void createalbum(String albumname,String username,String albumdescribe,HttpServletResponse httpServletResponse) throws Exception {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");/*设置时间格式*/

        Map<String, Object> map = new HashMap<String, Object>();
        if(albumname==""){
            map.put("create",0);
        }
        else if(iAlbumService.JudeAlbum(albumname,Picservice.getNameId(username))){
            map.put("create",1);
        }
        else {
            Album album = new Album();
            album.setUid(Picservice.getNameId(username));
            album.setAlbumname(albumname);
            album.setAlbumdiscribe(albumdescribe);
            album.setAlbumdate(df.format(new Date()));
            if (iAlbumService.addAlbum(album)) {
                map.put("create", 2);
            } else map.put("create", 3);
        }
        Gson gson = new Gson();
        String myJson = gson.toJson(map);
        // 将数据发回客户端
        httpServletResponse.setCharacterEncoding("utf-8");
        PrintWriter out = httpServletResponse.getWriter();
        out.print(myJson);
        out.close();
    }
    @RequestMapping("/userpage/editalbum.do")
    @ResponseBody
    public Object editalbum(int aid,int uid,String name,String describe) { /*修改相册*/
        Album oldalbum=iAlbumService.selectByAlbumId(aid);
        Album album=new Album();
        album.setAlbumid(aid);
        album.setAlbumdate(oldalbum.getAlbumdate());
        album.setUid(uid);
        album.setAlbumdiscribe(describe);
        album.setAlbumname(name);
        if(iAlbumService.updateAlbum(album))
        {
            return 1;
        }
        else return 0;
    }
    @RequestMapping("/mainpage/albumpic.do")
    @ResponseBody
    public Object doAddUser(String albumname) {

        int id= iAlbumService.selectByRealName(albumname).getAlbumid();
        List<Picture> pictures = Picservice.selectByAlbumId(id);

        return pictures;
    }
    @RequestMapping(value = {"/userpage/getalbumname.do","/userpage/getalbumname1.do"})
    @ResponseBody
    public void getAlbumName(int Aid,HttpServletResponse httpServletResponse)throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("albumName",iAlbumService.getNameById(Aid));
        Gson gson = new Gson();
        String myJson = gson.toJson(map);
        // 将数据发回客户端
        httpServletResponse.setCharacterEncoding("utf-8");
        PrintWriter out = httpServletResponse.getWriter();
        out.print(myJson);
        out.close();
    }
}
