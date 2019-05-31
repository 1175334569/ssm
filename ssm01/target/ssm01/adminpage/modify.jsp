<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <% String id=request.getParameter("id");%>
    <meta charset="utf-8">
    <title>modify</title>
    <input type="hidden" id="adminid" value="<%=id%>">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery-3.0.0.js"></script>
</head>

<body>
<div class="container">
    <div class="row"  >
        <h2 style="text-align: center">修改信息</h2>
    </div>
    <div class="col-md-6 col-md-offset-3 ">
        <h4>用户名</h4>
        <div class="input-group input-group-lg" display：block;margin：0 auto;>
            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
            <input type="text" id="edit_admin_adminname" class="form-control "
                   name="adminname" placeholder="请输入新的用户名...">
        </div>
    </div>
    <div class="col-md-6 col-md-offset-3 ">
        <h4>密码</h4>
        <div class="input-group input-group-lg" display：block;margin：0 auto;>
            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
            <input type="password" id="edit_admin_adminpassword" class="form-control "
                   name="adminpassword" placeholder="请输入新的密码...">
        </div>
    </div>

    <div class="col-md-6 col-md-offset-3 ">
        <h4>再次确认密码</h4>
        <div class="input-group input-group-lg" display：block;margin：0 auto;>
            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
            <input type="password" id="edit_admin_adminpassword1" class="form-control "
                   name="adminpassword" placeholder="请确认新的输入密码...">
        </div>
    </div>
    <div class="col-md-6 col-md-offset-3">
        <h1>   </h1>
        <h2>   </h2>
        <p>
            <input type = "button" class="btn btn-primary btn-lg btn-block" onclick="update()" value = "确定">
            <input type = "button" class="btn btn-primary btn-lg btn-block" value = "取消"
                   onclick = "window.location.href = 'welcome.jsp'">
        </p>
    </div>
</div>
<h1> </h1>
<script type="text/javascript">
    function update() {
        var adminid=$("#adminid").val();
        var newuser=$("#edit_admin_adminname").val();
        var password=$("#edit_admin_adminpassword").val();
        var password1=$("#edit_admin_adminpassword1").val();
        /*alert(userid);*/
        if(newuser==""||password==""){
            alert("输入信息不能为空！");
        }else if(password!=password1){
            alert("密码不一致！");
        }else {
            $.ajax({
                url:"update.do",
                data:{
                    adminid:adminid,
                    newuser:newuser,
                    password:password,
                },
                success:function (data) {
                    if(data==1){
                        alert("更改信息成功!");
                    }
                    else{
                        alert("更改信息失败!");
                    }
                },
            });
        }
    }
</script>
</body>

</html>