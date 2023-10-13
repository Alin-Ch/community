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
    <title>老人详情信息</title>
    <link href="css/detail.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="peopleInfo" style="margin-top: 80px;">
    <ul>
        <li style="border-bottom: 1px solid #999;">姓名</li>
        <li style="border-bottom: 1px solid #999;">年龄</li>
        <li style="border-bottom: 1px solid #999;">性别</li>
        <li style="border-bottom: 1px solid #999;">健康状态</li>
    </ul>
</div>
<div class="peopleInfo">
    <ul>
        <li style="font-weight: bold">${people.name}</li>
        <li style="font-weight: bold">${people.age}</li>
        <li style="font-weight: bold">${people.sex}</li>
        <li style="font-weight: bold">${people.health}</li>
    </ul>
</div>
    <!-- 按钮 -->
<div class="bottom">
    <button class="button" onclick="openEditModal()">修改信息</button>
    <a href="servlet/delete?name=${people.name}" class="button">删除</a>
    <button class="back" onclick="location.href='servlet/list'">返回人员列表</button>
</div>

    <!-- 定义模态框元素 -->
    <!-- 模态框主体 -->
    <div class="modal-body" style="display: none">
        <form onsubmit="return false;">
            <div class="form-group">
                <label>姓名：</label>
                <input type="text" id="nameInput" class="form-control" value="${people.name}">
            </div>
            <div class="form-group">
                <label>年龄：</label>
                <input type="number" id="ageInput" class="form-control" value="${people.age}">
            </div>
            <div class="form-group">
                <label>性别：</label>
                <select id="sexInput" class="form-control">
                    <option value="男" ${people.sex == '男' ? 'selected' : ''}>男</option>
                    <option value="女" ${people.sex == '女' ? 'selected' : ''}>女</option>
                </select>
            </div>
            <div class="form-group">
                <label>健康状况：</label>
                <input id="healthInput" value="${people.health}">
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
    let nameInput, ageInput, sexInput, healthInput;
    function openEditModal() {
        // 获取输入框元素
        nameInput = document.getElementById("nameInput");
        ageInput = document.getElementById("ageInput");
        sexInput = document.getElementById("sexInput");
        healthInput = document.getElementById("healthInput");

        // 设置初始值
        nameInput.value = "${people.name}";
        ageInput.value = "${people.age}";
        sexInput.value = "${people.sex}";
        healthInput.value = "${people.health}";

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
        nameInput.value = "${people.name}";
        ageInput.value = "${people.age}";
        sexInput.value = "${people.sex}";
        healthInput.value = "${people.health}";
    }

    function saveChanges() {
        // 获取修改后的值，并发送给服务器保存
        const name = nameInput.value;
        const age = ageInput.value;
        const sex = sexInput.value;
        const health = healthInput.value;

        location.href="servlet/updateInfo?id=${people.id}&name="+name+"&age="+age+"&sex="+sex+"&health="+health;

    }
</script>

</body>
</html>
