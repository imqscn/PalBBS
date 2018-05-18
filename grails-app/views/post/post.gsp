<!DOCTYPE html>
<html lang="zhCN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>帖子中心</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            currentUserName = "<%=session.getAttribute("userName")%>"
            currentUserId = "<%=session.getAttribute("userId")%>"
            currentUserState = "<%=session.getAttribute("userState")%>"
            if(currentUserId=='')window.location.href='../user/login'
            var dataReady = {'zid': window.location.search.split('?')[1]}
            $.ajax({
                data:dataReady,
                url:"pushPostData",
                type:"post",
                success:function (data) {
                    showData(data);
                },
                error:function (msg) {
                    alert("连接异常："+msg)
                }
            })
            $.ajax({
                data:dataReady,
                url:"../zone/pushZoneName",
                type:"post",
                success:function (data) {
                    setZoneName(data+"版块的帖子");
                },
                error:function (msg) {
                    alert("连接异常："+msg)
                }
            })
            $("#btnCreatePost").click(function () {
                if(currentUserState=='0'){
                    alert("您已被封禁！")
                }
                else{
                    var dataReady={'title':$("#textPostTitle").val(),
                        'main':$("#textareaPostMain").val(),
                        'userId':currentUserId,
                        'zid':window.location.search.split('?')[1]
                    }
                    $.ajax({
                        url:'CreatePost',
                        cache:false,
                        type:'post',
                        data:dataReady,
                        error:function(info){
                            alert("发布失败，未能成功向服务器发送数据")
                        },
                        success:function(info){
                            if(info==0){
                                alert("标题不能为空")
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
                str = "<tr><td hidden>" + data[i][0] +
                    "<td><a href='../comment/comment?"+data[i][0]+"'>" + data[i][1] + "</a></td>" +
                    "<td>" + data[i][2] + "</td>" +
                    "<td>" + data[i][3] + "</td>" +
                    "</tr>";
                $("#tabBody").append(str);
            }
        }
        function  setZoneName(data) {
            $("title").html(data)
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
                    <th hidden style="width: 10%">
                        贴子ID
                    </th>
                    <th style="width: 60%">
                        帖子名称
                    </th>
                    <th style="width: 20%">
                        发布时间
                    </th>
                    <th style="width: 10%">
                        作者
                    </th>
                </tr>
                </thead>
                <tbody id="tabBody">
                </tbody>
            </table>
        </div>
        <div class="col-md-2 column">
            <p>当前用户:<a href="../user/myinfo"><%=session.getAttribute("userName")%></a></p>
            <button class="btn btn-primary btn-block" data-toggle="modal" data-target="#myModal">发帖</button>
            <a href="../zone/zone">返回版块列表</a>
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