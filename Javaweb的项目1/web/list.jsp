<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Alin
  Date: 2023/5/10
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <title>社区老龄健康监测登记系统</title>
    <link href="css/List.css" rel="stylesheet" type="text/css">
    <link href="css/camroll_slider.min.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/camroll_slider.js"></script>
<%--    引入顺序要这样--%>
</head>
<body>
<!-- 这里的路径是写死的，/Javaweb1_war_exploded是上下文路径，看着改就行了，能力有限没搞懂太多 -->
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
    <div style="background-color:#2f8232;" onclick="toggleBlock('block1')">老人信息列表</div>
    <div onclick="toggleBlock('block5')">查询老人</div>
    <div onclick="toggleBlock('block2')">添加老人信息</div>
    <div onclick="toggleBlock('block3')">公告内容</div>
    <div onclick="toggleBlock('block4')">发布公告</div>
    <div onclick="toggleBlock('block6')">人员管理</div>
    <div onclick="toggleBlock('block7')">查询人员</div>
</div>


<%--老人列表信息--%>
<div id="block1" style="display: block" class="people-title">
    <div class="people-top">
        <ul>
            <li>姓名</li>
            <li>年龄</li>
            <li>性别</li>
            <li>健康状态</li>
            <li>操作</li>
        </ul>
    </div>
    <div class="people">
        <c:forEach var="people" items="${requestScope.peopleList}">
            <ul class="item">
                <li>${people.name}</li>
                <li>${people.age}</li>
                <li>${people.sex}</li>
                <li>${people.health}</li>
                <li><a href="servlet/view?name=${people.name}&id=${people.id}">管理</a></li>
            </ul>
        </c:forEach>
    </div>
</div>
<%--添加人员信息--%>
<div id="block2" style="display: none" class="addPeople">
<form method="post" action="addPeopleServlet" onsubmit="return validateAddPeople()">
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
<%--公告内容--%>
<div id="block3" style="display: none;" class="noticeBox">
    <div>
        <c:forEach var="notice" items="${requestScope.noticeList}">
            <div class="notice">
                <div class="noticeTime">${notice.time}</div>
                <div class="noticeContent" style="margin-left: 30px">${notice.notice}</div>
                <a class="deleteButton" href="servlet/deleteNotice?id=${notice.id}" >删除</a>
            </div>
        </c:forEach>
    </div>
</div>
<%--发布公告--%>
<div id="block4" style="display: none;" class="publishBox">
    <form method="post" action="publishServlet" onsubmit="return validateForm()">
        <textarea rows="3" cols="20" name="notice"></textarea>
        <input type="submit" class="button" value="发布公告">
    </form>
</div>
<%--查询老人信息--%>
<div id="block5" style="display: none;" class="searchBox">
    <form action="servlet/view" method="post" class="search">
        <label for="name">姓名：</label>
        <input type="text" id="name" name="name" required>
        <!--required表示这个字段是必填的，但是没有空格的清空，所以要用js校验-->
        <input type="submit" value="查询" class="searchBtn">
    </form>
</div>
<%--人员管理--%>
<div id="block6" style="display: none" class="people-title">
    <div class="people-top">
        <ul>
            <li>ID</li>
            <li>用户名</li>
            <li>密码</li>
            <li>操作</li>
        </ul>
    </div>
    <div class="people">
        <c:forEach var="user" items="${requestScope.usersList}" varStatus="index">
            <ul class="item">
                <li>${index.index+1}</li>
<%--                <li>${user.id}</li>--%>
                <li>${user.username}</li>
                <li>${user.password}</li>
                <li><a href="userDetailServlet?username=${user.username}&id=${user.id}">管理</a></li>
            </ul>
        </c:forEach>
    </div>
</div>
<%--查询人员信息--%>
<div id="block7" style="display: none;" class="searchBox">
    <form action="userDetailServlet" method="post" class="searchUser">
        <label for="name">用户名：</label>
        <input type="text" id="username" name="username" required>
        <!--required表示这个字段是必填的，但是没有空格的清空，所以要用js校验-->
        <input type="submit" value="查询" class="searchBtn">
    </form>
</div>
<%--版权声明--%>
<div class="footer">
    ©2023 - 2024 社区老龄健康监测系统 | <a href="javascript:;">隐私政策</a> | <a href="javascript:;">使用条款</a>
</div>

<script>
    //轮播图js
    $("#my-slider").camRollSlider();

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

    //查询老人之前进行简单校验
    const form = document.querySelector('.search');
    const nameInput = document.querySelector('#name');
    form.addEventListener('submit', (event) => {
        // 阻止表单默认提交行为
        event.preventDefault();
        // 校验姓名是否为空
        if (nameInput.value.trim() === '') {
            alert('请输入姓名！');
        } else {
            // 没有错误，可以提交表单了
            form.submit();
        }
    });

    //查询人员信息之前简单校验
    const userForm = document.querySelector('.searchUser');
    const usernameInput = document.querySelector('#username');
    userForm.addEventListener('submit', (event) => {
        // 阻止表单默认提交行为
        event.preventDefault();
        // 校验姓名是否为空
        if (usernameInput.value.trim() === '') {
            alert('请输入用户名！');
        } else {
            // 没有错误，可以提交表单了
            userForm.submit();
        }
    });


</script>
</body>
</html>
