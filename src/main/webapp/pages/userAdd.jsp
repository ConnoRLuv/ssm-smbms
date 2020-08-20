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
                <li id="active"><a href="${pageContext.request.contextPath}/user/findAll.do">用户管理</a></li>
                <li><a href="${pageContext.request.contextPath}/user/password.do">密码修改</a></li>
                <li><a href="../login.jsp">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户添加页面</span>
        </div>
        <div class="providerAdd">
            <form action="#">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="userId">用户编码：</label>
                    <input type="text" name="userCode" id="userId"/>
                    <span id="idTips">*请输入用户编码，且不能重复</span>
                </div>
                <div>
                    <label for="userName">用户名称：</label>
                    <input type="text" name="userName" id="userName"/>
                    <span>*请输入用户名称</span>
                </div>
                <div>
                    <label for="userpassword">用户密码：</label>
                    <input type="text" name="userPassword" id="userpassword"/>
                    <span>*密码长度必须大于6位小于20位</span>

                </div>
                <div>
                    <label for="userRemi">确认密码：</label>
                    <input type="text" name="userRemi" id="userRemi"/>
                    <span>*请输入确认密码</span>
                </div>
                <div>
                    <label>用户性别：</label>

                    <select name="gender">
                        <option value="2">男</option>
                        <option value="1">女</option>
                    </select>
                    <span></span>
                </div>
                <div>
                    <label for="data">出生日期：</label>
                    <input type="date" name="birthday" id="data"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="userphone">用户电话：</label>
                    <input type="text" name="phone" id="userphone"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="userAddress">用户地址：</label>
                    <input type="text" name="address" id="userAddress"/>
                </div>
                <div>
                    <label>用户类别：</label>
                    <input type="radio" name="userType" value="1"/>管理员
                    <input type="radio" name="userType" value="2"/>经理
                    <input type="radio" name="userType" value="3"/>普通用户

                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="userList.jsp">返回</a>-->
                    <input type="button" class="btn" value="保存"/>
                    <input type="button" value="返回" onclick='history.back(-1)'/>
                </div>
            </form>
        </div>

    </div>
</section>
<footer class="footer">

</footer>
<script src="${pageContext.request.contextPath}/js/time.js"></script>
<script>
    $(function () {
        $(".btn").on("click", function () {
            let userCode = $("input[name=userCode]").val();
            let userName = $("input[name=userName]").val();
            let userPassword = $("input[name=userPassword]").val();
            let userRemi = $("input[name=userRemi]").val();
            let gender = $("select[name=gender]").val();
            let birthday = $("input[name=birthday]").val();
            let phone = $("input[name=phone]").val();
            let address = $("input[name=address]").val();
            let userType = $("input[name=userType]:checked").val();

            if (userCode == "") {
                document.getElementById("idTips").innerHTML = "*用户编码不能为空";
                document.getElementById("idTips").style.color = "red";
                return;
            } else {
                document.getElementById("idTips").innerHTML = "*";
                document.getElementById("idTips").style.color = "green";
            }

            $.ajax({
                url: "${pageContext.request.contextPath}/user/addUser.do",
                type: "post",
                dataType: "JSON",
                data: {
                    userCode: userCode,
                    userName: userName,
                    userPassword: userPassword,
                    gender: gender,
                    birthday: birthday,
                    phone: phone,
                    address: address,
                    userType: userType
                },
                success: function (data) {
                    if (data.result === "1") {
                        alert("添加成功");
                        window.location.href = "${pageContext.request.contextPath}/user/findAll.do"
                    }
                }
            })
        })
    })
</script>
</body>

</html>