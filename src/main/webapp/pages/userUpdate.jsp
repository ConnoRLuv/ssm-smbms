<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>超市账单管理系统</h1>

    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> ${sessionScope.loginUser.userName}</span> , 欢迎你！</p>
        <a href="../login.jsp">退出</a>
    </div>
</header>
<!--时间-->
<section class="publicTime">
    <span id="time">2015年1月1日 11:11  星期一</span>
    <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
</section>
<!--主体内容-->
<section class="publicMian ">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="${pageContext.request.contextPath}/bill/findAll.do">账单管理</a></li>
                <li><a href="${pageContext.request.contextPath}/provider/findAll.do">供应商管理</a></li>
                <li id="active"><a href="${pageContext.request.contextPath}/user/findAll.do">用户管理</a></li>
                <li><a href="${pageContext.request.contextPath}/pages/password.jsp">密码修改</a></li>
                <li><a href="${pageContext.request.contextPath}/user/logOut.do">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户修改页面</span>
        </div>
        <div class="providerAdd">
            <form action="#">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <input type="hidden" name="id" value="${userUpdate.id}">
                <div>
                    <label for="userName">用户名称：</label>
                    <input type="text" name="userName" id="userName" value="${userUpdate.userName}"/>
                    <span>*</span>
                </div>

                <div>
                    <label>用户性别：</label>

                    <label>
                        <select name="gender">
                            <option value="2" ${userUpdate.gender==2?"selected":""}>男</option>
                            <option value="1" ${userUpdate.gender==1?"selected":""}>女</option>
                        </select>
                    </label>
                </div>
                <div>
                    <label for="data">出生日期：</label>
                    <input type="date" name="birthday" id="data"
                           value="<fmt:formatDate value="${userUpdate.birthday}" pattern="yyyy-MM-dd"/>"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="userphone">用户电话：</label>
                    <input type="text" name="phone" id="userphone" value="${userUpdate.phone}"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="userAddress">用户地址：</label>
                    <input type="text" name="address" id="userAddress" value="${userUpdate.address}"/>
                </div>
                <div>
                    <label>用户类别：</label>
                    <input type="radio" name="userType" value="1" ${userUpdate.userType==1?"checked":""}/>管理员
                    <input type="radio" name="userType" value="2" ${userUpdate.userType==2?"checked":""}/>经理
                    <input type="radio" name="userType" value="3" ${userUpdate.userType==3?"checked":""}/>普通用户

                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="userList.jsp">返回</a>-->
                    <input type="button" id="btn" value="保存"/>
                    <input type="button" value="返回" onclick='history.back(-1)'/>
                </div>
            </form>
        </div>

    </div>
</section>
<footer class="footer">

</footer>
<script src="${pageContext.request.contextPath}/js/time.js"></script>
</body>
<script>
    $(function () {
        $("#btn").on("click", function () {
            let id = $("input[name=id]").val();
            let userName = $("input[name=userName]").val();
            let gender = $("select[name=gender]").val();
            let birthday = $("input[name=birthday]").val();
            let phone = $("input[name=phone]").val();
            let address = $("input[name=address]").val();
            let userType = $("input[name=userType]:checked").val();


            $.ajax({
                url: "${pageContext.request.contextPath}/user/updateUser.do",
                type: "post",
                dataType: "JSON",
                data: {
                    id: id,
                    userName: userName,
                    gender: gender,
                    birthday: birthday,
                    phone: phone,
                    address: address,
                    userType: userType
                },
                success: function (data) {
                    if (data.result == "1") {
                        alert("修改成功");
                        window.location.href = "${pageContext.request.contextPath}/user/findAll.do"
                    }
                }
            })
        })
    })
</script>

</html>