<%--
  Created by IntelliJ IDEA.
  User: 94917
  Date: 2018/12/27
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<template:user_backend htmlTitle="备忘录列表" bodyTitle="查看备忘录">
    <c:choose>
        <c:when test="${pageInfo.list.size()==0}">
            <h3>目前没有任何备忘录</h3>
        </c:when>
        <c:otherwise>
            <strong>总记录数:${pageInfo.total},每页${pageInfo.pageSize}条记录, 共${pageInfo.pages}页,
                当前为第${pageInfo.pageNum}页,
                记录范围:${pageInfo.startRow}-${pageInfo.endRow},
                共${pageInfo.size}条记录</strong>
        </c:otherwise>
    </c:choose>

    <div class="panel panel-default ">
        <!-- Default panel contents -->
        <div class="panel-heading clearfix">
            <div class="pull-right">
                <div class="btn-group">
                    <button type="button"
                            class="btn btn-default dropdown-toggle active"
                            data-toggle="dropdown">
                        所有类型 <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="/note/notes/list_ac?action=study">学习</a></li>
                        <li><a href="/note/notes/list_ac?action=love">恋爱</a></li>
                        <li><a href="/note/notes/list_ac?action=yundong">运动</a></li>
                        <li><a href="/note/notes/list_ac?action=waichu">外出</a></li>
                        <li><a href="/note/notes/list_ac?action=shenghuo">生活</a></li>
                            <%--<li class="divider"></li>--%>
                    </ul>
                </div>
                <div class="btn-group">
                    <button type="button"
                            class="btn btn-default dropdown-toggle"
                            data-toggle="dropdown">
                        用户名排序 <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li><a href="#">日期排序</a></li>
                        <li><a href="#">类型排序</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Reset</a></li>
                    </ul>
                </div>
            </div>
            <div class="pull-left">
                <button class="btn btn-success" data-backdrop="static">新建
                </button>
                <button class="btn btn-danger">删除</button>
            </div>
        </div>


        <table id="List" class="table table-bordered table-hover cc">
            <thead>
            <tr class="">
                <td class="text-center">
                    <input type="checkbox"></td>
                <th>序号</th>
                <th>备忘录ID号</th>
                <th>主题</th>
                <th>日期</th>
                <th>类型</th>
                <th class="col-lg-3">操作</th>
            </tr>
            </thead>
            <tbody class="">

            <!--遍历输出所有票据内容-->
            <c:forEach var="note" items="${pageInfo.list}"
                       varStatus="s">
                <tr>
                    <td class="text-center"><input type="checkbox"></td>
                    <td>${s.count}</td>
                    <td>#${note.noteId}</td>
                    <td>${note.name}</td>
                    <td>${note.date}</td>
                    <td>${note.type}</td>
                    <td>
                        <button class="btn  btn-xs btn-info"
                                style="color: white;"><span
                                class="glyphicon glyphicon-list"></span>
                            <a href="${cx}/notes/view/${note.noteId}">
                                详情</a></button>
                        <button class="btn  btn-xs btn-success"><span
                                class="glyphicon glyphicon-user"></span>
                            <a href="${cx}/notes/edit/${note.noteId}">
                                编辑</a></button>
                        <button class="btn  btn-xs btn-danger noteDel"><span
                                class="glyphicon glyphicon-user"></span>
                            <a href="${cx}/notes/del/${note.noteId}">
                                删除</a></button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="col-md-12 text-right">
            <zsc:page url="${cx}/notes/list"/>
        </div>
    </div>

</template:user_backend>
<script>
    var ItemId = "Item1_2";
    //使用jq弹出一个是否删除记录的提示框
    $(document).ready(function () {
        $(".noteDel").click(function () {
            if (confirm("确定删除备忘录?")) {
                return true;
            }
            return false;
        });
    });

</script>
