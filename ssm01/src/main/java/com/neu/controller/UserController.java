package com.neu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.JsonObject;
import com.neu.bean.User;
import com.neu.service.IUserService;
import org.apache.tools.ant.taskdefs.Sleep;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.google.gson.Gson;

@Controller
public class UserController {
    @Autowired
    @Qualifier("userService")
    private IUserService iUserService;

   public void setiUserService(IUserService iUserService) {
        this.iUserService = iUserService;
    }
    //========================================================================================================用户登录↓
        @RequestMapping("/mainpage/login.do")  /*login.jsp*/
        public void doAjax(String username, String password, HttpServletResponse response,HttpServletRequest request)
                throws Exception {
            // 将数据放到Map中
            Map<String, Object> map = new HashMap<String, Object>();
            if(username==""||password=="")
                map.put("name",0);
          else  if (iUserService.selectByNameAndPwds(username, password)){/*验证用户密码*/
              if(username.equals("admin")) {
                  map.put("name", 1);
              }
              else {
                  map.put("userid",iUserService.getNameId(username));
                  map.put("name",2);
              }
            }
            else map.put("name",3);
            Gson gson = new Gson();
            String myJson = gson.toJson(map);
            // 将数据发回客户端
            response.setCharacterEncoding("utf-8");
            PrintWriter out = response.getWriter();
            out.print(myJson);
            out.close();
    }
    //======================================================================================================用户登录↑


    //========================================================================================================修改用户↓
    @RequestMapping("/userpage/change.do") /* modify.jsp*/
    public void dochange(String newusername, String newpassword,String yespassword,String email,String name2, HttpServletResponse response)
            throws Exception {
        // 将数据放到Map中
        Map<String, Object> map = new HashMap<String, Object>();
        if(newusername==""||newpassword==""||yespassword=="")  /*判断是否为空*/
            map.put("change",0);
     else if(!newpassword.equals(yespassword)) /*判断密码一致性*/
            map.put("change",1);
     else if((iUserService.selectUserByName(newusername)>0)&&(!newusername.equals(name2))) /*判断用户是否存在*/
            map.put("change",2);
     else {                   /*修改用户*/
          User user = new User(newusername, newpassword, email);
          user.setUserid(iUserService.selectUserByName(name2));
          iUserService.updateSUser(user);
          map.put("change", 3);
      }
        Gson gson = new Gson();
        String myJson = gson.toJson(map);
        // 将数据发回客户端
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        out.print(myJson);
        out.close();
    }
    //======================================================================================================修改用户↑


    //========================================================================================================更改用户信息时信息显示↓
    @RequestMapping("/userpage/user.do")/* modify.jsp*/
   public void douser(String name2, HttpServletResponse httpServletResponse) throws Exception{
        Map<String, Object> map = new HashMap<String, Object>();
        User user=iUserService.selectByNames(name2);
        map.put("username",user.getUsername());
        map.put("id",user.getUserid());
        map.put("password",user.getPassword());
        map.put("email",user.getEmail());
        Gson gson = new Gson();
        String myJson = gson.toJson(map);
        // 将数据发回客户端
        httpServletResponse.setCharacterEncoding("utf-8");
        PrintWriter out = httpServletResponse.getWriter();
        out.print(myJson);
        out.close();
    }
    //======================================================================================================更改用户信息时信息显示↑

  /*  //========================================================================================================忘了干嘛的了↓
    @RequestMapping("/userpage/getname.do")
    public void getname(int userid, HttpServletResponse httpServletResponse) throws Exception{
        Map<String, Object> map = new HashMap<String, Object>();
       map.put("username",iUserService.getName(userid));
        Gson gson = new Gson();
        String myJson = gson.toJson(map);
        // 将数据发回客户端
        httpServletResponse.setCharacterEncoding("utf-8");
        PrintWriter out = httpServletResponse.getWriter();
        out.print(myJson);
        out.close();
    }*/
    //======================================================================================================忘了干嘛的了↑

    //========================================================================================================用户注册↓
    @RequestMapping("/mainpage/signup.do") //registe.jsp
    public  void dosignup(String username,String password,String email,HttpServletResponse httpServletResponse) throws Exception{
        Map<String,Object> map=new HashMap<String, Object>();
        if(username==""||password=="")
            map.put("signup",0);
       else if(iUserService.selectUserByName(username)>0)
            map.put("signup",1);
        else{
            User user=new User(username,password,email);
            iUserService.addUser(user);
            map.put("signup",2);
        }
        Gson gson=new Gson();
        String myJson=gson.toJson(map);
        httpServletResponse.setCharacterEncoding("utf-8");
        PrintWriter out=httpServletResponse.getWriter();
        out.print(myJson);
        out.close();
    }
    //======================================================================================================根据用户ID获取用户名↑

    @RequestMapping("/userpage/getusernamebyid.do")
    @ResponseBody
    public  void getusernamebyid(int uid,HttpServletResponse httpServletResponse) throws Exception{
        Map<String,Object> map=new HashMap<String, Object>();
       map.put("name",iUserService.getName(uid));
        Gson gson=new Gson();
        String myJson=gson.toJson(map);
        httpServletResponse.setCharacterEncoding("utf-8");
        PrintWriter out=httpServletResponse.getWriter();
        out.print(myJson);
        out.close();
    }
    //======================================================================================================根据用户ID获取用户名↑

    @RequestMapping("/mainpage/userInfo.do")
    public String getUsers(@RequestParam(value="pn",defaultValue = "1")Integer pn,Model model){
        /*从第一页开始 每页查询五条数据*/
        PageHelper.startPage(pn,5);
        List<User> users=iUserService.selectAllUser();
        /*将用户信息放入PageInfo对象里*/
        PageInfo page=new PageInfo(users,5);
        model.addAttribute("pageInfo",page);
        return "../adminpage/userManages.jsp";
    }

    @RequestMapping("/adminpage/userUpdate.do")
    @ResponseBody
    public String userUpdate(int userid,String username,String userpassword,String useremail){
        User user=new User();
        user.setUserid(userid);
        user.setUsername(username);
        user.setPassword(userpassword);
        user.setEmail(useremail);
        if(iUserService.updateSUser(user)==true){
            return "1";
        }else{
            return "0";
        }
    }
    @RequestMapping("/adminpage/userDelete.do")
    @ResponseBody
    public Object userDelete(int id){
        iUserService.deleteUser(id);
        return "1";
    }
}
