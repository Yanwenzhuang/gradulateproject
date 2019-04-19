
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/14/014
  Time: 18:32
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
    <link rel="stylesheet" type="text/css" href="/css/css/style.css">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
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
            <%--用户登录状态，直接去购物车，用户未登录，先登录再去购物车--%>
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


<!-- start banner_x -->
<div class="banner_x center">
    <a href="./index.html" target="_blank"><div class="logo fl"></div></a>

    <div class="wdgwc fl ml40">我的购物车</div>
    <div class="wxts fl ml20">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</div>

    <div class="clear"></div>
</div>
<div class="xiantiao"></div>
<div class="gwcxqbj">
    <div class="gwcxd center">
        <div class="top2 center">
            <div class="sub_top fl">
                <%--<input type="checkbox" value="quanxuan" class="quanxuan" />全选--%>
                <%--选项--%>
            </div>
            <div class="sub_top fl">商品名称</div>
            <div class="sub_top fl">单价</div>
            <div class="sub_top fl">数量</div>
            <div class="sub_top fl">操作</div>
            <div class="sub_top f1">商品图片</div>
            <div class="clear"></div>
        </div>

        <c:forEach items="${content}" var="shopcar_goods">
        <div class="content2 center">
            <div class="sub_content fl ">
                <%--<input type="checkbox" value="quanxuan" class="quanxuan" />--%>
                <%--商品--%>
            </div>
            <div class="sub_content fl"><img src="/upload/${shopcar_goods.goods.image}"
                                             alt=""/></div>
            <div class="sub_content fl ft20">${shopcar_goods.goods.name}</div>
            <div class="sub_content fl ">${shopcar_goods.goods.price}元</div>
            <div class="sub_content fl">
                <a href="/cgi/shopcar/reduceOneGoods/${shopcar_goods.id}">-</a>
            </div>
            <div class="sub_content fl">
                    ${shopcar_goods.count}
            </div>
            <div class="sub_content fl">
                <a href="/cgi/shopcar/addOneGoods/${shopcar_goods.id}">+</a>
            </div>
            <div class="sub_content fl" style="font-size: 28px;">
                <a href="/cgi/shopcar/deleteGoods/${shopcar_goods.id}">×</a>
            </div>
            <div class="clear"></div>
        </div>
        </c:forEach>

    </div>




    <div class="jiesuandan mt20 center">
        <div class="tishi fl ml20">
            <ul>
                <li><a href="/cgi/shopcar/goodsDisplay">继续购物</a></li>
                <li>|</li>
                <li><a href="/cgi/shopcar/deleteAllGoods">清空购物车</a></li>
                <div class="clear"></div>
            </ul>
        </div>
        <div class="jiesuan fr">
            <div class="jiesuanjiage fl">合计（不含运费）：<span>${total}元</span></div>
            <div class="jsanniu fr">
                <a href="/cgi/shopcar/toOrderUI">
                <input class="jsan" type="submit" name="jiesuan"  value="去下单"/>
                </a>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>

</div>
<div class="clear"></div>








<footer class="mt20 center">
    <div class="mt20">坚果商城 | 核桃 | 开心果 | 腰果 | 花生 | 板栗 | 杏仁 | 白果 | 瓜子 | 松子 | 夏威夷果</div>
</footer>





</body>
</html>