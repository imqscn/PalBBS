<!DOCTYPE html>
<html lang="zhCN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>站内搜索</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>

        currentUserName = "<%=session.getAttribute("userName")%>"
        currentUserId = "<%=session.getAttribute("userId")%>"
        if(currentUserId=='')window.location.href='../user/login'
        function search(){
            var dataReady={
                'word':$("#inputSearchWord").val()
            }
            $.ajax({
                url:"pushSearchData",
                type:"post",
                cache:false,
                data:dataReady,
                success:function (data) {
                    if(data!=''){
                        showData(data);
                    }
                    else alert("没有查到相关内容")
                },
                error:function (msg) {
                    alert("连接异常："+msg)
                }
            })
        }

        function showData(data) {
            $("#tabBody").html("");
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
    </script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-10 column">
            <div class="form-inline" style="margin-top: 30px">
                    <input style="width:40%" type="text" id="inputSearchWord" class="form-control" placeholder="输入要搜索的内容" required autofocus>
                    <button type="button" style="width: 10%" class="btn btn-default" onclick="search()">搜索</button>
            </div>
            <div>
                <p>搜索结果：</p>
            </div>
            <table class="table">
                <thead>
                <tr>
                    <th hidden>
                        贴子ID
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
            <a href="../zone/zone">返回版块列表</a>
            </div>
        </div>
    </div>
</body>
</html>