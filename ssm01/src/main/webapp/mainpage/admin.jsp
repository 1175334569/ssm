<%@ page import="com.neu.bean.Admin" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>SuperAdminLogin</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
    body {
        padding: 10px;
    }

    .headLeft {
        float: right;
    }

    .headRight {
        padding-top: 40px;
        padding-left: 340px;
    }

    .search {
        margin-bottom: 10px;
    }

    .search .toolbar {}
</style>
<body>
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" >PicShare</a>
        </div>
        <div>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a class="navbar-brand" href="#">当前管理员：${ADMIN.adminname}</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fiuled">
    <div class="row" style="padding-top: 10px">
        <div class="col-lg-2">
            <div class="list-group">
                <!--激活，作为标题-->
                <a href="#" class="list-group-item active ">
                    菜单
                </a>
                <a href="userInfo.do" target="iframe_a" class="list-group-item">用户管理</a>
                <a href="/adminpage/modify.jsp?id=${ADMIN.adminid}" target="iframe_a" class="list-group-item">更改信息</a>
                <div title="退出" url="/mainpage/primary.jsp"></div>
                <a href="/mainpage/primary.jsp" class="list-group-item">退出</a>
            </div>
        </div>
        <div class="col-lg-10">
            <div>
                <ol class="breadcrumb">
                    <li><span class="glyphicon glyphicon-home"></span>&nbsp;
                        <a href="primary.jsp">主页</a>
                    </li>
                    <li class="active"></li>
                </ol>
            </div>
            <div align="center" style="padding-top: 10px;">
                <iframe src="/adminpage/welcome.jsp" name="iframe_a" frameborder="0" width="1380px" height="600px" style="float: right"></iframe>
            </div>
        </div>
    </div>
</div>
</body>

</html>