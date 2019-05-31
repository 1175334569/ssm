package com.neu.controller;

import com.neu.bean.Admin;
import com.neu.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
/*RequestMapping("/Admin")*/
public class AdminController {
    /*依赖注入*/
    @Autowired
    private IAdminService adminService;

    @RequestMapping(value="/login.do",method = RequestMethod.POST)
    public String login(String adminname, String adminpassword, Model model, HttpServletRequest request){
        /*通过账户和密码查询用户*/
        Admin admin=adminService.fillAdmin(adminname,adminpassword);
        //String admins=admin.getAdminname();
        if(admin!=null){
            /*将用户对象添加到session*/
            //session.setAttribute("ADMIN_SESSION",admin);
            request.getSession().setAttribute("ADMIN",admin);
            return "../admin";/*跳转到管理员主页面*/
        }
        if(admin==null){
            model.addAttribute("msg" ,"账号或密码错误，请重新输入");
        }
        /*返回登录页面*/
        return "../sadminlogin";
    }
    /*跳转到添加管理员页面*/
   /* @RequestMapping("toAddAdmin")
    public String toAddAdmin(){
        return "index";
    }*/

   @RequestMapping("/getAdminById.do")
   @ResponseBody
   /*通过id获取客户信息*/
   public Admin getAdminById(int id){
       Admin admin=adminService.FindById(id);
       return admin;
   }

    /*更新管理员信息*/
    @RequestMapping(value="/adminpage/update.do")
    @ResponseBody
    public String adminUpdate(int adminid,String newuser,String password){
       Admin admin=new Admin();
       admin.setAdminid(adminid);
       admin.setAdminname(newuser);
       admin.setAdminpassword(password);
        boolean rows=adminService.modifyAdmin(admin);
        if(rows==true){
            return "1";
        }else{
            return "0";
        }
    }
}
