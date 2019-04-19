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
  <!-- 新 Bootstrap 核心 CSS 文件 -->
  <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<!-- start header -->
<header>
  <div class="top center">
    <div class="left fl">
      <ul>
        <li><a href="#" target="_blank">坚果商城</a></li>
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
        <li><a href="">夏威夷果</a></li>
        <li>|</li>
        <li><a href="">问题反馈</a></li>
      </ul>
    </div>
    <div class="right fr">
      <c:choose>
        <c:when test="${not empty seller}">
          <div class="gouwuche fr"><a href="/cgi/goods/toGoodsEditUI">上架新商品</a></div>
        </c:when>
        <c:when test="${not empty customer}">
          <div class="gouwuche fr"><a href="/cgi/shopcar/toShopcarUI">购物车</a></div>
        </c:when>
        <c:otherwise>
          <div class="gouwuche fr"><a href="/cgi/customer/toCustomerLoginUI">购物车</a></div>
        </c:otherwise>
      </c:choose>

      <div class="fr">

        <c:choose>
          <c:when test="${not empty seller}">
            <ul>
              <li><a href="##" target="_blank" >${sessionScope.seller.realname},欢迎您！</a></li>
              <li>|</li>
              <li><a href="/cgi/seller/toCustomerOrderUI" target="_blank" >查看顾客订单</a></li>
              <li>|</li>
              <li><a href="/cgi/seller/toSellerRegisterUI" target="_blank" >修改个人信息</a></li>
              <li>|</li>
              <li><a href="${pageContext.request.contextPath }/cgi/seller/logout" target="_blank">退出登录</a></li>
            </ul>
          </c:when>
          <c:when test="${not empty customer}">
            <ul>
              <li><a href="##" target="_blank" >${sessionScope.customer.realname},欢迎您！</a></li>
              <li>|</li>
              <li><a href="/cgi/customer/toCustomerOrderUI" target="_blank" >查看顾客订单</a></li>
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
              <li>|</li>
              <li><a href="/cgi/seller/toSellerLoginUI" target="_blank" >商家</a></li>
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
      <c:choose>
        <c:when test="${empty seller}">
          <li><a href="/cgi/goods/goodsDisplayUI"><span class="ft2">坚果商城</span></a></li>
        </c:when>
        <c:otherwise>
          <li><a href="/cgi/goods/manage" target="_blank"><span class="ft2">${sessionScope.seller.shopname}</span></a></li>
        </c:otherwise>
      </c:choose>
      <li><a href="/cgi/goods/findGoodsByCategoryText/核桃">核桃</a></li>
      <li><a href="/cgi/goods/findGoodsByCategoryText/开心果">开心果</a></li>
      <li><a href="/cgi/goods/findGoodsByCategoryText/腰果">腰果</a></li>
      <li><a href="/cgi/goods/findGoodsByCategoryText/花生">花生</a></li>
      <li><a href="/cgi/goods/findGoodsByCategoryText/板栗">板栗</a></li>
      <li><a href="/cgi/goods/findGoodsByCategoryText/杏仁">杏仁</a></li>
      <li><a href="/cgi/goods/findGoodsByCategoryText/白果">白果</a></li>
      <li><a href="/cgi/goods/findGoodsByCategoryText/瓜子">瓜子</a></li>
      <li><a href="/cgi/goods/findGoodsByCategoryText/松子">松子</a></li>
      <%--<li><a href="">夏威夷果</a></li>--%>
    </ul>
  </div>
  <div class="search fr">
    <form action="/cgi/goods/goodsDisplayUI" method="post">

        <input type="text" class="text fl form-control" name="name" value="${goods.name}" placeholder="巴旦木仁&nbsp;杏仁">

      <div class="submit fl">
        <input type="submit" class="sousuo" value="搜索"/>
      </div>
      <div class="clear"></div>
    </form>
    <div class="clear"></div>
  </div>
</div>

<!-- end banner_x -->



<%--商品展示区--%>
<div class="jieshao mt20 w">
<div class="danpin center">
<div class="biaoti center">坚果商城</div>


  <div class="main center">
    <c:forEach items="${content}" var="goods">
        <div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
            <div class="sub_mingxing">
               <a href="/cgi/goods/toOneGoodsUI/${goods.id}" target="_blank">
               <img src="/upload/${goods.image}" alt=""/>
               </a>
            </div>
            <div class="pinpai">
                <a href="/cgi/goods/toOneGoodsUI/${goods.id}" target="_blank">${goods.name}
                </a>
            </div>
            <div class="youhui">库存量：${goods.stock}</div>
            <div class="jiage">￥${goods.price}元</div>
        </div>
    </c:forEach>
  </div>

  <div class="clear"></div>




  <!-- 分页功能 start -->
  <div align="center" class="page">
    <span>${page.pageNow}</span>
    <span>/</span>
    <span>${page.totalPageCount}页</span>
    <a href="/cgi/goods/findGoodsByCategoryText/${text}?pageNow=1" >首页</a>
    <c:choose>
      <c:when test="${page.pageNow - 1 > 0}">
        <a href="/cgi/goods/findGoodsByCategoryText/${text}?pageNow=${page.pageNow - 1}">上一页</a>
      </c:when>
      <c:when test="${page.pageNow - 1 <= 0}">
        <a href="/cgi/goods/findGoodsByCategoryText/${text}?pageNow=1" >上一页</a>
      </c:when>
    </c:choose>
    <c:choose>
      <c:when test="${page.totalPageCount==0}">
        <a href="/cgi/goods/findGoodsByCategoryText/${text}?pageNow=${page.pageNow}">下一页</a>
      </c:when>
      <c:when test="${page.pageNow + 1 < page.totalPageCount}">
        <a href="/cgi/goods/findGoodsByCategoryText/${text}?pageNow=${page.pageNow + 1}">下一页</a>
      </c:when>
      <c:when test="${page.pageNow + 1 >= page.totalPageCount}">
        <a href="/cgi/goods/findGoodsByCategoryText/${text}?pageNow=${page.totalPageCount}">下一页</a>
      </c:when>
    </c:choose>
    <c:choose>
      <c:when test="${page.totalPageCount==0}">
        <a href="/cgi/goods/findGoodsByCategoryText/${text}?pageNow=${page.pageNow}" >   尾页</a>
      </c:when>
      <c:otherwise>
        <a href="/cgi/goods/findGoodsByCategoryText/${text}?pageNow=${page.totalPageCount}">尾页 </a>
      </c:otherwise>
    </c:choose>
  </div>


</div>
</div>

<div class="clear"></div>





<footer class="mt20 center">
  <div class="mt20">坚果商城 | 核桃 | 开心果 | 腰果 | 花生 | 板栗 | 杏仁 | 白果 | 瓜子 | 松子 | 夏威夷果</div>
</footer>





</body>
</html>


<script>

  $('.pagination li').on('click',function () {
     $('.pagination li').removeClass('active');
      $(this).addClass('active');
  });
</script>