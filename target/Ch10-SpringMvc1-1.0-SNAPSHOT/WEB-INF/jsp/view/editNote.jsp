<%--
  Created by IntelliJ IDEA.
  User: 94917
  Date: 2018/12/27
  Time: 21:46
  To change this template use File | Settings | File Templates.
--%>
<template:user_backend htmlTitle="编辑备忘录" bodyTitle="编辑备忘录">
    <form method="POST" action="${cx}/notes/update/"
          enctype="multipart/form-data">
        <%--<input type="hidden" name="noteId" value="${note.noteId}"/>--%>
        <%--创建人<br/>--%>
         <input type="hidden" name="noteId" value="${note.noteId}"/>

            备忘录主题<br/>
        <input type="text" name="name"
               disabled value="${note.name}"><br/><br/>

            日期<br/>
        <input type="text" name="date" value="${note.date}"><br/><br/>

            类型<br/>
        <select  name="type">
            <option value="学习" ${note.type eq "学习" ? "selected" : ""}>学习</option>
            <option value="恋爱" ${note.type eq "恋爱" ? "selected" : ""}>恋爱</option>
            <option value="运动" ${note.type eq "运动" ? "selected" : ""}>运动</option>
            <option value="外出" ${note.type eq "外出" ? "selected" : ""}>外出</option>
            <option value="生活" ${note.type eq "生活" ? "selected" : ""}>生活</option>
        </select>
        <br/><br/>

        备忘录内容<br/>
        <textarea name="body" rows="5" cols="30">${note.body}
        </textarea><br/><br/>
        创建时间:<br/>
        <fmt:formatDate value="${note.dateCreated}"
                        pattern="yyyy年MM月dd日 E hh时mm分ss秒"/>
        <br/><br/>
        <input type="submit" value="提交"/>
    </form>
    <script>
        //设置页面对应的菜单选项
        var ItemId ="Item1_0";
    </script>
</template:user_backend>