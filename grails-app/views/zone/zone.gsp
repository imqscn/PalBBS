<!DOCTYPE html>
<html lang="zhCN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>校园论坛管理系统</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            currentUserName = "<%=session.getAttribute("userName")%>"
            currentUserId = "<%=session.getAttribute("userId")%>"
            currentUserState = "<%=session.getAttribute("userState")%>"
            if(currentUserId=='')window.location.href='../user/login'
            $.ajax({
                url:"pushZoneData",
                type:"post",
                success:function (data) {
                    showData(data);
                },
                error:function (msg) {
                    alert("连接异常："+msg)
                }
            })

            $("#btnCreateZone").click(function () {
                if(currentUserState=='0'){
                    alert("您已被封禁！")
                }
                else{
                    var dataReady={'title':$("#textZoneTitle").val(),'userId':currentUserId}
                    $.ajax({
                        url:'createZone',
                        cache:false,
                        type:'post',
                        data:dataReady,
                        error:function(info){
                            alert("创建失败，未能成功向服务器发送数据")
                        },
                        success:function(info){
                            if(info==0){
                                alert("版块名不能为空")
                            }
                            else if(info=='baned'){
                                alert("您已被封禁！")
                            }
                            else {
                                alert(info)
                                window.location.reload()
                            }
                        }
                    })
                }
            })
        })
        function showData(data) {
            var str = ""
            for(var i = 0;i<data.length;i++){
                str = "<button style='margin-top: 10px' type=\"button\" class=\"btn btn-info btn-lg btn-block\" onclick=\"window.location.href='../post/post?"+data[i].id+"'\">"+data[i].title+"</button>"
                $("#zone").append(str);
            }
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-10 column">
            <div id="zone" style="margin-top: 40px">

            </div>
        </div>
        <div class="col-md-2 column">
            <p>当前用户:<a href="../user/myinfo"><%=session.getAttribute("userName")%></a></p>
            <button class="btn btn-primary btn-block" data-toggle="modal" data-target="#myModal">申请版块</button>
            <a href="../user/login">退出登录</a>
            <g:if test="${session.getAttribute('userName')=='admin'}">
                <a href="../user/admin">前往管理页面</a>
            </g:if>
            <a href="../post/search"><button type="button" class="btn btn-default btn-lg">搜索</button></a>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">申请版块</h4>
                        </div>
                        <div class="modal-body">
                            <input type="text" id="textZoneTitle" class="form-control" placeholder="版块名字" required autofocus>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="btnCreateZone">创建</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>

        </div>
    </div>
</div>
</body>
</html>