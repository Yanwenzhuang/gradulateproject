<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/19/019
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    </c:when>
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

        <c:choose>
            <c:when test="${ empty manager}">
                <td>操作1</td>
                <td>操作2</td>
            </c:when>
        </c:choose>

            </tr>
        </thead>
        <tbody>
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

        <c:choose>
             <c:when test="${ empty manager}">
                  <td><a href="/cgi/goods/toGoodsBuyUI/${goods.id}"
                               class="label label-danger large">立即购买</a> </td>
                  <td><a href="/cgi/goods/toAddOnShopcarUI/${goods.id}"
                               class="label label-danger large">加入购物车</a> </td>
             </c:when>
        </c:choose>



            </tr>
        </tbody>
    </table>
</div>

</body>
</html>














