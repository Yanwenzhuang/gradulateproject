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
                </c:choose>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</header>
<!--end header -->

<%--数据表格展示区--%>
<div class="jieshao mt20 w">
    <br>
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
            <tr>
                <td>订单ID</td>
                <td>下单时间</td>
                <td>下单客户</td>
                <td>收货人</td>
                <td>联系方式</td>
                <td>收货地址</td>
                <td>商品名称</td>
                <td>商品图片</td>
                <td>商品价格</td>
                <td>商品数量</td>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${content}" var="order_goods">
                <tr>
                    <td>${order_goods.torder.id}</td>
                    <td>${order_goods.torder.orderTime}</td>
                    <td>${order_goods.torder.customer.realname}</td>
                    <td>${order_goods.torder.receiver}</td>
                    <td>${order_goods.torder.phone}</td>
                    <td>${order_goods.torder.address}</td>
                    <td>${order_goods.goods.name}</td>
                    <td><img src="/upload/${order_goods.goods.image}"
                             alt="" height="25px" width="30px">
                    </td>
                    <td>${order_goods.goods.price}</td>
                    <td>${order_goods.count}</td>
                        <%--订单总金额：${order_goods.torder.total}--%>
                </tr>

            </c:forEach>
            </tbody>
        </table>
    </div>
</div>



<div class="clear"></div>






<footer class="mt20 center">
    <div class="mt20">坚果商城 | 核桃 | 开心果 | 腰果 | 花生 | 板栗 | 杏仁 | 白果 | 瓜子 | 松子 | 夏威夷果</div>
</footer>





</body>
</html>


<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#blah').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#imgInp").change(function(){
        readURL(this);
    });
</script>





















<%--action="/cgi/seller/doSellerRegister"--%>
<script>

//    实现用户名不重复功能
    var $input = $("#username");
    var $msg = $("#msg");
    $input.blur(function (event) {
//        alert("ok");
        $.ajax({
            url:'/cgi/seller/isExist',
            type:'GET',
            data:{'username':$input.val()},
            dataType:'JSON',
            success:function (response,status,xhr) {
//                alert("success");
                if(response.flag==1){
                    $msg.html("已经占用").css("color","red");
                    $input.focus();
                }else {
                    $msg.html("可以注册").css("color","blue");
                }
            },
            error:function () {
                alert("error");
            }
        });
    });


//    实现密码与确认密码的内容一致
    var $password = $("#password");
    var $repassword = $("#repassword");
    $repassword.blur(function (event) {
        if($password.val() != $repassword.val()){
            alert("密码不一致，请重新输入");
            $password.focus();
        }
    });


//    进行注册，注册成功之后实现跳转
//$("#btnLogin").click(function(event) {
//    $.ajax({
//        url:'/cgi/seller/doSellerRegister',
//        type:'GET',
//        data:$("form").serialize(),
//        dataType:'JSON',
//        success:function (response,status,xhr) {
////                alert("abcdefg");
//            switch (response.emg){
//                case 1: window.location.href="/cgi/seller/toSellerLoginUI";
//                    break;
//                case 0:window.location.href="/cgi/seller/toSellerRegisterUI";
//                    break;
//            }
//        },
//        error:function () {
//            alert("registerError");
//        }
//    });
//});//end of jquery



</script>