<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Alin
  Date: 2023/6/2
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <title>社区老龄健康监测登记系统</title>
    <link href="css/camroll_slider.min.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/camroll_slider.js"></script>
    <style>
        .footer {
            margin: 50px auto;
            text-align: center;
            font-size: 14px;
            color: #999;
        }
        .footer a {
            color: #999;
            text-decoration: none;
        }
        .footer a:hover {
            color: #555;
        }
        * {
            margin: 0;
            padding: 0;
        }
        a {
            text-decoration: none;
        }
        li{
            list-style: none;
        }
        /*让用户知道自己点了哪个块*/
        .actionType{
            width: 50%;
            display: flex;
            flex-direction: row;
            justify-content: space-around;
            margin: 20px auto;
        }
        .actionType div{
            width: 150px;
            line-height: 60px;
            border-radius: 10px;
            background-color: #4caf50;
            color: #fff;
            text-align: center;
        }
        .actionType div:hover{
            cursor: pointer;
            background-color: #2f8232;
        }

        /*显示老人列表*/
        .people-title{
            width: 100%;
            height: auto;
            margin: 20px auto;
            border-radius: 20px;
            box-shadow: 5px 5px 5px 5px #d9d6d6;
            padding: 10px;
        }
        .people-title .people-top ul{
            display: flex;
            flex-direction: row;
            justify-content: space-around;
        }
        .people-title .people-top ul li{
            line-height: 50px;
            text-align: center;
            width: 120px;
            color: #fff;
            border: 1px solid #2f8232;
            background-color: #2f8232;
            border-radius: 10px;
        }
        .people-title .people .item{
            display: flex;
            flex-direction: row;
            justify-content: space-around;
        }
        .people-title .people .item li{
            line-height: 50px;
            text-align: center;
            width: 120px;
            border-bottom: 1px solid #999;
            margin-top: 5px;
            margin-bottom: 5px;
        }
        .people-title .people .item li a{
            display: block;
            width: 100%;
            height: 100%;
            color: #222222;
            text-align: center;
        }
        .people-title .people .item li a:hover{
            color: #ffcc00;
        }

        /*增加人员的盒子*/
        .addPeople{
            width: 500px;
            height: 260px;
            margin: 20px auto;
            border-radius: 20px;
            box-shadow: 5px 5px 5px 5px #d9d6d6;
            padding: 10px;
        }
        .addPeople .addPeople-item{
            width: 60%;
            height: 40px;
            margin: 10px auto 0 auto;
        }
        .addPeople .addPeople-item input{
            padding: 5px;
            height: 80%;
            border-radius: 10px;
        }
        .addPeople .addPeople-item select{
            border-radius: 10px;
            height: 80%;
            width: 45px;
            margin-left: 30px;
        }
        .button{
            width: 80px;
            line-height: 40px;
            text-align: center;
            color: #fff;
            background-color: #2f8232;
            border: 1px solid #2f8232;
            border-radius: 10px;
            margin: 0 auto;
        }
        .button:hover{
            cursor: pointer;
            background-color: #2f8232;
        }

        /*发布公告*/
        .noticeBox{
            width: 80%;
            height: auto;
            margin: 20px auto;
            border-radius: 20px;
            box-shadow: 5px 5px 5px 5px #d9d6d6;
            padding: 10px;
        }
        .notice{
            width: 95%;
            height: auto;
            display: flex;
            flex-direction: row;
            align-items: center;
            margin: 20px auto;
            border: 1px solid #d9d6d6;
            border-radius: 10px;
        }
        .notice .noticeTime{
            width: 200px;
            border-right: 1px solid #999;
            text-align: center;
        }
        .notice .noticeContent{
            width: 750px;
            height: auto;
            padding: 5px;
            margin: 5px;
        }

        .publishBox{
            width: 500px;
            height: auto;
            margin: 20px auto;
            border-radius: 20px;
            box-shadow: 5px 5px 5px 5px #d9d6d6;
            padding: 10px;
        }
        .publishBox textarea{
            width: 100%;
            height: 200px;
            padding: 10px;
            overflow-y: scroll;
            overflow-x: hidden;
        }
        .publishBox .button{
            margin-top: 10px;
            margin-left: 40%;
        }
        .publishBox .button:hover{
            background-color: #2f8232;
            cursor: pointer;
        }

        /*退出登录*/
        .logout{
            display: block;
            width: 100px;
            line-height: 40px;
            text-align: center;
            border-radius: 10px;
            color: #fff;
            background-color: #4CAF50;
            margin-top: 10px;
            margin-left: 90%;
        }
        .logout:hover{
            background-color: #008f07;
        }

    </style>
</head>
<body>


