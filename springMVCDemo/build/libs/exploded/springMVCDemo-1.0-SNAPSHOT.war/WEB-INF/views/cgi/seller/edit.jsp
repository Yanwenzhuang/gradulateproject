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

<div class="jieshao mt20 w">
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-4 column">
            </div>
            <div class="col-md-4 column">
                <c:choose>
                    <c:when test="${empty seller.id}">
                        <h3>商城
                            <small>商家注册信息</small>
                        </h3>
                    </c:when>
                    <c:otherwise>
                        <h3>商城
                            <small>商家修改信息</small>
                        </h3>
                    </c:otherwise>
                </c:choose>

                <hr>
                <form class="form-horizontal" role="form"  method="post" action="/cgi/seller/doSellerEdit"
                      enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="realname" class="col-sm-4 control-label">商家名称</label>
                        <div class="col-sm-8">
                            <%--隐藏id--%>
                            <input type="text" name="id" value="${seller.id}" hidden>
                            <input type="text" class="form-control" id="realname"
                                   placeholder="请输入商家名" name="realname" value="${seller.realname}"
                            >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="username" class="col-sm-4 control-label">用户名</label>
                        <c:choose>
                            <c:when test="${empty seller.id}">
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="username"
                                           name="username" value="${seller.username}" placeholder="请输入用户名">
                                    <span id="msg"/>
                                </div>
                            </c:when>
                            <%--账号一旦注册，就不能更改--%>
                            <c:otherwise>
                                <div class="col-sm-8">
                                    <input type="text" name="username" value="${seller.username}" hidden>
                                    <span >${seller.username}</span>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>


                    <c:choose>
                        <c:when test="${empty seller.id}">
                            <div class="form-group">
                                <label for="password" class="col-sm-4 control-label">密码</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="password"
                                           name="password" placeholder="请输入密码"
                                           required value="${seller.password}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="repassword" class="col-sm-4 control-label">确认密码</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="repassword"
                                           name="repassword" placeholder="请再次输入密码"
                                           required value="${seller.password}">
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <%--<div class="form-group">--%>
                                <%--<label for="repassword" class="col-sm-4 control-label">确认密码</label>--%>
                                <%--<div class="col-sm-8">--%>
                                    <%--<input type="text" name="password" value="${seller.password}" hidden>--%>
                                    <%--<button class="btn btn-default btn-primary">重置密码</button>--%>
                                <%--</div>--%>
                            <%--</div>--%>

                            <%--<div class="form-group">--%>
                                <%--<label for="repassword" class="col-sm-4 control-label">用户密码</label>--%>
                                <%--<div class="col-sm-8">--%>
                                    <%--<input type="text" class="form-control" id="repassword"--%>
                                           <%--name="repassword" value="${seller.password}"--%>
                                           <%--placeholder="请输入密码">--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        </c:otherwise>
                    </c:choose>



                    <div class="form-group">
                        <label for="shopname" class="col-sm-4 control-label">店铺名</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="shopname"
                                   name="shopname" value="${seller.shopname}"
                                   placeholder="请输入店铺名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address" class="col-sm-4 control-label">联系地址</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="address"
                                   name="address" value="${seller.address}"
                                   placeholder="请输入联系地址">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-4 control-label">电子邮箱</label>
                        <div class="col-sm-8">
                            <input type="email" class="form-control" id="email"
                                   name="email" value="${seller.email}"
                                   placeholder="请输入电子邮箱">
                        </div>
                    </div>
                    <%--<div class="form-group">--%>
                        <%--<label for="url" class="col-sm-4 control-label">网址</label>--%>
                        <%--<div class="col-sm-8">--%>
                            <%--<input type="url" class="form-control" id="url"--%>
                                   <%--name="url" value="${seller.url}"--%>
                                   <%--placeholder="请输入网址">--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <div class="form-group">
                        <label for="phone" class="col-sm-4 control-label">联系电话</label>
                        <div class="col-sm-8">
                            <input type="tel" class="form-control" id="phone"
                                   name="phone" value="${seller.phone}" required
                                   placeholder="请输入联系电话" maxlength="11">
                        </div>
                    </div>
                    <%--<div class="form-group">--%>
                        <%--<label class="col-sm-4 control-label">LOGO</label>--%>
                        <%--<div class="col-sm-8">--%>
                            <%--<img id="blah" src="/upload/${seller.logo}" width="50px" height="50px"/>--%>
                            <%--<input type="file" name="uploadfile" id="imgInp"--%>
                                   <%--multiple="multiple"/>--%>
                        <%--</div>--%>


                    <%--</div>--%>

                    <c:choose>
                        <c:when test="${empty seller.id}">
                            <div class="form-group">
                                <div class="col-sm-offset-0 col-sm-12 btn-block">
                                    <input type="submit" id="btnLogin" value="注册" class="btn btn-success btn-block"/>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="form-group">
                                <div class="col-sm-offset-0 col-sm-12 btn-block">
                                    <input type="submit" id="btnLogin1" value="修改" class="btn btn-success btn-block"/>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>


                </form>
            </div>
            <div class="col-md-4 column">
            </div>
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