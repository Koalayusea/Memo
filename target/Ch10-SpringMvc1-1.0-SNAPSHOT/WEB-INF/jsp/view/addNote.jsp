<%--
  Created by IntelliJ IDEA.
  User: 94917
  Date: 2018/12/27
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
<template:user_backend htmlTitle="添加备忘录" bodyTitle="添加备忘录">
    <div class="col-md-11">
        <div class="panel panel-success">
            <div class="panel-heading"
                 style="background-color:#0b7285;color: white">
                <span class="glyphicon glyphicon-book"></span> 添加备忘录
            </div>
            <div class="panel-body">
                <form action="${cx}/notes/create"  method="POST" enctype="multipart/form-data">
                    <fieldset>
                        <div class="form-group ">
                            <label class="control-label">备忘录主题</label>
                            <input type="text" style="width: 340px;"
                                   class="form-control" placeholder="备忘录主题"
                                   value="图书馆"
                                   name="name"/>
                        </div>
                        <div class="form-group ">
                            <label class="control-label">日期</label>
                            <input type="text" style="width: 240px;"
                                   class="form-control" placeholder="输入日期"
                                   value="星期天下午2:00" name="date"/>
                        </div>

                        <div class="form-group ">
                            <label class="control-label">类型</label>
                            <select class="form-control" name="type"
                                    style="width: 240px;">
                                <option value="学习">学习</option>
                                <option value="恋爱">恋爱</option>
                                <option value="运动">运动</option>
                                <option value="外出">外出</option>
                                <option value="生活">生活</option>
                            </select>
                        </div>
                        <div class="form-group ">
                            <label class="control-label">备忘录主要内容</label>
                            <textarea  class="form-control" name="body" rows="6" cols="28">记得把要还的两本书书带上，并且复习考试内容</textarea>
                        </div>
                        <p class="col-lg-4 col-lg-offset-2">
                            <button class="btn btn-default">重置</button>
                            <button class="btn"  style="background-color:#0b7285;color: white">添加备忘录</button>
                        </p>
                    </fieldset>
                </form>
            </div>

        </div>
    </div>
    <script>
        //设置页面对应的菜单选项
        var ItemId = "Item1_1";
    </script>
</template:user_backend>
