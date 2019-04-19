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
  <link rel="stylesheet" type="text/css" href="/css/style.css">
  <%--<style>--%>
    <%--.torder a:hover{--%>
      <%--text-decoration: none;--%>
    <%--}--%>
  <%--</style>--%>

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
        <c:when test="${not empty seller}">

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
          <c:when test="${not empty seller}">
            <ul>
              <li><a href="##" target="_blank" >${sessionScope.seller.realname},欢迎您！</a></li>
              <li>|</li>
              <li><a href="/cgi/seller/toSellerRegisterUI" target="_blank" >修改个人信息</a></li>
              <li>|</li>
              <li><a href="${pageContext.request.contextPath }/cgi/seller/logout" target="_blank">退出登录</a></li>
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
  <a href=""><div class="ad_top fl"></div></a>
  <div class="nav fl">
    <ul>
      <li><a href="">坚果食品</a></li>
      <li><a href="">核桃</a></li>
      <li><a href="">开心果</a></li>
      <li><a href="">腰果</a></li>
      <li><a href="">花生</a></li>
      <li><a href="">板栗</a></li>
      <li><a href="">杏仁</a></li>
      <li><a href="">白果</a></li>
      <li><a href="">瓜子</a></li>
      <li><a href="">松子</a></li>
    </ul>
  </div>
</div>

<!-- end banner_x -->

<div class="jieshao mt20 w">
  <div class="left fl"><img src="/upload/${goods.image}" width="445px" height="445px" alt="" /></div>
  <div class="right fr">
    <div class="h3 ml20 mt20">${goods.name}</div>
    <div class="jiage ml20 mt10">￥ ${goods.price} 元</div>
    <c:choose>
    <c:when test="${not empty seller}">
      <div class="ft20 ml20 mt20">商品ID :  ${goods.id}</div>
    </c:when>
    </c:choose>
    <div class="ft20 ml20 mt20">商品上架日期 :  ${goods.indate}</div>
    <div class="ft20 ml20 mt20">商品分类 :  ${goods.category.text}</div>
    <div class="ft20 ml20 mt20">商品库存 :  ${goods.stock}</div>

    <c:choose>
      <c:when test="${not empty seller}">
        <div class="torder ml20 mt20">
          <a href="/cgi/goods/toGoodsEditUI/${goods.id}">
            <input class="jrgwc" type="button" name="jrgwc" value="修改" />
          </a>
        </div>
      </c:when>
      <c:otherwise>

        <%--<div class="ft20 ml20 mt20">选择数量：--%>
          <%--<input type="number" id="count" value="count" placeholder="1"--%>
                 <%--name="count" required style="width: 10%;text-indent:10px" min="1" max=${goods.stock}>--%>
        <%--</div>--%>

        <div class="ft20 ml20 mt20">商品店铺名 :  <a href="/cgi/goods/cusotmerInShop/${goods.seller.shopname}">${goods.seller.shopname}</a></div>

        <div class="torder ml20 mt20">
            <a href="/cgi/goods/toGoodsBuyUI/${goods.id}">
              <input class="jrgwc" type="button" name="jrgwc" value="立即购买" />
            </a>
        </div>

        <div class="torder m240 mt40">
          <a href="/cgi/goods/toAddOnShopcarUI/${goods.id}">
            <input class="jrgwc" type="button" name="jrgwc" value="加入购物车" />
          </a>
        </div>


      </c:otherwise>
    </c:choose>


  </div>
  <div class="clear"></div>
</div>



<footer class="mt20 center">
  <div class="mt20">坚果商城 | 核桃 | 开心果 | 腰果 | 花生 | 板栗 | 杏仁 | 白果 | 瓜子 | 松子 | 夏威夷果</div>
</footer>


</body>
</html>