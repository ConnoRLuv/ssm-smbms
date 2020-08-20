<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
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
                <li id="active"><a href="${pageContext.request.contextPath}/bill/findAll.do">账单管理</a></li>
                <li><a href="${pageContext.request.contextPath}/provider/findAll.do">供应商管理</a></li>
                <li><a href="${pageContext.request.contextPath}/user/findAll.do">用户管理</a></li>
                <li><a href="${pageContext.request.contextPath}/pages/password.jsp">密码修改</a></li>
                <li><a href="${pageContext.request.contextPath}/user/logOut.do">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>账单管理页面</span>
        </div>
        <div class="search">
            <span>商品名称：</span>
            <input type="text" placeholder="请输入商品的名称"/>
            <span>供应商：</span>
            <select name="tigong">
                <option value="">--请选择--</option>
                <option value="">北京市粮油总公司</option>
                <option value="">邯郸市五得利面粉厂</option>
            </select>

            <span>是否付款：</span>
            <select name="fukuan">
                <option value="">--请选择--</option>
                <option value="">已付款</option>
                <option value="">未付款</option>
            </select>

            <input type="button" value="查询"/>
            <a href="billAdd.jsp">添加订单</a>
        </div>
        <!--账单表格 样式和供应商公用-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">账单编码</th>
                <th width="20%">商品名称</th>
                <th width="10%">供应商</th>
                <th width="10%">账单金额</th>
                <th width="10%">是否付款</th>
                <th width="10%">创建时间</th>
                <th width="30%">操作</th>
            </tr>
            <c:forEach items="${list.list}" var="bill">
                <td>${bill.billCode}</td>
                <td>${bill.productName}</td>
                <td>${bill.proName}</td>
                <td>${bill.totalPrice}</td>
                <td>${bill.isPayment=="1"?"已支付":"未支付"}</td>
                <td><fmt:formatDate value="${bill.creationDate}" pattern="yyyy-MM-dd"/></td>
                <td>
                    <a href="${pageContext.request.contextPath}/bill/billView.do?billCode=${bill.billCode}"><img src="${pageContext.request.contextPath}/img/read.png" alt="查看"
                                                title="查看"/></a>
                    <a href="${pageContext.request.contextPath}/bill/update.do"><img src="${pageContext.request.contextPath}/img/xiugai.png" alt="修改"
                                                  title="修改"/></a>
                    <a href="#" class="removeBill"><img src="${pageContext.request.contextPath}/img/schu.png" alt="删除"
                                                        title="删除"/></a>
                </td>
            </c:forEach>
        </table>
    </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeBi">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该订单吗？</p>
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
</html>