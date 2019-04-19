<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>商家|登录页面</title>

      <link rel="stylesheet" type="text/css" href="/css/style.css">
      <!-- 新 Bootstrap 核心 CSS 文件 -->
      <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap core CSS -->
    <link href="/assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="/assets/css/style.css" rel="stylesheet">
    <link href="/assets/css/style-responsive.css" rel="stylesheet">

      <!-- js placed at the end of the document so the pages load faster -->
      <script src="/assets/js/jquery.js"></script>
      <script src="/assets/js/bootstrap.min.js"></script>

      <!--BACKSTRETCH-->
      <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
      <script type="text/javascript" src="/assets/js/jquery.backstretch.min.js"></script>

      <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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

	  <div id="login-page">

	  	<div class="container">
	  	
		      <form class="form-login" action="${pageContext.request.contextPath }/cgi/seller/doSellerLogin"
					method="post" enctype="multipart/form-data">
		        <h2 class="form-login-heading">商家登录页面</h2>
		        <div class="login-wrap center-pill">
		            <input type="text" class="form-control" placeholder="账号" id="username" required
                           name="username" value="${seller.username}"  autofocus>
                    <br>

		            <input type="password" class="form-control" id="password"
                           placeholder="密码" required name="password" value="${seller.password}">

                    <label class="checkbox">
		                <span class="pull-right">
		                    还没有账号？<a data-toggle="modal" href="/cgi/seller/toSellerRegisterUI">去注册</a>

		                </span>
                    </label>

                    <br>
		            <button class="btn btn-theme btn-block"  type="submit"><i class="fa fa-lock"></i> 登录</button>


                </div>

              </form>
	  	
	  	</div>
	  </div>


  <div class="clear1"></div>
  </div>


  <footer >
      <div >坚果商城 | 核桃 | 开心果 | 腰果 | 花生 | 板栗 | 杏仁 | 白果 | 瓜子 | 松子 | 夏威夷果</div>
  </footer>

  </body>
</html>


<script type="text/javascript">
    //<!CDATA[
    var bodyBgs = [];
    bodyBgs[0] = "/assets/img/1.jpg";
    bodyBgs[1] = "/assets/img/2.jpg";
    bodyBgs[2] = "/assets/img/3.jpg";
    bodyBgs[3] = "/assets/img/4.jpg";
    bodyBgs[4] = "/assets/img/5.jpg";
    bodyBgs[5] = "/assets/img/6.jpg";
    bodyBgs[6] = "/assets/img/3.jpg";
    bodyBgs[7] = "/assets/img/5.jpg";
    bodyBgs[8] = "/assets/img/3.jpg";

    var randomBgIndex = Math.round( Math.random() * 8 );

    //输出随机的背景图
    document.write('<style>body{background:url(' + bodyBgs[randomBgIndex] + ') no-repeat 10% 0}</style>');
    //]]>
</script>