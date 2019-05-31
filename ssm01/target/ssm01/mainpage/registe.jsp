<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>registe</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
            background: url("../images/1.jpg");
        }
        .wrapper section.sec02 {
            background: url("../images/2.jpg");
        }
        .wrapper section.sec03 {
            background: url("../images/3.jpg");
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
            /*text-align: center;*/
            color: rgba(255, 255, 255, 0.6);
            background: rgba(0, 0, 0, 0.4);
            padding: 0.6em 1em;
        }
        .alternative a {
            margin-top: 15px;
            font-size: 2rem;
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
            z-index: 999999;
        }

    </style>

    <style>
        body {
            background-image: url("../images/admin.jpg");
            background-position: center 0;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            -webkit-background-size: cover;
            -o-background-size: cover;
            -moz-background-size: cover;
            -ms-background-size: cover;
        }
        .header{
            position: fixed;
            top:0;
            width: 100%;
            height: 50px;
            background:transparent;
            z-index: 999999;
        }
    </style>
</head>
<body>
<div class="wrapper"></div>

<div class="header">
    <nav class="navbar " role="navigation navbar-transparent">
        <div class="container-fluid">
            <div class="navbar-header">
                <ul class="nav nav-pills">
                    <li class="active"><a href="primary.jsp">HOME</a></li>
                    <li>
                        <a href="login.jsp">Login</a>
                    </li>
                    <li>
                        <a href="registe.jsp">SignUp</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>

<div class="alternative">
    <a href="primary.jsp"><div style="text-align: center"><h1>PicShare</h1></div></a>
    <div class="container">
        <div class="row"  >
            <h2 style="text-align: center">Sign Up</h2>
        </div>
        <div class="col-md-6 col-md-offset-3 ">
            <h4>Name</h4>
            <div class="input-group input-group-lg" display：block;margin：0 auto;>
                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                <input type="text" id="username" class="form-control " placeholder="Enter your name...">
                </h4>
            </div>
        </div>
        <div class="col-md-6 col-md-offset-3 ">
            <h4>Password</h4>
            <div class="input-group input-group-lg" display：block;margin：0 auto;>
                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                <input type="text" id="password" class="form-control " placeholder="Enter password.">
            </div>
        </div>
        <div class="col-md-6 col-md-offset-3 ">
            <h4>Email</h4>
            <div class="input-group input-group-lg" display：block;margin：0 auto;>
                <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                <input type="text" id="email" class="form-control " placeholder="Enter your Email...">
            </div>
        </div>
        <div class="col-md-6 col-md-offset-3">
            <h1>   </h1>
            <h2>   </h2>
            <p>
                <button type="button" id="button" class="btn btn-primary btn-lg btn-block">Sign Up</button>
            </p>
            <h5> <a href="login.jsp">click here to login!</a></h5>
        </div>
    </div>
    <h1> </h1>
</div>
</body>
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
                $("#mb_box,#mb_con").remove();
                if (typeof (callback) == 'function') {
                    callback();
                }
            });
        }
        //取消按钮事件
        var btnNo = function () {
            $("#mb_btn_no,#mb_ico").click(function () {
                $("#mb_box,#mb_con").remove();
            });
        }
    })();
    //================================================================================================================
    $(function() {
        $(document).on("click","#button",function(){
            var username =$("#username").val();
            var password =$("#password").val();
            var email=$("#email").val();
            $.ajax({//发送ajax请求
                url : "signup.do",
                data : {
                    username : username,
                    password : password,
                    email:email,
                },
                success : function(data) {//成功返回的数据处理
                    var myJson = eval("(" + data + ")");
                    if(myJson.signup==0)
                        $.MsgBox.Alert("提示","用户或密码不能为空！");
                    else if(myJson.signup==1)
                        $.MsgBox.Alert("提示","用户已存在！");
                    else if(myJson.signup==2) {
                        window.location.href="login.jsp";
                        $.MsgBox.Alert("提示","注册成功");
                    }
                },
            });

        });

    });
</script>

</html>
