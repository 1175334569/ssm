<%--
  Created by IntelliJ IDEA.
  User: hua
  Date: 2018/7/31
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户列表</title>
    <!-- Bootstrap -->
    <link href="${APP_PATH}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <%--<script type="javascript" src="${APP_PATH}/js/jquery-3.0.0.js"></script>--%>
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <!--加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <%--<script type="javascript" src="${APP_PATH}/bootstrap/js/bootstrap.js"></script>--%>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
    <!-- 标题-->
    <div class="row">
        <div class="col-md-4  col-md-offset-4">
            <h2>用户列表</h2>
        </div>
    </div>
    <%--模态框--%>
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="exampleModalLabel">请修改用户信息：</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <h4>名字</h4>
                            <div class="input-group input-group-lg" display：block;margin：0 auto;>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                <input type="text" id="user_name" name="username" class="form-control " placeholder="请输入新的名字...">
                            </div>
                            <h4>密码</h4>
                            <div class="input-group input-group-lg" display：block;margin：0 auto;>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                <input type="text" id="user_password" name="password" class="form-control " placeholder="请输入新的密码...">
                            </div>
                            <h4>邮箱</h4>
                            <div class="input-group input-group-lg" display：block;margin：0 auto;>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                                <input type="text" id="user_email" name="email" class="form-control " placeholder="请输入新的邮箱...">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="updateuser(uid)">确认</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 按钮-->
    <%--<div class="row">
        <div class="col-md-3 col-md-offset-8">
            <button type="button" class="btn btn-success">新增</button>
            <button type="button" class="btn btn-danger">删除</button>
        </div>
    </div>--%>
    <!-- 表格-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>ID</th>
                    <th>用户名</th>
                    <th>密码</th>
                    <th>Email</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="user">
                    <tr>
                        <td>${user.userid}</td>
                        <td>${user.username}</td>
                        <td>${user.password}</td>
                        <td>${user.email}</td>
                        <td>
                            <button type="button" class="btn btn-primary btn-sm" onclick="upopen(${user.userid})">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                修改
                            </button>
                            <button type="button" class="btn btn-danger btn-sm" onclick="deleteuser(${user.userid})">
                                <span class="glyphicon glyphicon-trash " aria-hidden="true"></span>
                                删除
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>

        </div>
    </div>
    <%--弹出模态框的函数--%>
    <script type="text/javascript" src="js/jquery-3.0.0.js"></script>
    <script type="text/javascript">
        var uid;
        function upopen(obj) {
            uid=obj;
            //alert(uid);
           $('#exampleModal').modal('show');
        }
    </script>

    <script type="text/javascript">
        function updateuser(uids) {
            var userid=uids;
            var username=$("#user_name").val();
            var userpassword=$("#user_password").val();
            var useremail=$("#user_email").val();
            //alert(uids);
            if(username==""||userpassword==""||useremail==""){
                alert("输入信息不能为空！");
            }else {
                $.ajax({
                    url: "userUpdate.do",
                    data: {
                        userid: userid,
                        username: username,
                        userpassword: userpassword,
                        useremail: useremail,
                    },
                    success: function (data) {
                        if (data = 1) {
                            alert("修改成功！");
                        } else {
                            alert("修改失败！");
                        }
                    },
                    error:function () {
                        alert("1111");
                    }
                });
            }
        }
    </script>

    <script type="text/javascript">
        function deleteuser(id) {
            $.ajax({
                url:"userDelete.do",
                data:{
                    id:id,
                },
                success:function (data) {
                    alert("1111");
                },
                error:function () {
                    alert("6333");
                }
            });
        }
    </script>
    <!-- 分页信息-->
    <div class="row">
        <!-- 分页文字信息-->
        <div class="col-md-6">
            当前为第 ${pageInfo.pageNum} 页,总共有 ${pageInfo.pages} 页，总共有 ${pageInfo.total} 条记录
        </div>
        <!-- 分页条-->
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${APP_PATH}/mainpage/userInfo.do?pn=1">首页</a></li>
                    <!--上一页-->
                    <li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <a href="${pageContext.request.contextPath}/mainpage/userInfo.do?pn=${pageInfo.pageNum-1}"
                               aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </c:if>
                    </li>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                        <c:if test="${page_num == pageInfo.pageNum}">
                            <li class="active"><a href="#">${page_num}</a></li>
                        </c:if>
                        <c:if test="${page_num != pageInfo.pageNum}">
                            <li><a href="${pageContext.request.contextPath}/mainpage/userInfo.do?pn=${page_num}">${page_num}</a>
                            </li>
                        </c:if>

                    </c:forEach>
                    <!--下一页-->
                    <li>
                        <c:if test="${pageInfo.hasNextPage}">
                            <a href="${pageContext.request.contextPath}/emps?pn=${pageInfo.pageNum+1}"
                               aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </c:if>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/mainpage/userInfo.do?pn=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>

</body>
</html>
