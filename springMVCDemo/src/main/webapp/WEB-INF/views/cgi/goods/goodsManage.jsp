<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>DASHGUM - FREE Bootstrap Admin Template</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="/assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="/assets/lineicons/style.css">
    
    <!-- Custom styles for this template -->
    <link href="/assets/css/style.css" rel="stylesheet">
    <link href="/assets/css/style-responsive.css" rel="stylesheet">

    <script src="/assets/js/chart-master/Chart.js"></script>
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

  <section id="container" >

      <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="#" class="logo"><b>管理员页面</b></a>

          <div class="nav notify-row" id="top_menu">
              <!--  notification start -->
              <ul class="nav top-menu">
                  <!-- settings start -->
                  <li class="dropdown">
                      <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                          <i class="fa fa-tasks"></i>
                      </a>

                      <%--<a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">--%>
                          <%--<i class="fa fa-envelope-o"></i>--%>


                      <%--</a>--%>
              </ul>
          </div>

          <div class="top-menu">
              <ul class="nav pull-right top-menu">
                  <li><a class="logout" href="${pageContext.request.contextPath }/cgi/manager/logout">退出登录</a></li>
              </ul>
          </div>

      </header>
      <!--header end-->


      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><a href="#"><img src="/assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
              	  <h5 class="centered">Administrators</h5>

                  <li class="sub-menu">
                      <a  href="/cgi/category/manage">
                          <i class="fa fa-book"></i>
                          <span>分类管理</span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-book"></i>
                          <span>用户管理</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="/cgi/seller/sellerManage">商家管理</a></li>
                          <li><a  href="/cgi/customer/customerManage">顾客管理</a></li>
                      </ul>
                  </li>

                  <li class="sub-menu">
                      <a class="active" href="/cgi/goods/goodsManage">
                          <i class="fa fa-book"></i>
                          <span>商品管理</span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a  href="/cgi/shopcar/manage">
                          <i class="fa fa-book"></i>
                          <span>购物车管理</span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a  href="/cgi/torder/manage">
                          <i class="fa fa-book"></i>
                          <span>订单管理</span>
                      </a>
                  </li>


              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>

      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">

              <html>
              <head>
                  <title>商城|后台管理|商品管理页</title>
                  <!-- 新 Bootstrap 核心 CSS 文件 -->
                  <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
                  <script src="/js/jquery-3.3.1.min.js"></script>
              </head>
              <body>



              <%--<div class="table-responsive">--%>


                  <%--<br>--%>
                  <%--<label>分类：</label>--%>
                  <%--<select id="sel_ca" onchange="byCategory(this.value)">--%>
                  <%--</select>--%>

                  <%--<label>商家：</label>--%>
                  <%--<select id="sel_se" onchange="bySeller(this.value)">--%>
                  <%--</select>--%>

              <%--</div>--%>
              <%--<br>--%>
              <h5>${sessionScope.manager.realname}管理员，您好！</h5>


              <h3></h3>
              <%--<input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />--%>

              <%--数据表格展示区--%>
              <div class="table-responsive">
                  <table class="table table-hover"  id="goodsTable">

                      <thead>
                      <tr id="firstTr">
                          <td>商品ID</td>
                          <td>商品名称</td>
                          <td>商品图片</td>
                          <td>商品价格</td>
                          <td>商品店铺</td>
                          <td>所属分类</td>
                          <td>商品库存</td>
                          <%--<td>商品状态</td>--%>
                          <td>操作</td>
                      </tr>
                      </thead>
                      <tbody>
                      <c:forEach items="${content.data}" var="goods">

                          <tr >
                              <td id="goodsID">${goods.id}</td>
                              <td id="goodsName">${goods.name}</td>
                              <td><img src="/upload/${goods.image}"
                                       alt="" height="25px" width="30px"/> </td>
                              <td>${goods.price}</td>
                              <td>${goods.seller.shopname}</td>
                              <td>${goods.category.text}</td>
                              <td>${goods.stock}</td>
                              <%--<td>--%>
                                  <%--<c:choose>--%>
                                      <%--<c:when test="${goods.state==0}">--%>
                                          <%--<span style="color: blue">在售</span>--%>
                                      <%--</c:when>--%>
                                      <%--<c:when test="${goods.state==1}">--%>
                                          <%--<span style="color: green;font-weight: bold">下架</span>--%>
                                      <%--</c:when>--%>
                                      <%--<c:when test="${goods.state==2}">--%>
                                          <%--<span style="color: red;font-weight: bold">缺货</span>--%>
                                      <%--</c:when>--%>
                                  <%--</c:choose>--%>
                              <%--</td>--%>
                              <%--<td><a href="/cgi/goods/toGoodsDeleteUI/${goods.id}"--%>
                                     <%--class="label label-danger large">删除</a></td>--%>

                              <td>
                                  <button type="button" class="btn btn-warning large" data-toggle="modal" data-target="#myThirdModal" onclick="deleteitem(this)">
                                  删除
                                  </button>

                                  <!-- Modal -->
                                  <div class="modal fade" id="myThirdModal" tabindex="-1" role="dialog" aria-labelledby="myThirdLabel">
                                      <div class="modal-dialog" role="document">
                                          <form class="form-horizontal" action="/cgi/goods/delete" method="post" enctype="multipart/form-data">
                                              <div class="modal-content">
                                                  <div class="modal-header">
                                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                      <h4 class="modal-title" id="myThirdLabel">是否删除商品信息</h4>
                                                  </div>
                                                  <div class="modal-body">

                                                      <div class="form-group">
                                                          <label class="col-sm-4 control-label">商品名称</label>
                                                          <div class="col-sm-8">
                                                                  <%--隐藏id--%>
                                                              <input type="text" name="id" id="deleteID" value="${goods.id}" hidden>
                                                              <input type="text" class="form-control" id="deleteText"
                                                                     placeholder="请输入商品名称" name="text"
                                                                     value="${goods.name} "
                                                              >
                                                          </div>
                                                      </div>
                                                  </div>



                                                  <div class="modal-footer">
                                                      <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                                      <input type="submit" value="确定" class="btn btn-primary">
                                                  </div>
                                              </div>
                                          </form>
                                      </div>
                                  </div>

                              </td>

                          </tr>
                      </c:forEach>
                      </tbody>
                  </table>
              </div>

              <!-- 分页功能 start -->
              <div align="center" class="page1">
                  <span>${page.pageNow}</span>
                  <span>/</span>
                  <span>${page.totalPageCount}页</span>
                  <a href="/cgi/goods/goodsManage?pageNow=1" >首页</a>
                  <c:choose>
                      <c:when test="${page.pageNow - 1 > 0}">
                          <a href="/cgi/goods/goodsManage?pageNow=${page.pageNow - 1}">上一页</a>
                      </c:when>
                      <c:when test="${page.pageNow - 1 <= 0}">
                          <a href="/cgi/goods/goodsManage?pageNow=1" >上一页</a>
                      </c:when>
                  </c:choose>
                  <c:choose>
                      <c:when test="${page.totalPageCount==0}">
                          <a href="/cgi/goods/goodsManage?pageNow=${page.pageNow}">下一页</a>
                      </c:when>
                      <c:when test="${page.pageNow + 1 < page.totalPageCount}">
                          <a href="/cgi/goods/goodsManage?pageNow=${page.pageNow + 1}">下一页</a>
                      </c:when>
                      <c:when test="${page.pageNow + 1 >= page.totalPageCount}">
                          <a href="/cgi/goods/goodsManage?pageNow=${page.totalPageCount}">下一页</a>
                      </c:when>
                  </c:choose>
                  <c:choose>
                      <c:when test="${page.totalPageCount==0}">
                          <a href="/cgi/goods/goodsManage?pageNow=${page.pageNow}" >   尾页</a>
                      </c:when>
                      <c:otherwise>
                          <a href="/cgi/goods/goodsManage?pageNow=${page.totalPageCount}">尾页 </a>
                      </c:otherwise>
                  </c:choose>
              </div>


              </body>
              </html>





          </section>
      </section>

      <!--main content end-->





  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="/assets/js/jquery.js"></script>
    <script src="/assets/js/jquery-1.8.3.min.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="/assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="/assets/js/jquery.scrollTo.min.js"></script>
    <script src="/assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="/assets/js/jquery.sparkline.js"></script>


    <!--common script for all pages-->
    <script src="/assets/js/common-scripts.js"></script>
    
    <script type="text/javascript" src="/assets/js/gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="/assets/js/gritter-conf.js"></script>

    <!--script for this page-->
    <script src="/assets/js/sparkline-chart.js"></script>
	<script src="/assets/js/zabuto_calendar.js"></script>
	

	<script type="application/javascript">
        $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
                $(this).hide();
            });
        
            $("#my-calendar").zabuto_calendar({
                action: function () {
                    return myDateFunction(this.id, false);
                },
                action_nav: function () {
                    return myNavFunction(this.id);
                },
                ajax: {
                    url: "show_data.php?action=1",
                    modal: true
                },
                legend: [
                    {type: "text", label: "Special event", badge: "00"},
                    {type: "block", label: "Regular event", }
                ]
            });
        });
        
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
    </script>

    <script>

          var $seller =$("#sel_se").val();
      function bySeller(seller) {
          var findGoodsBySeller;
          $.ajax({
              url:'/cgi/goods/findGoodsBySeller',
              type:'GET',
              data:{'sellerID':$("#sel_se").val()},
              dataType:'JSON',
              success:function (response,status,xhr) {
                  for (var i=0;i<response.length;i++){

                      findGoodsBySeller +='<tr>'+
                          '<td>'+ response[i].id + '</td>' +
                          '<td>'+response[i].name + '</td>' +

                          '<td>'+
                          '<img src="/upload/'+response[i].image +'"'+
                          'alt=""'+' height="25px"'+' width="30px"/>'
                          + '</td>' +
                          '<td>'+response[i].price+'</td>' +
                          '<td>'+response[i].seller.shopname+'</td>' +
                          '<td>'+response[i].category.text+'</td>' +
                          '<td>'+response[i].stock+'</td>' +
                          '<td>'+
                          '<a href="/cgi/goods/toGoodsDeleteUI/'+response[i].id+'"'+
                          'class="label label-danger large">'+'删除'+'</a>'
                          +'</td>'


                          +'</tr>';

                      //         清空上次数据
                      $("#goodsTable tbody ").html("");

                      //        将查询出来的数据插入
                      $("#goodsTable tbody").html(findGoodsBySeller);


                  }

              },error:function () {
                  alert("错误");
              }

          });


      }


      function byCategory(category) {
          var findGoodsByCategory="";
          $.ajax({
              url:'/cgi/goods/findGoodsByCategory',
              type:'GET',
              data:{'categoryID':$("#sel_ca").val()},
              dataType:'JSON',
              success:function (response,status,xhr) {
                  for (var i=0;i<response.length;i++){

                      findGoodsByCategory +='<tr>'+
                          '<td>'+ response[i].id + '</td>' +
                          '<td>'+response[i].name + '</td>' +

                          '<td>'+
                          '<img src="/upload/'+response[i].image +'"'+
                          'alt=""'+' height="25px"'+' width="30px"/>'
                          + '</td>' +
                          '<td>'+response[i].price+'</td>' +
                          '<td>'+response[i].seller.shopname+'</td>' +
                          '<td>'+response[i].category.text+'</td>' +
                          '<td>'+response[i].stock+'</td>' +

                          '<td>'+
                          '<a href="/cgi/goods/toGoodsDeleteUI/'+response[i].id+'"'+
                          'class="label label-danger large">'+'删除'+'</a>'
                          +'</td>'
                          +'</tr>';

                      //         清空上次数据
                      $("#goodsTable tbody ").html("");
                      //        将查询出来的数据插入
                      $("#goodsTable tbody").html(findGoodsByCategory);

                  }

              },error:function () {
                  alert("错误");
              }

          });

      }


      <%--<fmt:formatDate value="${response[i].indate}" pattern="yyyy-MM-dd"/>--%>

      //                          '<td>'+
      //                          '<fmt'+':formatDate'+' value="$'+'{'+response[i].indate+'}"'+'pattern="yyyy-MM-dd"/>'
      //                          +'</td>'+


      $(function () {
//        jQuery找对象
          var obj_sel_ca = $("#sel_ca");
//        查找web本地存储有无存储分类数据
          var data_ca = localStorage.getItem("CategoryData");
//        不管web本地是否有存储，都先异步调用数据，再显示
              get_data_ca();
              show_data_ca();


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





          //        jQuery找对象
          var obj_sel_se = $("#sel_se");
//        查找web本地存储有无存储分类数据
          var data_se = localStorage.getItem("SellerData");
//        不管web本地是否有存储，都先异步调用数据，再显示
              get_data_se();
              show_data_se();


//        显示数据
          function get_data_se() {
              $.ajax({
                  url:'/cgi/seller/getData',
                  type:'GET',
                  dataType:'JSON',
                  success:function (response,status,xhr) {
//                    将返回的数据存储到本地web存储
                      localStorage.setItem("SellerData",JSON.stringify(response));
                  },
                  error:function () {
                      alert("error");
                  }
              });
          }

//        异步调用数据
          function show_data_se() {
//            得到web本地存储的key
              data_se = localStorage.getItem("SellerData");
//            将JSON串转化为json对象
              var obj_data_se = JSON.parse(data_se);
              var se = obj_data_se.data;
              for (var i=0;i<se.length;i++){
                  obj_sel_se.append("<option value='"+se[i].id+"'>"+se[i].realname+"</option>");
              }
          }
      });//end of jquery



  </script>

  

  </body>
</html>



<script>
    function deleteitem(obj){
        var tr=$(obj).parent().parent();
        var goodsID = tr.children("td#goodsID").text();
        var goodsName = tr.children("td#goodsName").text();
        $('#deleteID').val(goodsID);
        $('#deleteText').val(goodsName);
    };
</script>