<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Alin
  Date: 2023/5/10
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- 将当前网页与地址有关预设此相对地址 -->
    <base href="${pageContext.request.contextPath}/">
    <title>人员详细信息</title>
    <link href="css/detail.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="peopleInfo" style="margin-top: 80px;">
    <ul>
        <li style="border-bottom: 1px solid #999;">用户名</li>
        <li style="border-bottom: 1px solid #999;">密码</li>
    </ul>
</div>

<div class="peopleInfo">
    <ul>
        <li style="font-weight: bold">${user.username}</li>
        <li style="font-weight: bold">${user.password}</li>
    </ul>
</div>


<!-- 按钮 -->
<div class="bottom">
    <button class="button" onclick="openEditModal()">修改信息</button>
    <a href="deleteUser?username=${user.username}" class="button">删除</a>
    <button class="back" onclick="location.href='servlet/list'">返回人员列表</button>
</div>

<!-- 定义模态框元素 -->
<!-- 模态框主体 -->
<div class="modal-body" style="display: none">
    <form onsubmit="return false;">
        <div class="form-group">
            <label>用户名：</label>
            <input type="text" id="nameInput" class="form-control" value="${user.username}">
        </div>
        <div class="form-group">
            <label>密码：</label>
            <input type="text" id="ageInput" class="form-control" value="${user.password}">
        </div>
    </form>
    <!-- 模态框底部按钮 -->
    <div class="modal-footer">
        <button type="button" class="reset" data-dismiss="modal" onclick="resetModal()">重置</button>
        <button type="submit" class="submit" onclick="saveChanges()">提交修改</button>
    </div>
</div>
<%--版权声明--%>
<div class="footer">
    ©2023 - 2024 社区老龄健康监测系统 | <a href="javascript:;">隐私政策</a> | <a href="javascript:;">使用条款</a>
</div>

<script>
    let usernameInput, passwordInput;
    function openEditModal() {
        // 获取输入框元素
        usernameInput = document.getElementById("nameInput");
        passwordInput = document.getElementById("ageInput");

        // 设置初始值
        usernameInput.value = "${user.username}";
        passwordInput.value = "${user.password}";

        // 显示模态框
        const modal = document.querySelector(".modal-body");
        if (modal.style.display == "none"){
            modal.style.display = "block";
        }else if (modal.style.display == "block"){
            modal.style.display = "none";
        }
    }

    function resetModal() {
        // 重置输入框
        usernameInput.value = "${user.username}";
        passwordInput.value = "${user.password}";
    }

    function saveChanges() {
        // 获取修改后的值，并发送给服务器保存
        const id = "${user.id}"
        const username = usernameInput.value;
        const password = passwordInput.value;

        location.href="updateUserInfo?id="+id+"&username="+username+"&password="+password;

    }
</script>

</body>
</html>
