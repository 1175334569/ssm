<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/7/23
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>照片分享平台</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style>
        #example1 {
            background: url(/images/4.jpg) left top repeat;
            padding: 15px;
        }
    </style>

    <style type="text/css">

        @import 'https://fonts.googleapis.com/css?family=Lato:300';
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            /*background: white;*/
        }

        .wrapper {
            width: 100%;
            height: 40%;
        }
        .wrapper section {
            width: calc(100% / 3);
            height: 100%;
            float: left;
            -webkit-filter: grayscale(50%);
            filter: grayscale(50%);
            transition-duration: 0.5s;
            position: relative;
        }
        .wrapper section::before {
            content: "";
            position: absolute;
            width: 100%;
            height: 100%;
            background: linear-gradient(rgba(0, 0, 0, 0.6), transparent);
            opacity: 1;
            transition: 0.3s;
        }
        .wrapper section.sec01 {
            background: url("/images/1.jpg");
        }
        .wrapper section.sec02 {
            background: url("/images/2.jpg");
        }
        .wrapper section.sec03 {
            background: url("/images/3.jpg");
        }
        .wrapper section.sec01, .wrapper section.sec02, .wrapper section.sec03 {
            background-repeat: no-repeat;
            background-position: 50% 50%;
            background-size: cover;
        }
        .wrapper:hover section:hover {
            width: 40%;
            -webkit-filter: grayscale(0%);
            filter: grayscale(0%);
        }
        .wrapper:hover section:hover::before {
            opacity: 0;
        }
        .wrapper:hover section:not(:hover) {
            width: 30%;
        }

        .alternative {
            display: inline-block;
            top: 20%;
            left: 50%;
            position: absolute;
            -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
            font-family: "Lato", Arial, sans-serif;
            letter-spacing: 0.08em;
            line-height: 1;
            font-size: 2.4rem;
            text-align: center;
            color: rgba(255, 255, 255, 0.6);
            background: rgba(0, 0, 0, 0.4);
            padding: 0.6em 1em;
        }
        .alternative a {
            margin-top: 15px;
            font-size: 1.2rem;
            display: block;
            padding: 0.6em 0;
            background: rgba(255, 255, 255, 0.2);
            color: rgba(255, 255, 255, 0.6);
            text-decoration: none;
            transition-duration: 0.3s;
        }
        .alternative a:hover {
            background: rgba(255, 255, 255, 0.6);
            color: #333;
        }
        .header{
            position: fixed;
            top:0;
            width: 100%;
            height: 50px;
            background:transparent;
        }
        .img_div {
            /*margin: 20px 400px 0 400px;*/
            position: relative;
            width: 330px;
            height: 230px;
        }
        .mask {
            position: absolute;
            top: 0;
            left: 0;
            width: 330px;
            height: 230px;
            background: rgba(0,0, 0, 0.6);
            color: #ffffff;
            opacity: 0;
        }
        .album {
            position: absolute;
            top: 0;
            left: 0;
            width: 330px;
            height: 230px;
            background: rgba(0,0, 0, 0.6);
            color: #ffffff;
            opacity: 0;
        }
        .ceshi
        {
            position:absolute;
            bottom: 9%;
            display: block;
            width: 150px;
            left:50%;
            margin-left:-125px;
        }
        .mask h3 {
            text-align: center;
        }
        /*   .mask button{
               position: absolute;        !* 相对于容器绝对定位 *!
               bottom: 0px;
           }*/
        .bt{
            position: absolute;        /* 相对于容器绝对定位 */
            bottom:0px;
        }
        .bt1{
            position: absolute;        /* 相对于容器绝对定位 */
            right: 0px;
            bottom:0px;
        }
        .img_div a:hover .mask  {
            opacity: 1;
        }
        .img_div a:hover .album  {
            opacity: 1;
        }
    </style>

</head>
<body>

