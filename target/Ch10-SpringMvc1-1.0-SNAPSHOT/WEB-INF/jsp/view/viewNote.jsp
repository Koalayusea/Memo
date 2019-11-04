<%--
  Created by IntelliJ IDEA.
  User: 94917
  Date: 2018/12/27
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<template:user_backend htmlTitle="${note.name}"
                       bodyTitle="备忘录详情">
    <i>Note #${note.noteId}: ${note.name}</i><br/><br/>
    <%--<i><strong>客户姓名:</strong> ${ticket.user.username}</i>--%>
    <p>
        <strong>创建时间:</strong> <fmt:formatDate value="${note.dateCreated}"
                                               pattern="yyyy年MM月dd日 E hh时mm分ss秒"/>

    <p>
    <p><strong>类型:</strong>  ${note.type}
    <p><strong>日期:</strong>  ${note.date}<p>

    <b><strong>内容:</strong> ${note.body}<br/><br/>

    <a href="${cx}/notes/">返回备忘录列表 </a>

    <script>
        //设置页面对应的菜单选项
        var ItemId ="Item1_0";
    </script>
</template:user_backend>
