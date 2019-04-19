<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/19/019
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>商品浏览界面</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<c:choose>
    <c:when test="${not empty customer}">
        <a href="${pageContext.request.contextPath }/cgi/customer/logout">退出登录</a><br>
        ${sessionScope.customer.realname},欢迎您！

        <h4>
            <a href="/cgi/customer/customerManage" class="label label-primary label-lg">修改个人信息</a>
            <a href="/cgi/shopcar/toShopcarUI"  class="label label-warning label-lg">购物车</a>
        </h4>
        <%--<a href="/cgi/torder/CustomerOrder">查看全部订单</a> <br>--%>



    </c:when>
    <c:otherwise>
        <a href="/cgi/customer/toCustomerLoginUI">未登录</a>
    </c:otherwise>
</c:choose>


<%--数据表格展示区--%>
<div class="table-responsive">
    <table class="table table-hover" border="1">

        <thead>
            <tr>
                <td>商品ID</td>
                <td>商品名称</td>
                <td>商品图片</td>
                <td>上架日期</td>
                <td>商品价格</td>
                <td>商品店铺</td>
                <td>所属分类</td>
                <td>商品库存</td>
                <td>商品状态</td>
                <td>操作</td>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${content}" var="goods">
                <tr>
                <td>${goods.id}</td>
                <td>${goods.name}</td>
                <td><img src="/upload/${goods.image}"
                alt="" height="25px" width="30px"/> </td>
                <td>${goods.indate}</td>
                <td>${goods.price}</td>
                <td>${goods.seller.shopname}</td>
                <td>${goods.category.text}</td>
                <td>${goods.stock}</td>
                <td>
             <c:choose>
                <c:when test="${goods.state==0}">
                    <span style="color: blue">在售</span>
                </c:when>
                <c:when test="${goods.state==1}">
                    <span style="color: green;font-weight: bold">下架</span>
                </c:when>
                <c:when test="${goods.state==2}">
                    <span style="color: red;font-weight: bold">缺货</span>
                </c:when>
             </c:choose>
                </td>


                <td>
                    <c:choose>
                        <c:when test="${goods.state==0}">
                            <a href="/cgi/goods/toOneGoodsUI/${goods.id}"
                               class="label label-danger large">查看</a>
                        </c:when>
                        <c:when test="${goods.state==1}">
                            <a href="#"
                               class="label label-danger large">不能查看</a>
                        </c:when>
                        <c:when test="${goods.state==2}">
                            <a href="#"
                               class="label label-danger large">不能查看</a>
                        </c:when>
                    </c:choose>

                </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</div>


</body>
</html>














