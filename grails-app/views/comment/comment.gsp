<!DOCTYPE html>
<html lang="zhCN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>回复</title>
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
            var dataReady = {'pid': window.location.search.split('?')[1]}
            $.ajax({
                data:dataReady,
                url:"pushCommentData",
                type:"post",
                success:function (data) {
                    showData(data);
                },
                error:function () {
                    alert("连接异常！")
                }
            })
            $.ajax({
                url:"pushPostDataInCommentPage",
                data:dataReady,
                type:"post",
                success:function (data) {
                    showPost(data);
                },
                error:function (msg) {
                    alert("连接异常："+msg)
                }
            })
            $("#btnCreateComment").click(function () {
                if(currentUserState==0){
                    alert("您已被封禁！")
                }
                else {
                    var dataReady={'main':$("#textareaCommentMain").val(),'pid':window.location.search.split('?')[1],'userId':currentUserId}
                    $.ajax({
                        url:'CreateComment',
                        cache:false,
                        type:'post',
                        data:dataReady,
                        error:function(info){
                            alert("回复失败，未能成功向服务器发送数据")
                        },
                        success:function(info){
                            if(info=='baned') {
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
            $("#btnDeleteThis").click(function () {
                var dataReady={'pid':window.location.search.split('?')[1]}
                $.ajax({
                    url:'deleteThisPost',
                    cache:false,
                    type:'post',
                    data:dataReady,
                    error:function(info){
                        alert("删除失败，未能成功向服务器发送数据")
                    },
                    success:function(info){
                        alert(info)
                        window.location.href="../post/post"
                    }
                })
            })
        })
        function showData(data) {
            var str = ""
            for(var i = 0;i<data.length;i++){
                str = "<tr><td>" + data[i][0] + "</td>" +
                    "<td>" + data[i][1] + "</td>" +
                    "<td>" + data[i][2] + "</td>"+
                    "</tr>";
                $("#tabBody").append(str);
            }
        }
        function showPost(data) {
            $("#title").append(data.title);
            $("#main").append(data.content);
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-10 column">
            <div>
                <h1 id="title"></h1>
                <h3 id="main"></h3>
            </div>
            <table class="table">
                <thead>
                <tr>
                    <th style="width: 70%">
                        回复内容
                    </th>
                    <th style="width: 20%">
                        回复时间
                    </th>
                    <th style="width: 10%">
                        回复人
                    </th>
                </tr>
                </thead>
                <tbody id="tabBody">

                </tbody>
            </table>
        </div>
        <div class="col-md-2 column">
            <p>当前用户:<%=session.getAttribute("userName")%></p>
            <button class="btn btn-primary btn-block" data-toggle="modal" data-target="#myModal">发表回复</button>
            <a href="../post/post">返回帖子列表</a>
            <g:if test="${session.getAttribute('userName')=='admin'}">
                <button class="btn btn-primary btn-danger" id="btnDeleteThis" type="button">删除本帖</button>
            </g:if>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">发表回复</h4>
                        </div>
                        <div class="modal-body">
                            <textarea id="textareaCommentMain" class="form-control" placeholder="回复内容" rows="5" required></textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="btnCreateComment">发布</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
        </div>
    </div>
</div>
</body>
</html>