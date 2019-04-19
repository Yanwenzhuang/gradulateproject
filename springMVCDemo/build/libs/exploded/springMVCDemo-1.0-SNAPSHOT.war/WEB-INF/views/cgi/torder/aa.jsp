
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/9/21
  Time: 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="author" content="order by dede58.com"/>
    <title>坚果商城</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/jquery-3.3.1.min.js"></script>
</head>

<body>

<!-- start header -->
<header>
    <div class="top center">
        <div class="left fl">
            <ul>
                <li><a href="" target="_blank">坚果商城</a></li>
                <li>|</li>
                <li><a href="">核桃</a></li>
                <li>|</li>
                <li><a href="">开心果</a></li>
                <li>|</li>
                <li><a href="">腰果</a></li>
                <li>|</li>
                <li><a href="">花生</a></li>
                <li>|</li>
                <li><a href="">板栗</a></li>
                <li>|</li>
                <li><a href="">杏仁</a></li>
                <li>|</li>
                <li><a href="">白果</a></li>
                <li>|</li>
                <li><a href="">问题反馈</a></li>
            </ul>
        </div>
        <div class="right fr">
            <c:choose>
                <c:when test="${not empty customer}">
                    <div class="gouwuche fr"><a href="/cgi/shopcar/toShopcarUI">购物车</a></div>
                </c:when>
                <c:otherwise>
                    <div class="gouwuche fr"><a href="/cgi/customer/toCustomerLoginUI">购物车</a></div>
                </c:otherwise>
            </c:choose>

            <div class="fr">

                <c:choose>
                    <c:when test="${not empty customer}">
                        <ul>
                            <li><a href="##" target="_blank" >${sessionScope.customer.realname},欢迎您！</a></li>
                            <li>|</li>
                            <li><a href="/cgi/customer/toCustomerRegisterUI" target="_blank" >修改个人信息</a></li>
                            <li>|</li>
                            <li><a href="${pageContext.request.contextPath }/cgi/customer/logout" target="_blank">退出登录</a></li>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <ul>
                            <li><a href="/cgi/customer/toCustomerLoginUI" target="_blank">登录</a></li>
                            <li>|</li>
                            <li><a href="/cgi/customer/toCustomerRegisterUI" target="_blank" >注册</a></li>
                        </ul>
                    </c:otherwise>
                </c:choose>

            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</header>
<!--end header -->
<div class="jieshao mt20 w">
    <div class="grzxbj">
        <div class="selfinfo center">
            <div class="rtcont fr">
                <div class="grzlbt ml40">订单详细信息</div>
            <c:forEach items="${content}" var="order_goods">
                <div class="subgrzl ml40"><span>订单ID</span><span>${order_goods.torder.id}</span></div>
                <div class="subgrzl ml40"><span>下单时间</span><span>${order_goods.torder.orderTime}</span></div>
                <div class="subgrzl ml40"><span>下单客户</span><span>${order_goods.torder.customer.realname}</span></div>
                <div class="subgrzl ml40"><span>收货人</span><span>${order_goods.torder.receiver}</span></div>
                <div class="subgrzl ml40"><span>联系方式</span><span>${order_goods.torder.phone}</span></div>
                <div class="subgrzl ml40"><span>收货地址</span><span>${order_goods.torder.address}</span></div>
                <div class="subgrzl ml40"><span>商品名称</span><span>${order_goods.goods.name}</span></div>
                <div class="subgrzl ml40"><span>商品单价格</span><span>${order_goods.goods.price}</span></div>
                <div class="subgrzl ml40"><span>商品数量</span><span>${order_goods.count}</span></div>
            </c:forEach>
            </div>
        </div>
    </div>
</div>






<div class="clear"></div>
</div>


<footer class="mt20 center">
    <div class="mt20">坚果商城 | 核桃 | 开心果 | 腰果 | 花生 | 板栗 | 杏仁 | 白果 | 瓜子 | 松子 | 夏威夷果</div>
</footer>


</body>
</html>

                <%--<img src="/upload/${order_goods.goods.image}"--%>
                         <%--alt="" height="25px" width="30px">--%>
                <%--订单总金额：${order_goods.torder.total}--%>
<%--</div>--%>
