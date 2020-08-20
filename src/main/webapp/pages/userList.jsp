<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/page.css"/>

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
            <span>用户管理页面</span>
        </div>
        <form action="${pageContext.request.contextPath}/user/findAll.do?type=1" method="post">
            <div class="search">
                <span>用户名：</span>
                <input type="text" name="userName" placeholder="请输入用户名"/>
                <input type="submit" id="searchBtn" class="btn" value="查询"/>
                <a href="${pageContext.request.contextPath}/pages/userAdd.jsp">添加用户</a>
            </div>
        </form>

        <!--用户-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">用户编码</th>
                <th width="20%">用户名称</th>
                <th width="10%">性别</th>
                <th width="10%">年龄</th>
                <th width="10%">电话</th>
                <th width="10%">用户类型</th>
                <th width="30%">操作</th>
            </tr>

            <jsp:useBean id="nowDate" class="java.util.Date"/>
            <c:forEach items="${list.list}" var="user">
                <tr>
                    <td>${user.userCode}</td>
                    <td>${user.userName}</td>
                    <td>${user.gender=="2"?"男":"女"}</td>
                    <td>${nowDate.year - user.birthday.year}</td>
                    <td>${user.phone}</td>
                    <td>${user.userType=="1"?"管理员":user.userType=="2"?"经理":"普通用户"}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/user/userView.do?userName=${user.userName}"><img
                                src="${pageContext.request.contextPath}/img/read.png" alt="查看" title="查看"/></a>
                        <a href="${pageContext.request.contextPath}/user/update.do?userName=${user.userName}"><img
                                src="${pageContext.request.contextPath}/img/xiugai.png" alt="修改" title="修改"/></a>
                        <a href="${pageContext.request.contextPath}/user/deleteUser.do?userName=${user.userName}"><img
                                src="${pageContext.request.contextPath}/img/schu.png" alt="删除" title="删除"/></a>
                    </td>

                </tr>
            </c:forEach>
        </table>
        <div class="page-icon">
            <a class="page-current" href="${pageContext.request.contextPath}/user/findAll.do?page=1&size=8"
               aria-label="Previous">首页</a>
            <a class="previous-page"
               href="${pageContext.request.contextPath}/user/findAll.do?page=${list.prePage}&size=8">上一页</a>
            <c:forEach begin="1" end="${list.pages}" var="pageNums">
                <a href="${pageContext.request.contextPath}/user/findAll.do?page=${pageNums}&size=8">${pageNums}</a>
            </c:forEach>

            <a class="page-next" href="${pageContext.request.contextPath}/user/findAll.do?page=${list.nextPage}&size=8">下一页</a>
            <a href="${pageContext.request.contextPath}/user/findAll.do?page=${list.pages}&size=8"
               aria-label="Next">尾页</a>

        </div>
    </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该用户吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>

</div>

<footer class="footer">

</footer>

<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/js.js"></script>
<script src="${pageContext.request.contextPath}/js/time.js"></script>

</body>

<%--<script>--%>
<%--    $(function () {--%>
<%--        $(".btn").on("click", function () {--%>
<%--            let userName = $("input[name=userName]").val();--%>

<%--            if (userName == "") {--%>
<%--                return;--%>
<%--            } else {--%>
<%--                $.ajax({--%>
<%--                    url: "${pageContext.request.contextPath}/user/selectUserByName.do",--%>
<%--                    type: "post",--%>
<%--                    dataType: "JSON",--%>
<%--                    data: {--%>
<%--                        userName: userName,--%>
<%--                    },--%>
<%--                    success: function (data) {--%>
<%--                        if (data.result == "1") {--%>
<%--                            window.location.href = "${pageContext.request.contextPath}/user/select.do"--%>
<%--                            $("input[name=userName]").attr("value", userName);--%>

<%--                        }--%>
<%--                    }--%>
<%--                })--%>
<%--            }--%>


<%--        })--%>
<%--    })--%>
<%--</script>--%>


</html>