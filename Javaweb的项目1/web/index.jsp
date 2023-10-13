<%--
  Created by IntelliJ IDEA.
  User: Alin
  Date: 2023/5/10
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>社区老龄健康监测登记系统</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <style>
      body {
        font-family: sans-serif;
      }
      .login-form {
        top:100px;
        background-color: #f9f9f9;
        position: relative;
        width: 300px;
        margin: 100px auto;
        border: 1px solid #fff;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 2px 2px 5px #f3eded;
      }
      input[type=text],
      input[type=password] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        border-radius: 10px;
        border: 1px solid #888;
        box-sizing: border-box;
      }
      button {
        background-color: #4CAF50;
        color: white;
        padding: 12px 20px;
        margin: 24px 5px;
        border: none;
        cursor: pointer;
        width: 120px;
        border-radius: 15px;
        border: 1px solid #888;
      }
      .login{
        margin-left: 60%;
      }
      .login:hover {
        opacity: 0.8;
      }
      .regist{
        position: absolute;
        top: 261px;
        left: 20px;
        background-color:#4CAF50;
        float: right;
        color: #fff;
      }
      body {
        background: url('images/bj.png');
        background-size:cover;
      }

    </style>
  </head>

  <body>
  <div class="login-form">
    <h1>你好，请登录</h1>
    <form action="servlet/login" method="post">
      <label for="username">账号:</label>
      <input type="text" id="username" name="username">
      <label for="password">密码:</label>
      <input type="password" id="password" name="password">
      <button type="submit" class="login">登录</button>
    </form>
    <p class="btn">
      <%--      <button onclick="window.open('regist.jsp')" class="regist">注册</button>--%>
        <button onclick="location.href='regist.jsp'" class="regist">注册</button>
<%--        <button onclick="location.href='servlet/regist'" method="post" class="regist">注册</button>--%>
    </p>
  </div>

  </body>
</html>