<a class="logout" href="/Javaweb1_war_exploded/index.jsp">退出登录</a>
<!-- 轮播图部分 -->
<div id="my-slider" class="crs-wrap">
    <div class="crs-screen">
        <div class="crs-screen-roll">
            <div class="crs-screen-item"
                 style="background-image: url('images/1.png');background-size: contain;background-repeat: no-repeat;">
                <div class="crs-screen-item-content">
                    <h1>社区老龄健康监测系统</h1>
                </div>
            </div>
            <div class="crs-screen-item"
                 style="background-image: url('images/2.png');background-size: contain;background-repeat: no-repeat;">
                <div class="crs-screen-item-content">
                    <h1>社区老龄健康监测系统</h1>
                </div>
            </div>
            <div class="crs-screen-item"
                 style="background-image: url('images/3.png');background-size: contain;background-repeat: no-repeat;">
                <div class="crs-screen-item-content">
                    <h1>社区老龄健康监测系统</h1>
                </div>
            </div>
            <div class="crs-screen-item"
                 style="background-image: url('images/4.png');background-size: contain;background-repeat: no-repeat;">
                <div class="crs-screen-item-content">
                    <h1>社区老龄健康监测系统</h1>
                </div>
            </div>
        </div>
    </div>
    <div class="crs-bar">
        <div class="crs-bar-roll-current"></div>
        <div class="crs-bar-roll-wrap">
            <div class="crs-bar-roll">
                <div class="crs-bar-roll-item" style="background-image: url('images/1.png');"></div>
                <div class="crs-bar-roll-item" style="background-image: url('images/2.png');"></div>
                <div class="crs-bar-roll-item" style="background-image: url('images/3.png');"></div>
                <div class="crs-bar-roll-item" style="background-image: url('images/4.png');"></div>
            </div>
        </div>
    </div>
</div>
<!-- 触发元素 -->
<div class="actionType">
    <div style="background-color:#2f8232;" onclick="toggleBlock('block3')">公告内容</div>
<%--    <div onclick="toggleBlock('block4')">发布公告</div>--%>
    <div onclick="toggleBlock('block5')">登记健康信息</div>
</div>

<div id="block3" style="display: block;" class="noticeBox">
    <%--公告内容--%>
    <div>
        <c:forEach var="notice" items="${requestScope.noticeList}">
            <div class="notice">
                <div class="noticeTime">${notice.time}</div>
                <div class="noticeContent" style="margin-left: 30px">${notice.notice}</div>
            </div>
        </c:forEach>
    </div>
</div>
<%--发布公告--%>
<%--<div id="block4" style="display: none;" class="publishBox">--%>
<%--&lt;%&ndash;    这里跳转的servlet&ndash;%&gt;--%>
<%--    <form method="post" action="publishFromPeopleServlet" onsubmit="return validateForm()">--%>
<%--        <textarea rows="3" cols="20" name="notice"></textarea>--%>
<%--        <input type="submit" class="button" value="发布公告">--%>
<%--    </form>--%>
<%--</div>--%>
<%--登记健康信息--%>
<div id="block5" style="display: none;" class="addPeople">
    <form method="post" action="addFromPeopleServlet" onsubmit="return validateAddPeople()">
        <div class="addPeople-item">
            <label>姓名：</label>
            <input style="margin-left: 30px;" type="text" name="name">
        </div>
        <div class="addPeople-item">
            <label>年龄：</label>
            <input style="margin-left: 30px;" type="number" name="age">
        </div>
        <div class="addPeople-item">
            <label>性别：</label>
            <select name="sex">
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </div>
        <div class="addPeople-item">
            <label>健康状况：</label>
            <input type="text" name="health">
        </div>
        <input type="submit" class="button" style="margin-left: 42%;margin-top: 10px" value="添加">
    </form>
</div>
<%--版权声明哈哈哈--%>
<div class="footer">
    ©2023 - 2024 社区老龄健康监测系统 | <a href="javascript:;">隐私政策</a> | <a href="javascript:;">使用条款</a>
</div>


<script>
    //轮播图js
    $("#my-slider").camRollSlider();

    //选择
    var _activeBlock = null;
    function toggleBlock(id) {
        var block = document.getElementById(id);
        // 如果单击当前活动块，则取消其激活状态
        if (block === _activeBlock) {
            _activeBlock = null;
            return;
        }
        // 隐藏其他块并显示目标块
        var blocks = document.querySelectorAll('[id^="block"]');
        for (var i = 0; i < blocks.length; i++) {
            if (blocks[i] === block) continue;
            blocks[i].style.display = 'none';
        }
        block.style.display = 'block';
        // 更新当前活动块
        _activeBlock = block;
    }

    // 获取所有块
    var blocks = document.querySelectorAll('.actionType div');
    // 为每个块添加事件监听器
    for (var i = 0; i < blocks.length; i++) {
        blocks[i].addEventListener('click', function() {
            for (var i = 0; i < blocks.length; i++) {
                blocks[i].style.backgroundColor = ''
            }
            this.style.backgroundColor="#008f07"
        });
    }
    //对发布公告进行基本的校验，如果是空的就不要提交action
    function validateForm() {
        var noticeInput = document.getElementsByName("notice")[0];
        if (noticeInput.value.trim() === "") {
            alert("公告内容不能为空！");
            return false;
        }
        // 校验通过则返回 true，允许表单提交
        return true;
    }
    //添加人员，进行简单的校验
    function validateAddPeople() {
        // 获取表单元素
        var nameInput = document.getElementsByName("name")[0];
        var ageInput = document.getElementsByName("age")[0];
        var sexSelect = document.getElementsByName("sex")[0];
        var healthInput = document.getElementsByName("health")[0];
        // 校验每个输入框是否为空
        if (nameInput.value.trim() === "") {
            alert("请输入姓名！");
            return false;
        }
        if (ageInput.value.trim() === "") {
            alert("请输入年龄！");
            return false;
        }
        if (sexSelect.value.trim() === "") {
            alert("请选择性别！");
            return false;
        }
        if (healthInput.value.trim() === "") {
            alert("请输入健康状况！");
            return false;
        }

        // 校验通过则返回 true 允许表单提交
        return true;
    }

</script>
</body>
</html>
