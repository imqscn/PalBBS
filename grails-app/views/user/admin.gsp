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
            $("#btnDeleteAllPost").click(function () {
                $.ajax({
                    url:'DeleteAllPost',
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
        })
    </script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-4 column">
        </div>
        <div class="col-md-4 column">
            <button type="button" class="btn btn-lg btn-danger btn-block" data-toggle="modal" data-target="#myModal">删除所有帖子</button>
            <a href="../post/post">返回帖子列表</a>
            <a href="../user/login">返回登录界面</a>
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