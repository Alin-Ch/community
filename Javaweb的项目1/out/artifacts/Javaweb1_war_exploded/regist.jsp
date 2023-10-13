<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Alin
  Date: 2023/5/18
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- 将当前网页与地址有关预设此相对地址 -->
    <base href="${pageContext.request.contextPath}/">
    <title>注册</title>
    <style>
        body {
            background: url('images/bj.png');
            background-size:cover;
        }
        form {
            background-color: #ffffff;
            margin: 120px auto;
            width: 300px;
            padding: 30px;
            border: 1px solid #dde3e8;
            border-radius: 10px;
        }
        input[type=text],
        input[type=password] {
            display: block;
            margin-bottom: 20px;
            padding: 10px;
            width: 100%;
            height: 35px;
            border-radius: 5px;
            border: 1px solid #cbd5e0;
            box-sizing: border-box;
        }
        input[type=submit] {
            background-color: #4B5563;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            padding: 10px;
            cursor: pointer;
            transition: background-color .3s ease;
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
        }
        .regist {
            color: #fff;
            width: 50%;
            height: 50px;
            margin-left: 75px;
            font-size: large;
            border: 1px solid #4CAF50;
            border-radius: 10px;
            background-color: #4CAF50;
        }
        .regist:hover{
            cursor: pointer;
            background-color: #3c823f;
        }
        a{
            text-decoration: none;
            color: #333;
        }
        a:hover{
            color: #0038fa;
            border-bottom: 1px solid #0038fa;
        }
    </style>
</head>
<body>

<c:if test="${not empty errorMsg}">
    <script>
        alert("${errorMsg}");
    </script>
</c:if>
<form action="servlet/regist" method="post"  onsubmit="return validateForm();">
    <h1>注册</h1>
    <label for="username">账号</label>
    <input type="text" id="username" name="username" required>
    <label for="password">密码</label>
    <input type="password" id="password" name="password" required>
    <label for="confirmPassword">确认密码</label>
    <input type="password" id="confirmPassword" name="confirmPassword" required>
    <button type="submit" class="regist" onclick="submit">注册</button><br>
    <a href="index.jsp" style="float: left;margin-left: 160px;margin-top: 5px;">已有帐号？去登陆</a>
</form>

<script>
    function validateForm() {
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        if(username.trim()==''){
            alert("请输入用户名！");
            return false;
        }
        if(password.trim()==''){
            alert("请输入密码！");
            return false;
        }
        if(confirmPassword.trim()==''){
            alert("请再次输入密码！");
            return false;
        }
        if(password != confirmPassword) {
            alert("两次输入的密码不一致！");
            return false;
        }
        return true;
    }

</script>


</body>
</html>
