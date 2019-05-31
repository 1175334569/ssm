package com.neu.controller;

import com.google.gson.Gson;
import com.neu.bean.Album;
import com.neu.bean.Picture;
import com.neu.bean.User;
import com.neu.dao.IPictureDao;
import com.neu.service.IPictureService;
import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class PictureController {

    @Autowired
    @Qualifier("PictureService")
    IPictureService service;

    //========================================================================================================图片上传↓
    @RequestMapping(value = "/userpage/hellohaha.do", method = RequestMethod.POST)/*picture.jsp*/
    @ResponseBody
    public void file1(@RequestParam("file1") MultipartFile file1,@RequestParam("username")String username,  @RequestParam("namepicture") String name,@RequestParam("describe")String describe,@RequestParam("blalbum")String blalbum,@RequestParam("type")String type, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
        //如果不为空
        Picture picture = new Picture();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");/*设置时间格式*/
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("name", 1);
        if (file1 != null) {
            String path = session.getServletContext().getRealPath("/upload");
            int i = 0;
            //String path="C:\\upload";
            String load = "../upload/";
            //获得文件名字
            String fileName = file1.getOriginalFilename();
            map.put("all", path + "\\" + fileName);
            //限制上传文件类型
            if (fileName.endsWith(".jpg") || fileName.endsWith(".png") || fileName.endsWith(".PNG")) {
                while (service.Jsamename(fileName, service.getNameId(name))) {
                    String oddadd = "(" + i + ")";
                    i++;
                    String newadd = "(" + i + ")";
                    if (i == 1) {
                        StringBuilder sb = new StringBuilder(fileName);
                        sb.insert(sb.indexOf("."), newadd);
                        fileName = sb.toString();
                    } else fileName = fileName.replace(oddadd, newadd);
                }

                //写入数据库
                picture.setPicture(load + name + "/" + fileName);
                picture.setPicturename(fileName);
                picture.setUid(service.getNameId(name));
                picture.setType(type);
                picture.setPicturediscribe(describe);

                if(service.selectByAlbumNameAndUid(blalbum,service.getNameId(username))!=null)
                picture.setAid(service.selectByAlbumNameAndUid(blalbum,service.getNameId(username)).getAlbumid());
                picture.setDate(df.format(new Date()));
                service.addPicture(picture);
                File file = new File(path + "\\" + name, fileName);
                file.mkdirs();
                //上传文件
                file1.transferTo(file);
                map.put("name", 2);
            } else map.put("name", 1);
        }
        Gson gson = new Gson();
        String myJson = gson.toJson(map);
        // 将数据发回客户端
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        out.print(myJson);
        out.close();
    }
    //======================================================================================================图片上传↑


    //========================================================================================================删除图片↓
    @RequestMapping("/userpage/delect.do")/*picture.jsp*/
    public void getname(int pictureid, HttpServletResponse httpServletResponse) throws Exception {
        Picture picture = service.selectByPictureId(pictureid);
        String name = service.getName(picture.getUid());
        String path = "C:\\Users\\Administrator\\IdeaProjects\\ssm01\\target\\ssm01\\upload\\";
        File file = new File(path + "\\" + name + "\\" + picture.getPicturename());
        Map<String, Object> map = new HashMap<String, Object>();
        if (service.deleteByPictureId(pictureid)) {
            file.delete();
            map.put("delect", 1);
        } else map.put("delect", 0);
        Gson gson = new Gson();
        String myJson = gson.toJson(map);
        // 将数据发回客户端
        httpServletResponse.setCharacterEncoding("utf-8");
        PrintWriter out = httpServletResponse.getWriter();
        out.print(myJson);
        out.close();
    }

    //======================================================================================================删除图片↑
    // 修改数据
    @RequestMapping("/tp2.do")
    public String doDeleteAlbum(Picture picture) {
        picture.setPictureid(5);
        picture.setPicturename("tu1");
        picture.setAid(3);
        picture.setPicture("66");
        if (service.updatePicture(picture)) {
            return "/show.jsp";
        }
        return null;
    }

    // 查询所有3用户的所有数据
    @RequestMapping("/tp3.do")
    public ModelAndView dofindallPicture() {

        List<Picture> pictures = service.selectByUserId(3);
        ModelAndView mv = new ModelAndView();
        mv.addObject("albums", pictures);

        for (Picture picture : pictures) {
            System.out.print(picture);
        }
        mv.setViewName("show.jsp");
        return mv;
    }

    @RequestMapping("/tp4.do")
    public ModelAndView doselectName(String name) {

        List<Picture> pictures = service.selectByPictureName(name);
        ModelAndView mv = new ModelAndView();
        if (pictures != null) {
            mv.addObject("albums", pictures.toString());
        } else {
            mv.addObject("albums", "no result");
        }
        mv.setViewName("show.jsp");
        return mv;
    }

    //========================================================================================================显示全部图片↓
    @RequestMapping("/mainpage/allpic.do")
    @ResponseBody
    public Object allpic() {
        List<Picture> pictures = service.selectAllPicture();
        return pictures;
    }
    //======================================================================================================显示全部图片↑


    //========================================================================================================显示用户图片↓
    @RequestMapping(value = "/userpage/userpic.do", method = RequestMethod.POST) /*picture.jsp*/
    @ResponseBody
    public Object userpic(String name) {
        List<Picture> pictures = service.selectByUserId(service.getNameId(name));
        return pictures;
    }
    //======================================================================================================显示用户图片↑

    //========================================================================================================显示全部图片↓
    @RequestMapping("/mainpage/userAblum.do")
    @ResponseBody
    public Object userablum(String name) {
        List<Picture> pictures = service.selectAllPicture();
        return pictures;
    }
    //======================================================================================================显示全部图片↑

    //========================================================================================================按条件获得第一张图片↓
    @RequestMapping("/userpage/getfirstpic.do") //picture.jsp
    @ResponseBody
    public Object getfirstpic(int aid, int uid) {
        Picture picture = service.getfirstpic(aid, uid);
        return picture;
    }
    //======================================================================================================按条件获得第一张图片↑

    //========================================================================================================按条件获得全部图片↓
    @RequestMapping("/userpage/useralbumpic.do") //albumpicture.jsp
    @ResponseBody
    public Object useralbumpic(int aid, int uid) {
        List<Picture> picture = service.selectByAidAndUid(aid, uid);
        return picture;
    }
    //======================================================================================================按条件获得全部图片↑

    //========================================================================================================修改图片信息↓
    @RequestMapping(value = {"/userpage/modifypicture.do","/userpage/modifypicture1.do"})/*picture.jsp*/
    public void modifypicture(String username,String oldname, int picid, String newname, String blalbum, String describe, String type, HttpServletResponse httpServletResponse) throws Exception {

        Map<String, Object> map = new HashMap<String, Object>();
        Picture newpicture = new Picture();
        String nameEnd = "";
        if (oldname.endsWith(".jpg")) {
            nameEnd = ".jpg";
        } else if (oldname.endsWith(".png")) {
            nameEnd = ".png";
        } else if (oldname.endsWith(".PNG")) {
            nameEnd = ".PNG";
        }
        Picture picture = service.selectByPictureId(picid);
        if (oldname.equals(newname) || newname == "") {
            newpicture.setPicturename(oldname);
            newpicture.setPicture(picture.getPicture());
        }
        else {
            newname = newname + nameEnd;

            String name = service.getName(picture.getUid());
            String load = "../upload/";
            String path = "C:\\Users\\Administrator\\IdeaProjects\\ssm01\\target\\ssm01\\upload\\";
            File oldfile = new File(path + "\\" + name + "\\" + oldname);
            File newfile = new File(path + "\\" + name + "\\" + newname);
            oldfile.renameTo(newfile);
                newpicture.setPicturename(newname);
                newpicture.setPicture(load+name+"/"+newname);
        }
        newpicture.setType(type);
        Picture oldpicture = service.selectByPictureId(picid);
        newpicture.setPictureid(picid);
        if(service.selectByAlbumNameAndUid(blalbum,service.getNameId(username))!=null) {
            Album album = service.selectByAlbumNameAndUid(blalbum,service.getNameId(username));
            newpicture.setAid(album.getAlbumid());
        } else newpicture.setAid(oldpicture.getAid());
        if (describe != "")
            newpicture.setPicturediscribe(describe);
        else newpicture.setPicturediscribe(oldpicture.getPicturediscribe());
        service.updatePicture(newpicture);
         map.put("modify",1);
        Gson gson = new Gson();
        String myJson = gson.toJson(map);
        // 将数据发回客户端
        httpServletResponse.setCharacterEncoding("utf-8");
        PrintWriter out = httpServletResponse.getWriter();
        out.print(myJson);
        out.close();
    }
    //======================================================================================================修改图片信息↑

    //========================================================================================================相册内图片上传↓
    @RequestMapping(value = "/userpage/hellohaha1.do", method = RequestMethod.POST)/*picture.jsp*/
    @ResponseBody
    public void file2(@RequestParam("file2") MultipartFile file2, @RequestParam("uid") int uid,@RequestParam("describe")String describe,@RequestParam("aid")int aid,@RequestParam("type")String type, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
        //如果不为空
        Picture picture = new Picture();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");/*设置时间格式*/
        Map<String, Object> map = new HashMap<String, Object>();
        User user=service.selectById(uid);
        if (file2 != null) {
            String path = session.getServletContext().getRealPath("/upload");
            int i = 0;
            //String path="C:\\upload";
            String load = "../upload/";
            //获得文件名字
            String fileName = file2.getOriginalFilename();
            map.put("all", path + "\\" + fileName);
            //限制上传文件类型
            if (fileName.endsWith(".jpg") || fileName.endsWith(".png") || fileName.endsWith(".PNG")) {
                while (service.Jsamename(fileName, uid)) {
                    String oddadd = "(" + i + ")";
                    i++;
                    String newadd = "(" + i + ")";
                    if (i == 1) {
                        StringBuilder sb = new StringBuilder(fileName);
                        sb.insert(sb.indexOf("."), newadd);
                        fileName = sb.toString();
                    } else fileName = fileName.replace(oddadd, newadd);
                }

                //写入数据库
                picture.setPicture(load + user.getUsername() + "/" + fileName);
                picture.setPicturename(fileName);
                picture.setUid(uid);
                picture.setType(type);
                picture.setPicturediscribe(describe);
                picture.setAid(aid);
                picture.setDate(df.format(new Date()));
                service.addPicture(picture);
                File file = new File(path + "\\" + user.getUsername(), fileName);
                file.mkdirs();
                //上传文件
                file2.transferTo(file);
                map.put("name", 2);
            } else map.put("name", 1);
        }
        Gson gson = new Gson();
        String myJson = gson.toJson(map);
        // 将数据发回客户端
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        out.print(myJson);
        out.close();
    }
    //======================================================================================================相册内图片上传↑

   /* //========================================================================================================按条件获得第一张图片↓
    @RequestMapping("/userpage/searchuserpic.do") //picture.jsp
    @ResponseBody
    public Object getpicByVague(String username, String searchuserpic) {
        int userid=service.getNameId(username);
        List<Picture> pictures;
        pictures=service.selectPictureByNameAndUid(searchuserpic,userid);
        return pictures;

    }
    //======================================================================================================按条件获得第一张图片↑*/
   @RequestMapping("/mainpage/search.do")
   @ResponseBody
   public Object doAddUser(String search) {

       List<Picture> pictures = service.selectByPictureName(search);
       return pictures;
   }
    @RequestMapping("/userpage/search1.do")
    @ResponseBody
    public Object search1(String search,String username) {
        List<Picture> pictures = service.selectPictureByNameAndUid(search,service.getNameId(username));
        return pictures;
    }

}
