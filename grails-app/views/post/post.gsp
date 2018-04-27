<!DOCTYPE html>
<html lang="zhCN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>帖子中心</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $.ajax({
                url:"pushPostData",
                type:"post",
                success:function (data) {
                    showData(data);
                },
                error:function (msg) {
                    alert("连接异常："+msg)
                }
            })
            $("#btnCreatePost").click(function () {
                var dataReady={'title':$("#textPostTitle").val(),'main':$("#textareaPostMain").val()}
                $.ajax({
                    url:'CreatePost',
                    cache:false,
                    type:'post',
                    data:dataReady,
                    error:function(info){
                        alert("发布失败，未能成功向服务器发送数据")
                    },
                    success:function(info){
                        alert(info)
                        window.location.reload()
                    }
                })
            })
        })
        function showData(data) {
            var str = ""
            for(var i = 0;i<data.length;i++){
                str = "<tr><td>" + data[i].id + "</td>" +
                    "<td><a href='../comment/comment?"+data[i].id+"'>" + data[i].title + "</a></td>" +
                    "<td>" + data[i].date + "</td>" +
                    "<td>" + data[i].userId + "</td>"+
                    "</tr>";
                $("#tabBody").append(str);
            }
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-10 column">
            <table class="table">
                <thead>
                <tr>
                    <th>
                        帖子编号
                    </th>
                    <th>
                        帖子名称
                    </th>
                    <th>
                        发布时间
                    </th>
                    <th>
                        作者
                    </th>
                </tr>
                </thead>
                <tbody id="tabBody">

                </tbody>
            </table>
        </div>
        <div class="col-md-2 column">
            <p>当前用户:${'邱硕'}</p>
            <button class="btn btn-primary btn-block" data-toggle="modal" data-target="#myModal">发帖</button>
            <a href="../user/login">返回登录界面</a>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">发帖</h4>
                        </div>
                        <div class="modal-body">
                            <input type="text" id="textPostTitle" class="form-control" placeholder="帖子标题" required autofocus>
                            <textarea id="textareaPostMain" class="form-control" placeholder="帖子内容" rows="5" required></textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="btnCreatePost">发布</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
        </div>
    </div>
</div>
</body>
</html>