<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
<script type="text/javascript">
    (function () {
        $.MsgBox = {
            Alert: function (title, msg) {
                GenerateHtml("alert", title, msg);
                btnOk();  //alert只是弹出消息，因此没必要用到回调函数callback
                btnNo();
            },
            Confirm: function (title, msg, callback) {
                GenerateHtml("confirm", title, msg);
                btnOk(callback);
                btnNo();
            }
        }
        //生成Html
        var GenerateHtml = function (type, title, msg) {
            var _html = "";
            _html += '<div id="mb_box"></div><div id="mb_con"><span id="mb_tit">' + title + '</span>';
            _html += '<a id="mb_ico">x</a><div id="mb_msg">' + msg + '</div><div id="mb_btnbox">';
            if (type == "alert") {
                _html += '<input id="mb_btn_ok" type="button" value="确定" />';
            }
            if (type == "confirm") {
                _html += '<input id="mb_btn_ok" type="button" value="确定" />';
                _html += '<input id="mb_btn_no" type="button" value="取消" />';
            }
            _html += '</div></div>';
            //必须先将_html添加到body，再设置Css样式
            $("body").append(_html);
            //生成Css
            GenerateCss();
        }

        //生成Css
        var GenerateCss = function () {
            $("#mb_box").css({ width: '100%', height: '100%', zIndex: '99999', position: 'fixed',
                filter: 'Alpha(opacity=60)', backgroundColor: 'black', top: '0', left: '0', opacity: '0.6'
            });
            $("#mb_con").css({ zIndex: '999999', width: '400px', position: 'fixed',
                backgroundColor: 'White', borderRadius: '15px'
            });
            $("#mb_tit").css({ display: 'block', fontSize: '14px', color: '#444', padding: '10px 15px',
                backgroundColor: '#DDD', borderRadius: '15px 15px 0 0',
                borderBottom: '3px solid #009BFE', fontWeight: 'bold'
            });
            $("#mb_msg").css({ padding: '20px', lineHeight: '20px',
                borderBottom: '1px dashed #DDD', fontSize: '13px'
            });
            $("#mb_ico").css({ display: 'block', position: 'absolute', right: '10px', top: '9px',
                border: '1px solid Gray', width: '18px', height: '18px', textAlign: 'center',
                lineHeight: '16px', cursor: 'pointer', borderRadius: '12px', fontFamily: '微软雅黑'
            });
            $("#mb_btnbox").css({ margin: '15px 0 10px 0', textAlign: 'center' });
            $("#mb_btn_ok,#mb_btn_no").css({ width: '85px', height: '30px', color: 'white', border: 'none' });
            $("#mb_btn_ok").css({ backgroundColor: '#168bbb' });
            $("#mb_btn_no").css({ backgroundColor: 'gray', marginLeft: '20px' });
            //右上角关闭按钮hover样式
            $("#mb_ico").hover(function () {
                $(this).css({ backgroundColor: 'Red', color: 'White' });
            }, function () {
                $(this).css({ backgroundColor: '#DDD', color: 'black' });
            });
            var _widht = document.documentElement.clientWidth;  //屏幕宽
            var _height = document.documentElement.clientHeight; //屏幕高
            var boxWidth = $("#mb_con").width();
            var boxHeight = $("#mb_con").height();
            //让提示框居中
            $("#mb_con").css({ top: (_height - boxHeight) / 2 + "px", left: (_widht - boxWidth) / 2 + "px" });
        }
        //确定按钮事件
        var btnOk = function (callback) {
            $("#mb_btn_ok").click(function () {
                j=0;
                $("#mb_box,#mb_con").remove();
                if (typeof (callback) == 'function') {
                    callback();
                }
                /*else location.reload(true);*/
            });
        }
        //取消按钮事件
        var btnNo = function () {
            $("#mb_btn_no,#mb_ico").click(function () {
                j=0;
                $("#mb_box,#mb_con").remove();
            });
        }
    })();

    $(function() {
        $(document).on("click", "#button1", function () {
            var blalbum1=document.getElementsByName("blalbum1")[0];
            var blalbum=blalbum1.options[blalbum1.selectedIndex].innerText;
            var type1=document.getElementsByName("type1")[0];
            var type=type1.options[type1.selectedIndex].innerText;
            var describe=$("#picturedescribe1").val();
            var file1=new FormData($("#file")[0]);
            var name=$("#namepicture").val();
            file1.append("blalbum",blalbum);
            file1.append("type",type);
            file1.append("describe",describe);
            file1.append("username",name);
            var Nofile=$("#inputfile").val();
            if(Nofile!="") {
                $.ajax({//发送ajax请求
                    url: "hellohaha.do",
                    type: 'POST',
                    data: file1,
                    async: false,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (data) {//成功返回的数据处理
                        var myJson = eval("(" + data + ")");
                        if (myJson.name == 2) {
                            $.MsgBox.Alert("提示","照片上传成功！");
                            aaaa();
                        }
                        else if (myJson.name == 1) {
                            $.MsgBox.Alert("提示","照片上传失败！");
                        }
                    },
                    error:function (data) {
                        $.MsgBox.Alert("提示","照片上传失败！");
                    }
                });
            }
            else $.MsgBox.Alert("提示","请选择图片！");
        });
    });
</script>
<div class="wrapper">
    <section class="sec01"></section>
    <section class="sec02"></section>
    <section class="sec03"></section>
