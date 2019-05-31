package com.neu.controller;


import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;


@Controller

public class MyController {
    /*@RequestMapping("/hellohaha.do")
    public void doSome(MultipartFile file1, HttpSession session, Model model, HttpServletResponse response) throws Exception{
        //如果不为空
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("name",1);
       *//* if(!file1.isEmpty()){
            String path=session.getServletContext().getRealPath("/upload");
            //String path="C:\\upload";
            //获得文件名字
            String fileName=file1.getOriginalFilename();
            //限制上传文件类型
            if(fileName.endsWith(".jpg")||fileName.endsWith(".png")){
                File file=new File(path,fileName);
                model.addAttribute("fileName", fileName);
                //上传文件
                file1.transferTo(file);
            }
        }*//*
        Gson gson = new Gson();
        String myJson = gson.toJson(map);
        // 将数据发回客户端
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        out.print(myJson);
        out.close();
    }
*/
}
