<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <li><a href="${pageContext.request.contextPath}/user/findAll.do">用户管理</a></li>
                <li id="active"><a href="${pageContext.request.contextPath}/pages/password.jsp">密码修改</a></li>
                <li><a href="${pageContext.request.contextPath}/user/logOut.do">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>密码修改页面</span>
        </div>
        <div class="providerAdd">
            <form action="#">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="oldPassword">旧密码：</label>
                    <input type="password" name="oldPassword" id="oldPassword" required/>
                    <span>*请输入原密码</span>
                </div>
                <div>
                    <label for="newPassword">新密码：</label>
                    <input type="password" name="newPassword" id="newPassword" required/>
                    <span>*请输入新密码</span>
                </div>
                <div>
                    <label for="reNewPassword">确认新密码：</label>
                    <input type="password" name="reNewPassword" id="reNewPassword" required/>
                    <span>*请输入新确认密码，保证和新密码一致</span>
                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <input type="button" value="保存" class="btn"/>
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
        $(".btn").on("click", function () {

            let oldPassword = $("input[name=oldPassword]").val();
            let newPassword = $("input[name=newPassword]").val();
            let reNewPassword = $("input[name=reNewPassword]").val();

            if (oldPassword != ${sessionScope.loginUser.userPassword}) {
                alert("原密码错误")
                return;
            }

            if (newPassword != reNewPassword) {
                alert("两次输入新密码不匹配")
                return;

            }

            $.ajax({
                url: "${pageContext.request.contextPath}/user/password.do",
                type: "post",
                dataType: "JSON",
                data: {
                    newPassword: newPassword
                },
                success: function (data) {
                    if (data.result === "1") {
                        alert("修改成功");
                        window.location.href = "../login.jsp"
                    }
                }
            })
        })
    })
</script>
</html>