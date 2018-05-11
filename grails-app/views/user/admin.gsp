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
            if(currentUserName!='admin'){
                window.location.href='../user/login'
            }
            $("#btnDeleteAllPost").click(function () {
                $.ajax({
                    url:'../post/DeleteAllPost',
                    cache:false,
                    type:'post',
                    error:function(info){
                        alert("删除失败，未能成功向服务器发送数据")
                    },
                    success:function(info){
                        alert(info)
                    }
                });

            })
            $("#btnBanUser").click(function () {
                var dataReady={'id':$("#inputBanUserId").val()}
                $.ajax({
                    url:'banUser',
                    cache:false,
                    data:dataReady,
                    type:'post',
                    error:function(info){
                        alert("封禁失败，未能成功向服务器发送数据")
                    },
                    success:function(info){
                        alert(info)
                    }
                })
            })
            $("#btnDeBanUser").click(function () {
                var dataReady={'id':$("#inputDeBanUserId").val()}
                $.ajax({
                    url:'deBanUser',
                    cache:false,
                    data:dataReady,
                    type:'post',
                    error:function(info){
                        alert("解封失败，未能成功向服务器发送数据")
                    },
                    success:function(info){
                        alert(info)
                    }
                })
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
            <a href="../post/deletePosts"><button type="button" class="btn btn-lg btn-danger btn-block">删除所有帖子</button></a>
            <button type="button" class="btn btn-lg btn-warning btn-block" data-toggle="modal" data-target="#banUserModal">封禁用户</button>
            <button type="button" class="btn btn-lg btn-success btn-block" data-toggle="modal" data-target="#deBanUserModal">解封用户</button>
            <a href="../post/post">返回帖子列表</a>
            <a href="../user/login">返回登录界面</a>
            <div class="modal fade" id="banUserModal" tabindex="-1" role="dialog" aria-labelledby="banUserModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="banUserModalLabel">封禁用户</h4>
                        </div>
                        <div>
                            <input type="text" id="inputBanUserId" class="form-control" placeholder="输入要封禁的ID" required autofocus>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal" id="btnBanUser">确认封禁</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
            <div class="modal fade" id="deBanUserModal" tabindex="-1" role="dialog" aria-labelledby="deBanUserModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="deBanUserModalLabel">解封用户</h4>
                        </div>
                        <div>
                            <input type="text" id="inputDeBanUserId" class="form-control" placeholder="输入要解封的ID" required autofocus>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal" id="btnDeBanUser">确认解封</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">删除所有帖子</h4>
                        </div>
                        <div class="modal-body">确认删除所有帖子吗？</div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-danger" id="btnDeleteAllPost">确认删除</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
        </div>
        <div class="col-md-4 column">
        </div>
    </div>
</div>
</body>
</html>