</div>
<% String name2=request.getParameter("haha");%>
<%--菜单栏--%>
<div class="header">
    <ul class="nav nav-pills">
        <li class="active"><a href="/mainpage/primary.jsp?haha=<%=name2%>">HOME</a></li>
    </ul>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document" style="width:1000px">
        <div class="container">
            <div class="jumbotron">
                <div class="container">
                    <div class="row clearfix">
                        <script>
                            var tableContent ="";
                            tableContent+='<div class="col-md-9 column">';
                            tableContent+='<img class="img-thumbnail" width="1000" id="pic1">'
                            tableContent+='<dt></dt>'
                            tableContent+='</div>';
                            tableContent+='<div class="col-md-3 column">';
                            tableContent+='<dl>';
                            tableContent+='<dt>';
                            tableContent+='相片名字:';
                            tableContent+=' </dt>';
                            tableContent+='<dd id="text1">'
                            tableContent+='</dd>';
                            tableContent+='<dt>';
                            tableContent+='创建日期:';
                            tableContent+='</dt>';
                            tableContent+='<dd id="text2">';
                            tableContent+='</dd>';
                            tableContent+='<dt>';
                            tableContent+='所属相册:';
                            tableContent+='</dt>';
                            tableContent+='<dd id="text3">';
                            tableContent+='</dd>';
                            tableContent+='<dt>';
                            tableContent+='具体描述:';
                            tableContent+='</dt>';
                            tableContent+='<dd id="text4">';
                            tableContent+='</dd>';
                            tableContent+='</dl>';
                            document.write(tableContent);
                        </script>
                    </div>
                    </div><%--别删div！！！！--%>
                </div>
            </div>
        </div>
    </div>
</div><%--点击跳出的模态框--%>
<%--//=========================================================================================================================================--%>
<ul id="myTab1" class="nav nav-tabs">
    <li onclick="aaaa()" class="active">
        <a href="#first22" data-toggle="tab">照片管理</a>
    </li>
    <li onclick="bbbb()">
        <a href="#first33" data-toggle="tab">相册管理</a>
    </li>
    <li onclick="cccc()">
        <a href="#first44" data-toggle="tab">信息更改</a>
    </li>
</ul><%--标签页--%>

