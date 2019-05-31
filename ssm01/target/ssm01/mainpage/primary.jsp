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
        /*固定导航栏*/
        .header1{
            position: fixed;
            top:0;
            width: 98%;
            height: 50px;
            background:transparent;
            z-index: 999999;
        }

        /*菜单*/
        .dropdown {
            position: relative;
            display: inline-block;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #dddddd;
            min-width: 90px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            padding: 12px 16px;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        .wrapper {
            width: 100%;
            height: 100%;
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
            top: 50%;
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
        .like{font-size:66px;color:#ccc; cursor: pointer}
        .cs{color:#f00}

    </style>

</head>
<body>

<div class="wrapper">
    <section class="sec01"></section>
    <section class="sec02"></section>
    <section class="sec03"></section>
</div>
<% String name2=request.getParameter("haha");%>
<input type="hidden" id="name2" value="<%=name2%>">
<%--菜单栏--%>
<div class="header1">
    <nav class="navbar " role="navigation navbar-transparent">
        <div class="container-fluid">
            <div class="navbar-header">
                <ul class="nav nav-pills">
                    <li class="active"><a href="primary.jsp">HOME</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="registe.jsp">SignUp</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            Browse <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a onclick="popular(1)">Popular Photo</a></li>
                            <li><a onclick="popular(2)">Popular Searches</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <%--<ul class="navbar-right">--%>
            <%--<li class="dropdown">--%>
            <div class="dropdown" style="float: right">
                <a href="#"><h4 id="user"><%=name2%></h4></a>
                <div class="dropdown-content">
                    <p onclick="myalbum()"><a>我的相册</a></p>
                    <p onclick="quit()"><a href="#">退出</a></p>
                </div>
            </div>
            <%--</li>--%>
            <%--</ul>--%>
        </div>
    </nav>
</div>

<script>
    $(function () {
        if($("#user").html()=="null")
        $("#user").hide();
    })
    function quit() {
        window.location.href="/mainpage/primary.jsp";
    }
    function myalbum() {
        window.location.href="/userpage/picture1.jsp?haha=<%=name2%>"
    }
/*    //=================================================================================*/
    function popular(e){
        var a;
        if(e==1)
            a="popular.do";
        else if(e==2)
            a="maxSearch.do";
        document.getElementById("base").innerText=""
        document.getElementById("even").innerText=""
        $.ajax({
            type:'post',
            dataType:'json',
            url: a,
            success: function (data) {
                for(var i=0; i<data.length; i++){
                    //请求praise结果
                    var praiseData;
                    $.ajax({
                        type:'post',
                        async:false,
                        data:{
                            pid:data[i].pictureid,
                        },
                        dataType:'json',
                        url: 'selectByPid.do',
                        success: function (data) {
                            praiseData=data;
                        },
                        error:function (data) {
                        }
                    });

                    if(i%2==0){
                        $("#base").append("<div class=\"media\">" +
                            "<a class=\"media-left\" href=\"#\">" +
                            "<img class=\"media-object\" width=\"330\" height=\"230\" src='"+data[i].picture+"' onclick='show(this)'>" +
                            "<h4></h4>" +
                            "</a>" +
                            "<div class=\"media-body\">" +
                            "<h4 class=\"media-heading\">"+(i+1)+"</h4>" +
                            "<h4>点赞数:"+praiseData.praisenum+"</h4>" +
                            "<h4>浏览量:"+praiseData.allnum+"</h4>" +
                            "</div>" +
                            "</div>");}
                    else {
                        $("#even").append("<div class=\"media\">" +
                            "<a class=\"media-left\" href=\"#\">" +
                            "<img class=\"media-object\" width=\"330\" height=\"230\" src='"+data[i].picture+"'>" +
                            "<h4></h4>" +
                            "</a>" +
                            "<div class=\"media-body\">" +
                            "<h4 class=\"media-heading\">"+(i+1)+"</h4>" +
                            "<h4>点赞数:"+praiseData.praisenum+"</h4>" +
                            "<h4>浏览量:"+praiseData.allnum+"</h4>" +
                            "</div>" +
                            "</div>");}
                }
                $('div#PopularPhotoModal').modal('show');

            },
            error:function () {
                alert("error");
            }
        });
    }
</script>
<div class="alternative">
    <h1>PicShare</h1>
    <h3>Best free stock photos in one place</h3>
    <%--<div class="col-md-6 col-md-offset-3">--%>
    <div class="input-group input-group-lg" display：block;margin：0 auto;>
        <input type="text" id="searchtext" class="form-control " placeholder="Search for...">
        <span class="input-group-btn">
            <button id="searchbtn" class="btn btn-info btn-search " type="button" ><span class="glyphicon glyphicon-search"></span></button>
        </span>
    </div><!-- /input-group -->
    <%--</div>--%>
    <script type="text/javascript">
        $(function(){
            $("button#searchbtn").click(function() {
                document.getElementById("AllPic").innerText="";
                var search = $("#searchtext").val();
                $.ajax({
                    type:'post',
                    data:{
                        search:search
                    },
                    dataType:'json',
                    url: 'search.do',
                    success: function (data) {
                        for(var i=0; i<data.length; i++){
                            $("#AllPic").append("<div class=\"col-sm-6 col-md-3\">" +
                                "<img src='"+data[i].picture+"' width=\"330\" height=\"230\" alt='"+i+"' onclick='show(this)'>" +
                                "<h1></h1>"+
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
</div>



<div class="modal fade" id="PopularPhotoModal" tabindex="-1"  role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document" style="width:1000px">
        <div class="container">
            <div class="jumbotron">
                <div class="container">
                    <div class="row clearfix">
                        <div class="col-md-6 column" id="base">
                        </div>
                        <div class="col-md-6 column" id="even">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><%--图片排行榜模态框--%>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" >
    <div class="modal-dialog" role="document" style="width:1000px">
        <div class="container">
            <div class="jumbotron">
                <div class="container">
                    <div class="row clearfix" >
                        <script>
                            var tableContent ="";
                            tableContent+='<div class="col-md-9 column">';
                            tableContent+='<img class="img-thumbnail" width="1000", id="pic1">';
                            tableContent+='<dt></dt>';
                            tableContent+='</div>';
                            tableContent+='<div class="col-md-3 column">';
                            tableContent+='<dl>';
                            tableContent+='<dt>';
                            tableContent+='相片名字';
                            tableContent+=' </dt>';
                            tableContent+='<dd id="text1">';
                            tableContent+='</dd>';
                            tableContent+='<dt>';
                            tableContent+='创建日期';
                            tableContent+='</dt>';
                            tableContent+='<dd id="text2">';
                            tableContent+='</dd>';
                           /* tableContent+='<dt>';
                            tableContent+='所属相册';
                            tableContent+='</dt>';
                            tableContent+='<dd id="text3">';
                            tableContent+='</dd>';*/
                            tableContent+='<dt>';
                            tableContent+='具体描述';
                            tableContent+='</dt>';
                            tableContent+='<dd id="text4">';
                            tableContent+='</dd>';
                            tableContent+='</dl>';
                            document.write(tableContent);
                        </script>
                        <div class="row clearfix">
                            <div class="col-md-6 column">
                                <button type="button" onclick="download()" class="btn btn-default btn-sm">
                                    <span class="glyphicon glyphicon-download"></span> Download
                                </button>
                            </div>
                            <div class="col-md-6 column">
                                <p class="like">&#10084;</p>
                            </div>
                        </div>
                        <%--     <button type="button" onclick="praise()" class="btn btn-default btn-sm">
                                 <span class="glyphicon glyphicon-thumbs-up"></span> Thumbs-up
                             </button>--%>
                        <script>
                            var flag=0;
                            $(function (){
                                $(".like").click(function () {
                                    $(this).toggleClass('cs');
                                    if (flag==0){
                                        flag=1;
                                    }
                                    else{
                                        flag=0;
                                    }
                                });
                            });
                            $('#exampleModal').on('hidden.bs.modal',function (){
                                var picname;
                                picname = document.getElementById("text1").textContent;
                                // 浏览量
                                $.ajax({
                                    type:'post',
                                    data:{
                                        picname:picname
                                    },
                                    //dataType:'text',
                                    url: 'sumnum.do',
                                });
                                if (flag==1) {
                                    // 点赞
                                    $.ajax({
                                        type:'post',
                                        data:{
                                            picname:picname
                                        },
                                        //dataType:'text',
                                        url: 'praise.do'
                                    });

                                    // 退出时清空点赞状态
                                    $(".like").toggleClass('cs');
                                    flag=0;
                                }
                            } );
                        </script>

                        <script>
                            function download() {
                                var src;
                                src = document.getElementById("pic1").src;
                                var $a = document.createElement('a');
                                $a.setAttribute("href", src);
                                $a.setAttribute("download", "");
                                var evObj = document.createEvent('MouseEvents');
                                evObj.initMouseEvent( 'click', true, true, window, 0, 0, 0, 0, 0, false, false, true, false, 0, null);
                                $a.dispatchEvent(evObj);
                            }
                        </script>
                    </div>
                </div><%--别删div！！！！--%>
            </div>
        </div>
    </div>
</div>
</div><%--点击跳出的模态框--%>

<ul id="myTab1" class="nav nav-tabs">
    <li class="active">
        <a href="#home" data-toggle="tab">全部相片</a>
    </li>
    <li>
        <a href="#ios" data-toggle="tab">相册分类</a>
    </li>
</ul><%--标签页--%>


<div id="myTabContent" class="tab-content">
    <div class="tab-pane fade in active" id="home">
        <div class="row" id="AllPic">
            <script>
                var Data;
                $(function(){
                    $.ajax({
                        type:'post',
                        dataType:'json',
                        async:false,
                        url: 'allpic.do',
                        success: function (data) {
                            Data=data;
                            for(var i=0;i<data.length;i++){
                            $("#AllPic").append("<div class=\"col-sm-6 col-md-3\">" +
                                "<img src='"+data[i].picture+"' width=\"330\" height=\"230\" alt='"+i+"' onclick='show(this)'>" +
                                "<h1></h1>"+
                                "</div>");
                            }
                        },
                        error:function (data) {
                            alert("error");
                        }
                    });
                });

                function show(e){
                    var src=e.getAttribute("src");
                    var i=e.getAttribute("alt");
                    //var src=e;
                    var img = document.getElementById("pic1");
                    img.setAttribute("src",src);
                    document.getElementById("text1").innerHTML=Data[i].picturename;
                    document.getElementById("text2").innerHTML=Data[i].createdate;
                    /*document.getElementById("text3").innerHTML=Data[i].;*/
                    document.getElementById("text4").innerHTML=Data[i].picturediscribe;
                    $('div#exampleModal').modal('show');
                }
            </script>
        </div>
    </div><%--主页显示全部图片--%>

    <div class="tab-pane fade" id="ios">
        <div class="row" id="AllAlbum">
            <script>
                $(function(){
                    $.ajax({
                        type:'post',
                        dataType:'json',
                        url: "allalbum.do",
                        success: function (data) {
                            for(var i=0;i<data.length;i++){
                                $("#AllAlbum").append("<div class=\"col-sm-6 col-md-3\">" +
                                    "<img src='"+data[i].pictures[i].picture+"' width=\"330\" height=\"230\"  alt='"+data[i].albumname+"' onclick='setCookie(this)'>" +
                                    "<div class=\"caption\">" +
                                    "<p>"+data[i].albumname+"</p>" +
                                    "</div>" +
                                    "</div>");
                            }
                        },
                        error:function (data) {
                            alert("error");
                        }
                    });
                });

                function setCookie(e){
                    var AlName=e.getAttribute("alt");
                    /*alert(srcAl);*/
                    var popup=window.open("PicShow.jsp");
                    setTimeout(function()
                    {
                        popup.postMessage(AlName,"*");
                    },200);
                }
            </script>
        </div>
    </div><%--主页显示全部相册--%>

</div>

</body>
</html>
