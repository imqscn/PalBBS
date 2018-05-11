<!DOCTYPE html>
<html lang="zhCN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录与注册</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $("#btnSignIn").click(function () {
                var dataReady ={'name':$("#inputUsernameForSignIn").val(),'password':$("#inputPasswordForSignIn").val()
                }
                $.ajax({
                    url:'signIn',
                    cache:false,
                    type:'post',
                    data:dataReady,
                    error:function(info){
                        alert("登录失败，未能成功向服务器发送数据")
                    },
                    success:function(info){
                        alert(info)
                        if(info =="登录成功，关闭对话框后跳转！")
                            window.location.href="../post/post"
                    }
                });

            })

            $("#btnAdminSignIn").click(function () {
                var dataReady ={'name':$("#inputUsernameForAdminSignIn").val(),'password':$("#inputPasswordForAdminSignIn").val()
                }
                $.ajax({
                    url:'adminSignIn',
                    cache:false,
                    type:'post',
                    data:dataReady,
                    error:function(info){
                        alert("登录失败，未能成功向服务器发送数据")
                    },
                    success:function(info){
                        if(info =="1")
                            window.location.href="../user/admin"
                        else alert(info)
                    }
                });

            })

            $("#btnSignUp").click(function () {
                var dataReady ={'username':$("#inputUsernameForSignUp").val(),'password':$("#inputPasswordForSignUp").val()
                }
                $.ajax({
                    url:'signUp',
                    cache:false,
                    type:'post',
                    data:dataReady,
                    error:function(info){
                        alert("注册失败，未能成功向服务器发送数据")
                    },
                    success:function(info){
                        alert(info)
                    }
                });

            })
        })
    </script>
    <style>
    body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #eee;
    }
    #myTab {
        max-width: 400px;
        padding: 15px;
        margin: 0 auto;
    }
    .form-signin {
        max-width: 330px;
        padding: 15px;
        margin: 0 auto;
    }
    .form-signin .form-signin-heading,
    .form-signin .form-control {
        position: relative;
        height: auto;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        padding: 10px;
        font-size: 16px;
    }
    .form-signin .form-control:focus {
        z-index: 2;
    }
    .form-signin input[type="text"] {
        margin-bottom: -1px;
        border-bottom-right-radius: 0;
        border-bottom-left-radius: 0;
    }
    .form-signin input[type="password"] {
        margin-bottom: 10px;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
    }
    </style>
</head>
<body>
<ul class="nav nav-tabs" id="myTab">
    <li class="active"><a href="#signIn" data-toggle="tab">登录</a></li>
    <li><a href="#signUp" data-toggle="tab">注册</a></li>
    <!--<li><a href="#findpw" data-toggle="tab">找回密码</a></li>-->
    <li><a href="#adminSignIn" data-toggle="tab">管理员登录</a></li>
</ul>
<div class="tab-content">
    <div class="tab-pane fade in active" id="signIn">
        <div class="container">
            <div class="form-signin">
                <h2 class="form-signin-heading">登录校园论坛</h2>
                <input type="text" id="inputUsernameForSignIn" class="form-control" placeholder="用户名" required autofocus>
                <input type="password" id="inputPasswordForSignIn" class="form-control" placeholder="密码" required>
                <button class="btn btn-lg btn-primary btn-block" id="btnSignIn" type="button">登录</button>
            </div>
        </div>
    </div>

    <div class="tab-pane fade" id="signUp">
        <div class="container">
            <div class="form-signin">
                <h2 class="form-signin-heading">注册成为校园论坛用户</h2>
                <input type="text" id="inputUsernameForSignUp" class="form-control" placeholder="用户名" required autofocus>
                <input type="password" id="inputPasswordForSignUp" class="form-control" placeholder="密码" required>
                <button class="btn btn-lg btn-primary btn-block" id="btnSignUp" type="button">注册</button>
            </div>
        </div>
    </div>
    <div class="tab-pane fade" id="adminSignIn">
        <div class="container">
            <div class="form-signin">
                <h2 class="form-signin-heading">管理员登录</h2>
                <input type="text" id="inputUsernameForAdminSignIn" class="form-control" placeholder="管理员用户名" required autofocus>
                <input type="password" id="inputPasswordForAdminSignIn" class="form-control" placeholder="管理员密码" required>
                <button class="btn btn-lg btn-primary btn-block" id="btnAdminSignIn" type="button">登录</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>