<div id="myTabContent" class="tab-content">
<%--//==========================================================================================--%>
                <div class="tab-pane fade in active" id="first22">
                    <nav class="navbar" role="navigation">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <%--上传照片--%>
                                <button type="button" class="btn btn-primary" ONCLICK="editpic(0,0)" data-toggle="modal" data-target="#exampleModal1" data-whatever="@mdo">
                                    <span class="glyphicon glyphicon-arrow-up"></span> 上传照片
                                </button>
                                <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close"  data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                                <h4 class="modal-title" id="exampleModalLabel1">上传照片</h4>
                                            </div>
                                            <div class="modal-body">
                                                <form method="post" id="file" action="" enctype="multipart/form-data">
                                                    <input class="hidden" id="namepicture" name="namepicture" value="<%=name2%>">
                                                    <div class="form-group">
                                                        <label for="inputfile">请选择上传图片</label>
                                                        <input type="file" id="inputfile" name="file1">
                                                    </div>
                                                    <h4>照片描述</h4>
                                                    <div class="input-group input-group-lg" display：block;margin：0 auto;>
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                                        <input type="text" id="picturedescribe1" class="form-control " placeholder="照片描述...">
                                                    </div>
                                                    <h4>所属相册</h4>
                                                    <form role="form">
                                                        <div class="form-group">
                                                            <%--<label for="blalbum">请选择：</label>--%>
                                                            <select id="first1" name="blalbum1" class="form-control">
                                                                <option></option>
                                                            </select>
                                                        </div>
                                                    </form>
                                                    <h4>照片类型</h4>
                                                    <form role="form">
                                                        <div class="form-group">
                                                            <%--<label for="blalbum">请选择：</label>--%>
                                                            <select id="TYPE1" name="type1" class="form-control">
                                                                <option></option>
                                                            </select>
                                                        </div>
                                                    </form>
                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="back()">返回</button>
                                                <button type="button" id="button1" class="btn btn-primary" data-dismiss="modal">确认</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--搜索--%>
                                <div class="col-lg-6 col-md-offset-3">
                                    <div class="input-group">
                                        <input id="searchtext" type="text" class="form-control" placeholder="Search">
                                        <span class="input-group-btn">
        					<button id="searchbtn"  class="btn btn-default btn-search " type="button" ><span class="glyphicon glyphicon-search"></span></button>
     						 </span>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </nav>
                        <script type="text/javascript">
                            $(function(){
                                var name=$("#namepicture").val();
                                $("button#searchbtn").click(function() {
                                    document.getElementById("AllPic5").innerHTML="";
                                    var search = $("#searchtext").val();
                                    $.ajax({
                                        type:'post',
                                        data:{
                                            search:search,
                                            username:name,
                                        },
                                        dataType:'json',
                                        url: 'search1.do',
                                        success: function (data) {
                                            for(var i=0; i<data.length; i++){
                                                var ad=data[i].pictureid;
                                                var picture=data[i].picture;
                                                var picturename=data[i].picturename;
                                                $("#AllPic5").append("<div class=\"col-sm-6 col-md-3\">" +
                                                    "<div class=\"img_div\">" +
                                                    "<img  src='"+data[i].picture+"' id="+ad+" width='330' height='230'>" +   //修改相片大小
                                                    "<a href=\"#\">"+
                                                    "<div class=\"mask\" onclick='showp("+ad+","+i+")'>" +
                                                    "<h4>"+data[i].picturename+"</h4>"+
                                                    "<p>日期："+data[i].date+"</p>"+
                                                    "<div class=\"bt\" >"+
                                                    "<button type=\"button\" id="+ad+" class=\"btn btn-danger\"  onclick='delectpic(this)'>"+
                                                    "<span class=\"glyphicon glyphicon-trash\"></span> 删除"+
                                                    "</button>"+
                                                    "</div>"+
                                                    "<div class=\"bt1\" >"+
                                                    "<button type=\"button\" onclick='editpic(this.value,"+ad+")' value="+picturename+" class=\"btn btn-primary\"  data-toggle=\"modal\" data-target=\"#exampleModal2\" data-whatever=\"@mdo\">"+
                                                    "<span class=\"glyphicon glyphicon-pencil\"></span> 编辑"+
                                                    "</button>"+
                                                    "</div>"+
                                                    "</div>"+
                                                    "</a>"+
                                                    "</div>"+
                                                    "<h2></h2>"+
                                                    "</div>");
                                            }
                                        },
                                        error:function () {
                                            alert("error");
                                        }
                                    });
                                });
                            });
                    </script>

                    <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <h4 class="modal-title" id="exampleModalLabel">请修改照片信息：</h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <h4>名字</h4>
                                            <div class="input-group input-group-lg" display：block;margin：0 auto;>
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                                <input type="text" id="picturename" class="form-control " placeholder="照片名字...">
                                            </div>
                                            <h4>照片描述</h4>
                                            <div class="input-group input-group-lg" display：block;margin：0 auto;>
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                                <input type="text" id="picturedescribe" class="form-control " placeholder="照片描述...">
                                            </div>
                                            <h4>所属相册</h4>
                                            <form role="form">
                                                <div class="form-group">
                                                    <%--<label for="blalbum">请选择：</label>--%>
                                                    <select id="first" name="blalbum" class="form-control">
                                                        <option></option>
                                                    </select>
                                                </div>
                                            </form>
                                            <h4>照片类型</h4>
                                            <form role="form">
                                                <div class="form-group">
                                                    <%--<label for="blalbum">请选择：</label>--%>
                                                    <select id="TYPE" name="type" class="form-control">
                                                        <option></option>
                                                    </select>
                                                </div>
                                            </form>

                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button"   class="btn btn-default" data-dismiss="modal" onclick="back()">返回</button>
                                    <button type="button" id="button2" class="btn btn-primary" data-dismiss="modal" onclick="modifypicture()">确认</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade in active">
                        <div class="row" id="AllPic5">
                            <script>
                                var Data;
                                var jude=0;
                                $(function (){
                                    var name=$("#namepicture").val();
                                    jude++;
                                    aaaa();
                                    $.ajax({
                                        url:"edit.do",
                                        data:{
                                          username:name,
                                        },
                                        success:function (data) {
                                            for(var i=0;i<data.length;i++){
                                                $("#first").append(
                                                    "<option>"+data[i].albumname+"</option>"
                                                )
                                                $("#first1").append(
                                                    "<option>"+data[i].albumname+"</option>"
                                                )
                                            }
                                        },
                                    });
                                    $.ajax({
                                        url:"type.do",
                                        success:function (data) {
                                            for(var i=0;i<data.length;i++){
                                                $("#TYPE").append(
                                                    "<option>"+data[i].typename+"</option>"
                                                )
                                                $("#TYPE1").append(
                                                    "<option>"+data[i].typename+"</option>"
                                                )
                                            }
                                        },
                                        error:function (data) {
                                            alert(1111);
                                        }
                                    });
                                });
                                function aaaa() {
                                    document.getElementById("AllPic5").innerHTML="";
                                    var name=$("#namepicture").val();
                                    $.ajax({
                                        type:'post',
                                        dataType:'json',
                                        url: 'userpic.do',
                                        data:{
                                            name:name,
                                        },
                                        success: function (data) {
                                            Data=data;
                                            for(var i=0;i<data.length;i++){
                                                var ad=data[i].pictureid;
                                                var picture=data[i].picture;
                                                var picturename=data[i].picturename;
                                                $("#AllPic5").append("<div class=\"col-sm-6 col-md-3\">" +
                                                    "<div class=\"img_div\">" +
                                                    "<img  src='"+data[i].picture+"' id="+ad+" width='330' height='230'>" +   //修改相片大小
                                                    "<a href=\"#\">"+
                                                    "<div class=\"mask\" onclick='showp("+ad+","+i+")'>" +
                                                    "<h4>"+data[i].picturename+"</h4>"+
                                                    "<p>日期："+data[i].date+"</p>"+
                                                    "<div class=\"bt\" >"+
                                                    "<button type=\"button\" id="+ad+" class=\"btn btn-danger\"  onclick='delectpic(this)'>"+
                                                    "<span class=\"glyphicon glyphicon-trash\"></span> 删除"+
                                                    "</button>"+
                                                    "</div>"+
                                                    "<div class=\"bt1\" >"+
                                                    "<button type=\"button\" onclick='editpic(this.value,"+ad+")' value="+picturename+" class=\"btn btn-primary\"  data-toggle=\"modal\" data-target=\"#exampleModal2\" data-whatever=\"@mdo\">"+
                                                    "<span class=\"glyphicon glyphicon-pencil\"></span> 编辑"+
                                                    "</button>"+
                                                    "</div>"+
                                                    "</div>"+
                                                    "</a>"+

                                                    "</div>"+
                                                    "<h1></h1>"+
                                                    "</div>");
                                            }
                                        },
                                        error:function (data) {
                                            alert("error");
                                        }
                                    });

                                }
                                function showp(e,pid){
                                    if(j==0) {
                                        var div = document.getElementById(e);
                                        var src = div.getAttribute("src");
                                        var img = document.getElementById("pic1");
                                        $.ajax({
                                           url:"getalbumname.do",
                                            data:{
                                              Aid:Data[pid].aid,
                                            },
                                            success:function (data) {
                                                var myJson = eval("(" + data + ")");
                                                document.getElementById("text3").innerHTML=myJson.albumName;
                                            }
                                        });
                                        img.setAttribute("src", src);
                                        document.getElementById("text1").innerHTML=Data[pid].picturename;
                                        document.getElementById("text2").innerHTML=Data[pid].date;
                                        document.getElementById("text4").innerHTML=Data[pid].picturediscribe;
                                        $('div#exampleModal').modal('show');

                                        /*var src=e.getAttribute("src");
                                        var i=e.getAttribute("alt");
                                        //var src=e;
                                        var img = document.getElementById("pic1");
                                        img.setAttribute("src",src);
                                        document.getElementById("text1").innerHTML=Data[i].picturename;
                                        document.getElementById("text2").innerHTML=Data[i].createdate;
                                        /!*document.getElementById("text3").innerHTML=Data[i].;*!/
                                        document.getElementById("text4").innerHTML=Data[i].picturediscribe;
                                        $('div#exampleModal').modal('show');*/
                                    }
                                    else j==0;
                                }
                                var i=0;//记录删除时Id
                                var j=0;//判断是否为删除和编辑照片
                                var pn;//记录照片名
                                var id;//记录相片ID

                                //=====================================================================================删除图片
                                function delectpic(e) {
                                    j++;
                                    i=e.getAttribute("id");
                                    $.MsgBox.Confirm("提示","确定删除？",delectpic1);
                                }
                                function delectpic1(){
                                    var pictureid=i;
                                    $.ajax({
                                        url:"delect.do",
                                        data:{
                                            pictureid:pictureid,
                                        },
                                        success:function (data) {
                                            var myJson = eval("(" + data + ")");
                                            if(myJson.delect==1){
                                                $.MsgBox.Alert("提示","已删除！");
                                                aaaa();
                                            }
                                            else $.MsgBox.Alert("提示","删除失败");
                                        },
                                        error:function (data) {
                                            $.MsgBox.Alert("提示","删除失败");
                                        },
                                    })
                                };
                                //=======================================================================================//修改图片属性

                                function back() {
                                    j=0;
                                }
                                function editpic(e,ID) {
                                    j++;
                                    pn=e;
                                    id=ID;
                                }
                                function modifypicture() {
                                    $.MsgBox.Confirm("提示", "确定修改？", bbb);
                                }

                                function bbb() {
                                    var blalbum1=document.getElementsByName("blalbum")[0];
                                    var blalbum=blalbum1.options[blalbum1.selectedIndex].innerText;
                                    var type1=document.getElementsByName("type")[0];
                                    var type=type1.options[type1.selectedIndex].innerText;
                                    var oldname=pn;
                                    var picid=id;
                                    var newname=$("#picturename").val();
                                    var describe=$("#picturedescribe").val();
                                    var name=$("#namepicture").val();
                                    $.ajax({
                                        url:"modifypicture.do",
                                        data:{
                                            username:name,
                                            oldname:oldname,
                                            picid:picid,
                                            newname:newname,
                                            blalbum:blalbum,
                                            describe:describe,
                                            type:type,
                                        },
                                        success:function (data) {
                                            var myJson = eval("(" + data + ")");
                                            if(myJson.modify==1){
                                                $.MsgBox.Alert("提示","更改成功！");
                                                aaaa();
                                            }
                                            else $.MsgBox.Alert("提示","更改失败！");
                                        },
                                        error:function (data) {
                                            $.MsgBox.Alert("提示","更改失败！");
                                        }
                                    });
                                }


                            </script>
                        </div>
                    </div>
                </div>

    <%--//===================================================================================================================================--%>
    <div class="tab-pane fade in active" id="first33">
        <div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title" id="exampleModalLabel2">请添加照片信息：</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <h4>相册名称</h4>
                                <div class="input-group input-group-lg" display：block;margin：0 auto;>
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                    <input type="text" id="albumname" class="form-control " placeholder="相册名字...">
                                </div>
                                <h4>相册描述</h4>
                                <div class="input-group input-group-lg" display：block;margin：0 auto;>
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                    <input type="text" id="albumdescribe" class="form-control " placeholder="相册描述...">
                                </div>

                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button"   class="btn btn-default" data-dismiss="modal" onclick="back()">返回</button>
                        <button type="button" id="button3" class="btn btn-primary" data-dismiss="modal" onclick="addalbum()">确认</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="exampleModal4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2">                         <%--//修改相册信息--%>
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title" id="exampleModalLabel4">请修改照片信息：</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <h4>相册名称</h4>
                                <div class="input-group input-group-lg" display：block;margin：0 auto;>
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                    <input type="text" id="albumname1" class="form-control " placeholder="相册名字...">
                                </div>
                                <h4>相册描述</h4>
                                <div class="input-group input-group-lg" display：block;margin：0 auto;>
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                    <input type="text" id="albumdescribe1" class="form-control " placeholder="相册描述...">
                                </div>

                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button"   class="btn btn-default" data-dismiss="modal" onclick="back()">返回</button>
                        <button type="button" id="buttonedit" class="btn btn-primary" data-dismiss="modal" onclick="editalbum1()">确认</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" id="AllAlbum">
            <script>
                function bbbb() {
                    document.getElementById("AllAlbum").innerHTML="";
                    $("#AllAlbum").append("<div class=\"col-md-11\">\n" +
                        "<button type=\"button\"  class=\"btn btn-primary\"data-toggle=\"modal\" data-target=\"#exampleModal3\" data-whatever=\"@mdo\"> <%--//添加相册功能--%>\n" +
                        "<span class=\"glyphicon glyphicon-plus\"></span> 添加\n" +
                        "</button>\n" +
                        "</div>");
                    var name=$("#namepicture").val();
                    $.ajax({
                        url: 'useralbum.do',
                        type:'post',
                        data:{
                            name:name,
                        },
                        dataType:'json',
                        success: function (data) {
                            for(var i=0;i<data.length;i++){
                                if(data[i].albumid!=""&&data[i].uid!="")
                                    var pic= getfirstpic(data[i].albumid,data[i].uid);
                                $("#AllAlbum").append("<div class=\"col-sm-6 col-md-3\">" +
                                    "<div class='img_div' >" +
                                    "<div class='ceshi'>"+
                                    "<img src="+pic+" width='250' height='180'>"+
                                    "</div>" +
                                    "<img src='../images/背景.jpg'  width='330' height='230'> "+
                                    /*         "<img src='"+data[i].albumname+"' alt='"+data[i].albumname+"' onclick='setCookie(this)'>" +*/
                                    "<a href=\"#\">"+
                                    "<div class=\"album\" onclick='showa("+data[i].albumid+","+data[i].uid+")'>" +
                                    "<h4>"+data[i].albumname+"</h4>"+
                                    "<p>日期："+data[i].albumdate+"</p>"+
                                    "<div class=\"bt\" >"+
                                    "<button type=\"button\"  class=\"btn btn-danger\"  onclick='delectalbum(this)'id="+data[i].albumid+">"+
                                    "<span class=\"glyphicon glyphicon-trash\"></span> 删除"+
                                    "</button>"+
                                    "</div>"+
                                    "<div class=\"bt1\" >"+
                                    "<button type=\"button\"   class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#exampleModal4\" data-whatever=\"@mdo\" onclick='editalbum("+data[i].albumid+","+data[i].uid+")'>"+
                                    "<span class=\"glyphicon glyphicon-pencil\"></span> 编辑"+
                                    "</button>"+
                                    "</div>"+
                                    "</div>"+
                                    "</a>"+

                                    "</div>" +
                                    "</div>");
                            }
                        },
                        error:function (data) {
                            alert("error");
                        }
                    });
                }
                var i=0;
                var j=0;
                var aid=0;
                var uid=0;
                function editalbum(a,u) {
                    j++;
                    aid=a;
                    uid=u;
                }
                function editalbum1() {
                    var albumname=$("#albumname1").val();
                    var describe=$("#albumdescribe1").val();
                    $.ajax({
                        url:"editalbum.do",
                        data:{
                            aid:aid,
                            uid:uid,
                            name:albumname,
                            describe:describe,
                        },
                        success:function (data) {
                              if(data==1){
                                  $.MsgBox.Alert("提示","修改成功");
                                  bbbb();
                              }

                              else  $.MsgBox.Alert("提示","修改失败");
                        },
                        error:function (data) {
                            $.MsgBox.Alert("提示","修改失败");
                        }
                    });
                }
                function delectalbum(e) {
                    j++;
                    i=e.getAttribute("id");
                    $.MsgBox.Confirm("提示","确定要删除吗？",delectalbum1);
                }
                function showa(a,u){
                    if(j==0) {
                        window.location.href="albumpicture.jsp?a="+a+'&u='+u;
                    }
                    else j==0;
                }
                function getfirstpic(a,u) {
                    /* var aid=e.val();*/
                    var aid=a;
                    var uid=u;
                    var pic;
                    $.ajax({
                        url: 'getfirstpic.do',
                        type: 'post',
                        async: false,
                        data: {
                            aid:aid,
                            uid:uid,
                        },
                        success:function (data) {
                            pic=data.picture;
                        }
                    });

                    return pic;
                }
                function delectalbum1(){
                    var albumid=i;
                    $.ajax({
                        url:"delectalbum.do",
                        data:{
                            albumid:albumid,
                        },
                        success:function (data) {
                            var myJson = eval("(" + data + ")");
                            if(myJson.delect==1){
                                $.MsgBox.Alert("提示","已删除！");
                                bbbb();
                                j=0;
                            }
                            else $.MsgBox.Alert("提示","删除失败");
                        },
                        error:function (data) {
                            $.MsgBox.Alert("提示","删除失败");
                        },
                    })
                };
                function addalbum() {
                    var name=$("#namepicture").val();
                    var albumname=$("#albumname").val();
                    var albumdescribe=$("#albumdescribe").val();
                    $.ajax({
                        url:"createalbum.do",
                        data:{
                            albumname:albumname,
                            albumdescribe:albumdescribe,
                            username:name,
                        } ,
                        success:function (data) {
                            var myJson = eval("(" + data + ")");
                            if(myJson.create==0)
                            {
                                $.MsgBox.Alert("提示","相册名不能为空！");
                            }
                            else if(myJson.create==1){
                                $.MsgBox.Alert("提示","相册名已存在！");
                            }
                            else if(myJson.create==2){
                                $("#first").append(
                                    "<option>"+albumname+"</option>"
                                )
                                $("#first1").append(
                                    "<option>"+albumname+"</option>"
                                )
                                $.MsgBox.Alert("提示","相册添加成功！");
                                bbbb();
                            }
                            else $.MsgBox.Alert("提示","相册添加失败！");
                        },
                        error:function (data) {
                            $.MsgBox.Alert("提示","相册添加失败！");
                        }
                    });
                }
            </script>

        </div>

    </div>
    <%--//==================================================================================================================================================--%>

    <div class="tab-pane fade in active" id="first44">

        <script>
            function cccc() {
                document.getElementById("first44").innerHTML="";
                $("#first44").append("<table class=\"table table-bordered\">\n" +
                    "            <caption><h3>用户个人信息</h3></caption>\n" +
                    "            <thead>\n" +
                    "            <tr>\n" +
                    "                <th>id</th>\n" +
                    "                <th>用户名</th>\n" +
                    "                <th>密码</th>\n" +
                    "                <th>邮箱</th>\n" +
                    "                <th>操作</th>\n" +
                    "            </tr>\n" +
                    "            </thead>\n" +
                    "            <tbody>\n" +
                    "            <tr>\n" +
                    "                <td id=\"id\"></td>\n" +
                    "                <td id=\"name\"></td>\n" +
                    "                <td id=\"pwd\"></td>\n" +
                    "                <td id=\"emails\"></td>\n" +
                    "                <td>\n" +
                    "                    <button type=\"button\" class=\"btn btn-primary\"  data-toggle=\"modal\" data-target=\"#exampleModal55\" data-whatever=\"@mdo\">\n" +
                    "                        <span class=\"glyphicon glyphicon-pencil\"></span> 编辑\n" +
                    "                    </button>\n" +
                    "                    <div class=\"modal fade\" id=\"exampleModal55\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel55\">\n" +
                    "                        <div class=\"modal-dialog\" role=\"document\">\n" +
                    "                            <div class=\"modal-content\">\n" +
                    "                                <div class=\"modal-header\">\n" +
                    "                                    <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button>\n" +
                    "                                    <h4 class=\"modal-title\" id=\"exampleModalLabel55\">请修改用户信息：</h4>\n" +
                    "                                </div>\n" +
                    "                                <div class=\"modal-body\">\n" +
                    "                                    <form>\n" +
                    "                                        <div class=\"form-group\">\n" +
                    "                                            <h4>用户名</h4>\n" +
                    "                                            <div class=\"input-group input-group-lg\" display：block;margin：0 auto;>\n" +
                    "                                                <span class=\"input-group-addon\"><span class=\"glyphicon glyphicon-user\"></span></span>\n" +
                    "                                                <input type=\"text\" id=\"newusername\" class=\"form-control \" placeholder=\"请输入新的用户名...\">\n" +
                    "                                            </div>\n" +
                    "                                            <h4>密码</h4>\n" +
                    "                                            <div class=\"input-group input-group-lg\" display：block;margin：0 auto;>\n" +
                    "                                                <span class=\"input-group-addon\"><span class=\"glyphicon glyphicon-lock\"></span></span>\n" +
                    "                                                <input type=\"text\" id=\"newpassword\" class=\"form-control \" placeholder=\"请输入新的密码...\">\n" +
                    "                                            </div>\n" +
                    "                                            <h4>确认密码</h4>\n" +
                    "                                            <div class=\"input-group input-group-lg\" display：block;margin：0 auto;>\n" +
                    "                                                <span class=\"input-group-addon\"><span class=\"glyphicon glyphicon-lock\"></span></span>\n" +
                    "                                                <input type=\"text\" id=\"yespassword\" class=\"form-control \" placeholder=\"请确认新的密码...\">\n" +
                    "                                            </div>\n" +
                    "                                            <h4>Email</h4>\n" +
                    "                                            <div class=\"input-group input-group-lg\" display：block;margin：0 auto;>\n" +
                    "                                                <span class=\"input-group-addon\"><span class=\"glyphicon glyphicon-envelope\"></span></span>\n" +
                    "                                                <input type=\"text\" id=\"email\" class=\"form-control \" placeholder=\"请输入新的Email\">\n" +
                    "                                            </div>\n" +
                    "                                        </div>\n" +
                    "                                    </form>\n" +
                    "                                </div>\n" +
                    "                                <div class=\"modal-footer\">\n" +
                    "                                    <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">返回</button>\n" +
                    "                                    <button type=\"button\" id=\"button4\" class=\"btn btn-primary\" data-dismiss=\"modal\">确认</button>\n" +
                    "                                </div>\n" +
                    "                            </div>\n" +
                    "                        </div>\n" +
                    "                    </div>\n" +
                    "\n" +
                    "                </td>\n" +
                    "            </tr>\n" +
                    "            </tbody>\n" +
                    "        </table>");
                var name = $("#namepicture").val();
                $.ajax({
                    url: "user.do",
                    data: {
                        name2: name,
                    },
                    success: function (data) {
                        var myJson = eval("(" + data + ")");
                        document.getElementById('id').innerHTML = myJson.id;
                        document.getElementById('name').innerHTML = myJson.username;
                        document.getElementById('pwd').innerHTML = myJson.password;
                        document.getElementById('emails').innerHTML = myJson.email;
                    },
                })
            }
                $(function () {
                    $(document).on("click", "#button4", function () {
                        var newusername = $("#newusername").val();
                        var newpassword = $("#newpassword").val();
                        var yespassword = $("#yespassword").val();
                        var name2 = $("#namepicture").val();
                        var email = $("#email").val();
                        $.ajax({
                            url: "change.do",
                            data: {
                                newusername: newusername,
                                newpassword: newpassword,
                                yespassword: yespassword,
                                email: email,
                                name2: name2,
                            },
                            success: function (data) {

                                var myJson = eval("(" + data + ")");
                                if (myJson.change == 0)
                                    $.MsgBox.Alert("提示", "用户或密码不能为空！");
                                else if (myJson.change == 1)
                                    $.MsgBox.Alert("提示", "密码不一致！");
                                else if (myJson.change == 2)
                                    $.MsgBox.Alert("提示", "用户已存在！")
                                else if (myJson.change == 3) {
                                    $.MsgBox.Confirm("提示", "确认要修改吗？", edit);
                                }
                            },
                        });
                    });
                });
                function edit() {
                    window.parent.location.href = "/mainpage/login.jsp";
                }
        </script>
    </div>

    <%--//==================================================================================================================================================--%>
</div>
</body>
</html>
