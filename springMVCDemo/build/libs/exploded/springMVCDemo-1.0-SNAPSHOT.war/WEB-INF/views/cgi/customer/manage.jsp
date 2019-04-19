<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://www.springframework.org/tags/form" %>


<html>
<head>
    <title>商城|后台管理|顾客</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>


<br>

<hr>

<%--数据表格展示区--%>
<div class="table-responsive">
    <table class="table table-hover" border="1">

        <thead>
        <tr>
            <td>顾客ID</td>
            <td>顾客姓名</td>
            <td>顾客用户名</td>
            <td>顾客密码</td>
            <td>顾客地址</td>
            <td>顾客性别</td>
            <td>注册日期</td>
            <td>电子邮件</td>
            <td>联系方式</td>
            <td>身份证号码</td>
            <td>操作</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${content}" var="customer">
            <tr>
                <td>${customer.id}</td>
                <td>${customer.realname}</td>
                <td>${customer.username}</td>
                <td>${customer.password}</td>
                <td>${customer.address}</td>
                <td>
                    <c:choose>
                        <c:when test="${customer.gender==1}">
                            <span>男</span>
                        </c:when>
                        <c:when test="${customer.gender==0}">
                            <span>女</span>
                        </c:when>
                    </c:choose>
                </td>
                <td>${customer.regDate}</td>
                <td>${customer.email}</td>
                <td>${customer.phone}</td>
                <td>${customer.IDcard}</td>
                <td><a href="/cgi/customer/toSellerEditUI/${customer.id}"
                       class="label label-danger large">修改</a> </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
