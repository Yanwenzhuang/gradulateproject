<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/9/27
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title>商城|购物车|查看页面</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h4>我的购物车</h4>

<h4>
    <a href="/cgi/shopcar/goodsDisplay"  class="label label-success label-lg">继续选购商品</a>
    <a href="/cgi/shopcar/deleteAllGoods"  class="label label-success label-lg">清空购物车</a>
</h4>
<%--数据表格展示区--%>
<div class="table-responsive">
    <table class="table table-hover" border="1" id="goodsTable">

        <thead>
        <tr>
            <td>商品名称</td>
            <td>商品图片</td>
            <td>商品价格</td>
            <td>商品数量</td>
            <td>操作1</td>
            <td>操作2</td>
            <td>操作3</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${content}" var="shopcar_goods">

            <tr >
                <td>${shopcar_goods.goods.name}</td>
                <td><img src="/upload/${shopcar_goods.goods.image}"
                                               alt="" height="25px" width="30px"/></td>
                <td>${shopcar_goods.goods.price}</td>
                <td>${shopcar_goods.count}</td>
                <td><a href="/cgi/shopcar/addOneGoods/${shopcar_goods.id}" class="label label-success large">+</a></td>
                <td><a href="/cgi/shopcar/reduceOneGoods/${shopcar_goods.id}" class="label label-success large">-</a></td>
                <td><a href="/cgi/shopcar/deleteGoods/${shopcar_goods.id}" class="label label-danger large">删除</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <h3>
        <a href="#" class="label label-warning large">总金额：${total}</a>
        <a href="/cgi/shopcar/toOrderUI" class="label label-warning large">下单</a>
    </h3>




</div>


</body>
</html>
