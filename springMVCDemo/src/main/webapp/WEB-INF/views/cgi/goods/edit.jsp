
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
            <div class="fr">
                <c:choose>
                    <c:when test="${not empty seller}">
                        <ul>
                            <li><a href="##" target="_blank" >${sessionScope.seller.realname},欢迎您！</a></li>
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
            <div class="col-md-4 column ">
            </div>
            <div class="col-md-4 column ">
                <h3>商城
                    <small>商品信息</small>
                </h3>
                <hr>
                <form class="form-horizontal" action="/cgi/goods/doGoodsUpdate" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="name" class="col-sm-4 control-label">商品名称</label>
                        <div class="col-sm-8">
                            <%--隐藏id--%>
                            <input type="text" name="id" value="${goods.id}" hidden>
                            <input type="text" name="seller.id" value="${sessionScope.seller.id}" hidden/>
                            <input type="text" class="form-control" id="name"
                                   placeholder="请输入商品名称" name="name" value="${goods.name}"
                            >
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="stock" class="col-sm-4 control-label">商品图片</label>
                        <div class="col-sm-8">
                            <img id ="blah" src="/upload/${goods.image}" width="50px" height="50px">
                            <input type="file" name="uploadfile" id="imgInp">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="price" class="col-sm-4 control-label">价格</label>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="price"
                                   placeholder="请输入商品名称" name="price" value="${goods.price}"
                            >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sel_ca" class="col-sm-4 control-label">所属分类</label>
                        <div class="col-sm-8">
                            <select  class="form-control" id="sel_ca" name="category.id" >

                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="stock" class="col-sm-4 control-label">库存|上架数量</label>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="stock"
                                   placeholder="请输入库存|上架数量" name="stock" value="${goods.stock}"
                            >
                        </div>
                    </div>

                    <%--<div class="form-group">--%>
                        <%--<label for="state" class="col-sm-4 control-label">状态</label>--%>
                        <%--<div class="col-sm-8">--%>
                            <%--<select name="state" id="state" class="form-control">--%>
                                <%--<option value="0"--%>
                                        <%--<c:if test="${goods.state==0}">--%>
                                            <%--selected = selected--%>
                                        <%--</c:if>--%>
                                <%-->0 在售</option>--%>
                                <%--<option value="1"--%>
                                        <%--<c:if test="${goods.state==1}">--%>
                                            <%--selected = selected--%>
                                        <%--</c:if>--%>
                                <%-->1 下架</option>--%>
                                <%--<option value="2"--%>
                                        <%--<c:if test="${goods.state==2}">--%>
                                            <%--selected = selected--%>
                                        <%--</c:if>--%>
                                <%-->2 缺货</option>--%>
                            <%--</select>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <div class="form-group">
                        <div class="col-sm-offset-0 col-sm-12 btn-block">
                            <c:choose>
                                <c:when test="${empty goods.id}">
                                    <input type="submit" value="商品上架" class="btn btn-success btn-block"/>
                                </c:when>
                                <c:otherwise>
                                    <input type="submit" value="商品修改" class="btn btn-success btn-block"/>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-4 column ">
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



<script>
    $(function () {
//        jQuery找对象
        var obj_sel_ca = $("#sel_ca");
//        查找web本地存储有无存储分类数据
        var data_ca = localStorage.getItem("CategoryData");
//        如果web本地有存储，则直接显示，如果没有，就异步调用数据，显示
//        if(data_ca==null){
//            alert("null");
            get_data_ca();
            show_data_ca();
//        }else {
//            show_data_ca();
//            alert("not null");
//        }

//        显示数据
        function get_data_ca() {
            $.ajax({
                url:'/cgi/category/getData',
                type:'GET',
                dataType:'JSON',
                success:function (response,status,xhr) {
//                    将返回的数据存储到本地web存储
                localStorage.setItem("CategoryData",JSON.stringify(response));
                },
                error:function () {
                    alert("error");
                }
            });
        }

//        异步调用数据
        function show_data_ca() {
//            得到web本地存储的key
            data_ca = localStorage.getItem("CategoryData");
//            将JSON串转化为json对象
            var obj_data_ca = JSON.parse(data_ca);
            var da = obj_data_ca.data;
            for (var i=0;i<da.length;i++){
                obj_sel_ca.append("<option value='"+da[i].id+"'>"+da[i].text+"</option>");
            }
        }
    });//end of jquery



</script>


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





























<%--<h3>分类添加或者修改</h3>--%>
<%--<form action="/cgi/goods/update">--%>
    <%--<p hidden><input type="text" name="id" value="${goods.id}"> </p>--%>
    <%--<p> name：<input type="text" name="name" value="${goods.name}" required></p>--%>
    <%--<p> sellerID：<input type="text" name="sellerID" value="${goods.seller.id}" required></p>--%>
    <%--<p> categoryID：<input type="text" name="categoryID" value="${goods.category.id}" required></p>--%>
    <%--<p><input type="submit" value="提交"></p>--%>
<%--</form>--%>