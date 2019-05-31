<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/7/19
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Bootstrap</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

<script type="text/javascript">
    $('#myModal').on('shown.bs.modal', function () {
        $('#myInput').focus()
    })
</script>

<script>
    var Data;
    function receiveMessage(event)
    {
        $.ajax({
            type:'post',
            dataType:'json',
            data:{
                albumname:event.data
            },
            url: 'albumpic.do',
            success: function (data) {
                Data=data;
                for(var i=0;i<data.length;i++){
                    $("#AlbPic").append("<div class=\"col-sm-6 col-md-3\">" +
                        "<div class=\"thumbnail\">" +
                        "<img src='"+data[i].picture+"' alt='"+i+"' onclick='show(this)'>" +
                        "<div class=\"caption\">" +
                        "<p>About XXXXX</p>" +
                        "</div>" +
                        "</div>" +
                        "</div>");
                }
                document.getElementById("test").innerHTML=event.data;
            },
            error:function (data) {
                alert("error");
            }
        });
    }
    function show(e){
        var i=e.getAttribute("alt");
        var src=e.getAttribute("src");
        var img = document.getElementById("pic2");
        img.setAttribute("src",src);
        document.getElementById("text1").innerHTML=Data[i].picturename;
        document.getElementById("text2").innerHTML=Data[i].date;
           /*   document.getElementById("text3").innerHTML=Data[i].;*/
        document.getElementById("text4").innerHTML=Data[i].picturediscribe;
        $('div#exampleModal').modal('show');
    }
    window.addEventListener("message", receiveMessage, false);
</script>

<div class="panel panel-default">
    <div id="example1">
        <ul class="nav nav-pills">
            <li class="active"><a href="primary.jsp">HOME</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    Browse <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="#">Popular Photo</a></li>
                    <li><a href="#">Popular Searches</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    Login <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="sadminlogin.jsp">SuperAdminLogin</a></li>
                    <li><a href="#">照片</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>

<div  class="page-header">
    <h1 id="test"></h1>;
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document" style="width:1000px">
        <div class="container">
            <div class="jumbotron">
                <div class="container">
                    <div class="row clearfix">
                        <script>
                            var tableContent = "";
                            tableContent+='<div class="col-md-8 column">';
                            tableContent+='<img class="img-thumbnail" width="1000" id="pic2" alt="...">'
                            tableContent+='</div>';
                            tableContent+='<div class="col-md-4 column">';
                            tableContent+='<dl>';
                            tableContent+='<dt>';
                            tableContent+='相片名字';
                            tableContent+=' </dt>';
                            tableContent+='<dd id="text1">'
                            tableContent+='</dd>';
                            tableContent+='<dt>';
                            tableContent+='创建日期';
                            tableContent+='</dt>';
                            tableContent+='<dd id="text2">';
                            tableContent+='</dd>';
                            tableContent+='<dt>';
                            tableContent+='所属相册';
                            tableContent+='</dt>';
                            tableContent+='<dd id="text3">';
                            tableContent+='</dd>';
                            tableContent+='<dt>';
                            tableContent+='具体描述';
                            tableContent+='</dt>';
                            tableContent+='<dd id="text4">';
                            tableContent+='</dd>';
                            tableContent+='</dl>';
                            document.write(tableContent);
                        </script>
                        <button type="button" class="btn btn-default btn-sm">
                            <span class="glyphicon glyphicon-download"></span> Download
                        </button>
                        <button type="button" class="btn btn-default btn-sm">
                            <span class="glyphicon glyphicon-thumbs-up"></span> Thumbs-up
                        </button>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="panel panel-default" style="padding: 50px 50px 10px;">
    <div class="row" id="AlbPic"></div>
</div>
</body>
</html>
