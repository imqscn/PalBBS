<!DOCTYPE html>
<html lang="zhCN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理界面</title>
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
            if(currentUserId=='')window.location.href='../user/login'

            $("#btnChangeName").click(function () {
                var dataReady={'id':currentUserId,
                    'name':$("#inputNewName").val()
                }
                $.ajax({
                    url:'changeName',
                    cache:false,
                    data:dataReady,
                    type:'post',
                    error:function(info){
                        alert("修改失败，未能成功向服务器发送数据")
                    },
                    success:function(info){
                        alert(info)
                        window.location.reload()
                    }
                })
            })
            $("#btnChangePw").click(function () {
                if($("#inputNewPw").val() == $("#inputNewPw2").val()){
                    var dataReady={'id':currentUserId,
                        'pw':$("#inputNewPw").val()
                    }
                    $.ajax({
                        url:'changePw',
                        cache:false,
                        data:dataReady,
                        type:'post',
                        error:function(info){
                            alert("修改失败，未能成功向服务器发送数据")
                        },
                        success:function(info){
                            alert(info)
                            window.location.reload()
                        }
                    })
                }
                else alert("两次输入不一致！")
            })
        })
    </script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-4 column">
        </div>
        <div class="col-md-4 column">
            <button type="button" class="btn btn-lg btn-warning btn-block" id="btnChangeNameModal" data-toggle="modal" data-target="#changeNameModal">更改用户名</button>
            <button type="button" class="btn btn-lg btn-warning btn-block" id="btnChangePwModal" data-toggle="modal" data-target="#changePwModal">更改密码</button>
            <a href="../zone/zone">返回版块列表</a>
            <a href="../user/login">返回登录界面</a>
            <div class="modal fade" id="changeNameModal" tabindex="-1" role="dialog" aria-labelledby="changeNameModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="changeNameModalLabel">更改用户名</h4>
                        </div>
                        <div>
                            <input type="text" id="inputNewName" class="form-control" placeholder="输入新的用户名" required autofocus>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-warning" data-dismiss="modal" id="btnChangeName">确认修改</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
            <div class="modal fade" id="changePwModal" tabindex="-1" role="dialog" aria-labelledby="changePwModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="changePwModalLabel">修改密码</h4>
                        </div>
                        <div>
                            <input type="password" id="inputNewPw" class="form-control" placeholder="输入新密码" required autofocus>
                        </div>
                        <div>
                            <input type="password" id="inputNewPw2" class="form-control" placeholder="确认新密码" required>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-warning" data-dismiss="modal" id="btnChangePw">确认修改</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
        </div>
        <div class="col-md-4 column">
            <p>当前用户:<a href="../user/myinfo"><%=session.getAttribute("userName")%></a></p>
        </div>
    </div>
</div>
</body>
</html>