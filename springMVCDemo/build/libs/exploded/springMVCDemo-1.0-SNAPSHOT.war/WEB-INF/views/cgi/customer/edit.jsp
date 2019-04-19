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
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-4 column">
            </div>
            <div class="col-md-4 column">
                <h3>商城
                    <small>客户信息</small>
                </h3>
                <hr>
                <form  class="form-horizontal" role="form"  method="post"
                       action="/cgi/customer/doCustomerEdit" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="realname" class="col-sm-4 control-label">姓名</label>
                        <div class="col-sm-8">
                            <input type="hidden" class="form-control" name="id"
                                   value="${customer.id}" />
                            <input type="text" class="form-control" id="realname"
                                   name="realname" value="${customer.realname}"
                                   placeholder="请输入您的名字">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="username" class="col-sm-4 control-label">用户名</label>
                        <c:choose>
                            <c:when test="${empty customer.id}">
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="username"
                                           name="username" value="${customer.username}"
                                           placeholder="请输入用户名" required>
                                </div>
                            </c:when>
                            <%--账号一旦注册就不能修改--%>
                            <c:otherwise>
                                <div class="col-sm-8">
                                    <span>${customer.username}</span>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <c:choose>
                        <c:when test="${empty customer.id}">
                            <div class="form-group">
                                <label for="password" class="col-sm-4 control-label">密码</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="password"
                                           name="password" value="${customer.password}"
                                           placeholder="请输入密码" required>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <%--<div class="form-group">--%>
                                <%--<label for="repassword" class="col-sm-4 control-label">确认密码</label>--%>
                                <%--<div class="col-sm-8">--%>
                                    <%--<input type="text" name="password" value="${customer.password}"--%>
                                           <%--id="repassword"   hidden>--%>
                                    <%--<button class="btn btn-default btn-primary">重置密码</button>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        </c:otherwise>
                    </c:choose>

                    <div class="form-group">
                        <label for="address" class="col-sm-4 control-label">地址</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="address"
                                   name="address" value="${customer.address}"
                                   placeholder="请输入您的地址" required>
                        </div>
                    </div>

                    <%--<div class="form-group">--%>
                        <%--<label for="gender1" for="gender2" class="col-sm-4 control-label">性别</label>--%>
                            <%--<input class="marginLeft1" type="radio"  id="gender1"--%>
                                   <%--name="gender" value="1" checked>  男 </input>--%>
                            <%--<input class="marginLeft2" type="radio" id="gender2"--%>
                                   <%--name="gender" value="0" > 女 </input>--%>
                    <%--</div>--%>


                    <div class="form-group">
                        <label for="email" class="col-sm-4 control-label">邮件</label>
                        <div class="col-sm-8">
                            <input type="email" class="form-control" id="email"
                                   name="email" value="${customer.email}"
                                   placeholder="请输入您的邮件" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="phone" class="col-sm-4 control-label">联系方式</label>
                        <div class="col-sm-8">
                            <input type="tel" class="form-control" id="phone"
                                   name="phone" value="${customer.phone}"
                                   placeholder="请输入您的联系方式" required minlength="11" maxlength="11">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="IDcard" class="col-sm-4 control-label">身份证号码</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="IDcard"
                                   name="IDcard" value="${customer.IDcard}"
                                   placeholder="请输入您的身份证号码" required minlength="18" maxlength="18">
                        </div>
                    </div>

                    <div class="form-group">
                        <c:choose>
                            <c:when test="${empty customer.id}">
                                <div class="col-sm-offset-0 col-sm-12 btn-block">
                                    <input type="submit" value="注册" class="btn btn-success btn-block"/>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="col-sm-offset-0 col-sm-12 btn-block">
                                    <input type="submit" value="修改" class="btn btn-success btn-block"/>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </form>
            </div>
            <div class="col-md-4 column">
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


