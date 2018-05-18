<!DOCTYPE html>
<html lang="zhCN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>批量删除帖子</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        $(function() {
            currentUserName = "<%=session.getAttribute("userName")%>"
            currentUserId = "<%=session.getAttribute("userId")%>"
            if(currentUserName!='admin'){
                window.location.href='../user/login'
            }
            $.ajax({
                url:"pushPostDataForDeleteMore",
                type:"post",
                success:function (data) {
                    showData(data);
                },
                error:function (msg) {
                    alert("连接异常："+msg)
                }
            })
            $("#btnSelectAll").click(function () {
                if($("#btnSelectAll").html()=="全选") {
                    $("#tabBody input[type=\"checkbox\"]").prop("checked",true)
                    $("#btnSelectAll").html("反选")
                }
                else {
                    $("#tabBody input[type=\"checkbox\"]").prop("checked",false)
                    $("#btnSelectAll").html("全选")
                }
            })
            $("#btnDeleteSelectPost").click(function () {
                var dataReady
                $("#tabBody :checked").each(function () {
                    dataReady = {
                        'id':$(this).parent().prev().html()
                    }
                    $.ajax({
                            url:'deletePost',
                            data:dataReady,
                            type:'post',
                            success:function (data) {
                                if(data=='1'){
                                    window.location.reload()
                                }
                                else alert("删除失败")
                            },
                            error:function () {
                                alert("删除失败，连接异常")
                            }
                        }
                    )
                })
            })
        })
        function showData(data) {
            var str = ""
            for(var i = 0;i<data.length;i++){
                str = "<tr><td hidden>" + data[i][0] +
                    "<td><input type=\"checkbox\" class=\"cbPost\"></td>" +
                    "<td><a href='../comment/comment?"+data[i][0]+"'>" + data[i][1] + "</a></td>" +
                    "<td>" + data[i][2] + "</td>" +
                    "<td>" + data[i][3] + "</td>" +
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
                    <th hidden>
                        贴子ID
                    </th>
                    <th>
                        <button type="button" id="btnSelectAll" class="btn btn-link">全选</button>
                    </th>
                    <th>
                        贴子
                    </th>
                    <th>
                        摘要
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
            <p>当前用户:<a href="../user/myinfo"><%=session.getAttribute("userName")%></a></p>
            <button class="btn btn-danger btn-block" id="btnDeleteSelectPost">批量删除帖子</button>
            <a href="../post/post">返回帖子列表</a>
            <a href="../user/admin">返回管理页面</a>
        </div>
    </div>
</div>
</body>
</html>