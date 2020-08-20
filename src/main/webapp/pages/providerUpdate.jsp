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
                <li id="active"><a href="${pageContext.request.contextPath}/provider/findAll.do">供应商管理</a></li>
                <li><a href="${pageContext.request.contextPath}/user/findAll.do">用户管理</a></li>
                <li><a href="${pageContext.request.contextPath}/pages/password.jsp">密码修改</a></li>
                <li><a href="../login.jsp">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>供应商管理页面 >> 供应商修改页</span>
        </div>
        <div class="providerAdd">
            <form action="#">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="providerId">供应商编码：</label>
                    <input type="text" name="proCode" id="providerId" value="${providerUpdate.proCode}"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="providerName">供应商名称：</label>
                    <input type="text" name="proName" id="providerName" value="${providerUpdate.proName}"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="people">联系人：</label>
                    <input type="text" name="proContact" id="people" value="${providerUpdate.proContact}"/>
                    <span>*</span>

                </div>
                <div>
                    <label for="phone">联系电话：</label>
                    <input type="text" name="proPhone" id="phone" value="${providerUpdate.proPhone}"/>
                    <span></span>
                </div>
                <div>
                    <label for="address">联系地址：</label>
                    <input type="text" name="proAddress" id="address" value="${providerUpdate.proAddress}"/>
                    <span></span>

                </div>
                <div>
                    <label for="fax">传真：</label>
                    <input type="text" name="proFax" id="fax" value="${providerUpdate.proFax}"/>
                    <span></span>

                </div>
                <div>
                    <label for="describe">描述：</label>
                    <input type="text" name="proDesc" id="describe" value="${providerUpdate.proDesc}"/>
                    <span></span>

                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="providerList.jsp">返回</a>-->
                    <input type="button" value="保存" class="btn"/>
                    <input type="button" value="返回" onclick="history.back(-1)"/>
                </div>
            </form>
        </div>

    </div>
</section>
<footer class="footer">

</footer>
<script src="${pageContext.request.contextPath}/js/time.js"></script>
<script>
    $(function (){
        $(".btn").on("click",function (){
            let proCode = $("input[name=proCode]").val();
            let proName = $("input[name=proName]").val();
            let proContact = $("input[name=proContact]").val();
            let proPhone = $("input[name=proPhone]").val();
            let proAddress = $("input[name=proAddress]").val();
            let proFax = $("input[name=proFax]").val();
            let proDesc = $("input[name=proDesc]").val();


            $.ajax({
                url: "${pageContext.request.contextPath}/provider/updateProvider.do",
                type: "post",
                dataType: "JSON",
                data: {
                    proCode:proCode,
                    proName:proName,
                    proContact:proContact,
                    proPhone:proPhone,
                    proAddress:proAddress,
                    proFax:proFax,
                    proDesc:proDesc
                },
                success: function (data) {
                    if (data.result == "1") {
                        alert("修改成功");
                        window.location.href = "${pageContext.request.contextPath}/provider/findAll.do"
                    }
                }
            })
        })
    })
</script>
</body>
</html>