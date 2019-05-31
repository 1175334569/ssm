<%@ page language="java" contentType="text/html; charset=utf-8"
          pageEncoding="utf-8"%>
<!DOCTYPE html>
<style type="text/css">
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
    .img_div a:hover .mask {
        opacity: 1;
    }
</style>
<html>

<head>
    <meta charset="utf-8">
    <title>picture</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
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
                else location.reload(true);
            });
        }
        //取消按钮事件
        var btnNo = function () {
            $("#mb_btn_no,#mb_ico").click(function () {
                $("#mb_box,#mb_con").remove();
            });
        }
    })();
    $('#myModal').on('shown.bs.modal', function () {
        $('#myInput').focus()
    })

    //===================================================================================================
    //==============================================================================

</script>
<body>
<caption><h3>照片管理</h3></caption>
<% String aid=request.getParameter("a");%>
<% String uid=request.getParameter("u");%>
<input type="hidden" id="aid" value="<%=aid%>">
<input type="hidden" id="uid" value="<%=uid%>">
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
                    <div class="form-group">
                        <label for="inputfile">请选择上传图片</label>
                        <input type="file" id="inputfile" name="file2">
                    </div>
                    <h4>照片描述</h4>
                    <div class="input-group input-group-lg" display：block;margin：0 auto;>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                        <input type="text" id="picturedescribe1" class="form-control " placeholder="照片描述...">
                    </div>

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
                <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                <button type="button" id="button1" class="btn btn-primary" data-dismiss="modal">确认</button>
            </div>
        </div>
    </div>
</div>

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
<div class="tab-pane fade in active" id="home">
    <div class="row" id="AllPic">
        <script>
            var Data;
            $(function() {
                var aid = $("#aid").val();
                var uid = $("#uid").val();
                $.ajax({
                    type: 'post',
                    dataType: 'json',
                    url: 'useralbumpic.do',
                    data: {
                        aid:aid,
                        uid:uid,
                    },
                    success: function (data) {
                        Data=data;
                        for (var i = 0; i < data.length; i++) {
                            var ad = data[i].pictureid;
                            var picture = data[i].picture;
                            var picturename=data[i].picturename;
                            $("#AllPic").append("<div class=\"col-sm-6 col-md-3\">" +
                                "<div class=\"img_div\">" +
                                "<img  src='" + data[i].picture + "' id=" + ad + " width='330' height='230'>" +
                                "<a href=\"#\">" +
                                "<div class=\"mask\" onclick='show("+ad+","+i+")'>" +
                                "<h4>" + data[i].picturename + "</h4>" +
                                "<p>日期：" + data[i].date + "</p>" +
                                "<div class=\"bt\" >" +
                                "<button type=\"button\" id=" + ad + " class=\"btn btn-danger\"  onclick='delect(this)'>" +
                                "<span class=\"glyphicon glyphicon-trash\"></span> 删除" +
                                "</button>" +
                                "</div>" +
                                "<div class=\"bt1\" >" +
                                "<button type=\"button\"  class=\"btn btn-primary\" value="+picturename+" data-toggle=\"modal\" data-target=\"#exampleModal2\" data-whatever=\"@mdo\" onclick='editpic(this.value,"+ad+")'>" +
                                "<span class=\"glyphicon glyphicon-pencil\"></span> 编辑" +
                                "</button>" +
                                "</div>" +
                                "</div>" +
                                "</a>" +

                                "</div>" +
                                "<h1></h1>" +

                                "</div>");
                        }
                    },
                    error: function (data) {
                        alert("error");
                    }
                });
                $.ajax({
                    url:"getusernamebyid.do",
                    data:{
                        uid:uid,
                    },
                    success:function (data) {
                        var myJson = eval("(" + data + ")");
                        username=myJson.name;
                    }
                })
            });
            var username;
            var i=0;
            var j=0;
            var pn;//记录照片名
            var id;//记录相片ID
            function show(e,pid){
                if(j==0) {
                    var div = document.getElementById(e);
                    var src = div.getAttribute("src");
                    var img = document.getElementById("pic1");
                    $.ajax({
                        url:"getalbumname1.do",
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

                }
                else j==0;
            }
            function edit(e) {
                j++;
                alert(e);
            }
            function editpic(e,ID) {
                j++;
                pn=e;
                id=ID;
                $.ajax({
                    url:"edit1.do",
                    data:{
                        username:username,
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
                var name=username;
                $.ajax({
                    url:"modifypicture1.do",
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
                            $.MsgBox.Alert("提示","更改成功！")
                        }
                        else $.MsgBox.Alert("提示","更改失败！");
                    },
                    error:function (data) {
                        $.MsgBox.Alert("提示","更改失败！");
                    }
                });
            }
            //=====================================================================================删除图片
            function delect(e) {
                j++;
                    i=e.getAttribute("id");
                    $.MsgBox.Confirm("提示","确定要删除吗？",aaa);
                    return delect;
            }
            function aaa(){
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
                          }
                          else $.MsgBox.Alert("提示","删除失败");
                      },
                      error:function (data) {
                          $.MsgBox.Alert("提示","删除失败");
                      },
                  })
            };
          /*  function editpic() {
                $.ajax({
                    url:"type.do",
                    success:function (data) {
                        for(var i=0;i<data.length;i++){
                            $("#TYPE1").append(
                                "<option>"+data[i].typename+"</option>"
                            )
                        }
                    },
                    error:function (data) {
                        alert(1111);
                    }
                });
            }*/
            //=======================================================================================
            $(function() {
                $(document).on("click", "#button1", function () {
                    var uid=$("#uid").val();
                    var aid=$("#aid").val();
                    var type1=document.getElementsByName("type1")[0];
                    var type=type1.options[type1.selectedIndex].innerText;
                    var describe=$("#picturedescribe1").val();
                    var file1=new FormData($("#file")[0]);
                    file1.append("aid",aid);
                    file1.append("uid",uid);
                    file1.append("type",type);
                    file1.append("describe",describe);
                    var Nofile=$("#inputfile").val();
                    if(Nofile!="") {
                        $.ajax({//发送ajax请求
                            url: "hellohaha1.do",
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
    </div>
</div>


<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"><%--/*点击跳出的具体图片信息*/--%>
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
</body>

</html>
