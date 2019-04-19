<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://www.springframework.org/tags/form" %>


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
                      <a class="active" href="/cgi/cateogry/manage">
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
                      <a  href="/cgi/goods/goodsManage">
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



              <html lang="en">
              <head>
                  <title>商城|后台管理|商品管理页</title>
                  <!-- 新 Bootstrap 核心 CSS 文件 -->
                  <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
              </head>
              <body>

              <br>
              <!-- Button trigger modal -->
              <button type="button" class="btn btn-success large" data-toggle="modal" data-target="#myFirstModal">
                  分类添加
              </button>

              <!-- Modal -->
              <div class="modal fade bs-example-modal-lg" id="myFirstModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                  <div class="modal-dialog" role="document">
                      <div class="modal-content">
                          <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                              <h4 class="modal-title" id="myModalLabel">商品 分类信息</h4>
                          </div>
                          <div class="modal-body">
                              <form class="form-horizontal" action="/cgi/category/update" method="post" enctype="multipart/form-data">
                                  <div class="form-group">
                                      <label for="text" class="col-sm-4 control-label">分类信息</label>
                                      <div class="col-sm-8">
                                          <%--隐藏id--%>
                                          <input type="text" name="id" value="${category.id}" hidden>
                                          <input type="text" class="form-control" id="text"
                                                 placeholder="请输入分类名称" name="text" value="${category.text}"
                                          >
                                      </div>
                                  </div>


                                  <div class="form-group">
                                      <div class="col-sm-offset-0 col-sm-12 btn-block">
                                          <input type="submit" value="分类添加" class="btn btn-success btn-block">
                                      </div>
                                  </div>
                              </form>
                          </div>
                      </div>
                  </div>
              </div>

              <%--数据表格展示区--%>
              <div class="table-responsive">
                  <table  class="table table-hover" >
                      <thead>
                      <tr>
                          <td>分类ID</td>
                          <td>分类名称</td>
                          <td>操作1</td>
                          <td>操作2</td>
                      </tr>
                      </thead>
                      <tbody>
                      <c:forEach items="${content.data}" var="category">
                          <tr>
                              <td id="categoryID">${category.id}</td>
                              <td id="categoryText">${category.text}</td>

                              <td>
                                  <!-- Button trigger modal -->
                                  <button type="button" class="btn btn-info " data-toggle="modal" data-target="#mySecondModal" onclick="edititem(this)">
                                      修改
                                  </button>

                                  <!-- Modal -->
                                  <div class="modal fade" id="mySecondModal" tabindex="-1" role="dialog" aria-labelledby="mySecondLabel">
                                      <div class="modal-dialog" role="document">
                                          <div class="modal-content">
                                              <div class="modal-header">
                                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                  <h4 class="modal-title" id="mySecondLabel">商品 分类信息</h4>
                                              </div>
                                              <div class="modal-body">
                                                  <form class="form-horizontal" action="/cgi/category/update" method="post" enctype="multipart/form-data">
                                                      <div class="form-group">
                                                          <label for="text" class="col-sm-4 control-label">分类信息</label>
                                                          <div class="col-sm-8">
                                                                  <%--隐藏id--%>
                                                              <input type="text" name="id" id="updateID" value="${category.id}" hidden>
                                                              <input type="text" class="form-control" id="updateText"
                                                                     placeholder="请输入分类名称" name="text" value="${category.text}"
                                                              >
                                                          </div>
                                                      </div>


                                                      <div class="form-group">
                                                          <div class="col-sm-offset-0 col-sm-12 btn-block">
                                                              <input type="submit" value="分类修改" class="btn btn-success btn-block">
                                                          </div>
                                                      </div>
                                                  </form>
                                              </div>
                                          </div>
                                      </div>
                                  </div>
                              </td>

                                <td>
                                  <!-- Button trigger modal -->
                                  <button type="button" class="btn btn-warning large" data-toggle="modal" data-target="#myThirdModal" onclick="deleteitem(this)">
                                      删除
                                  </button>

                                  <!-- Modal -->
                                  <div class="modal fade" id="myThirdModal" tabindex="-1" role="dialog" aria-labelledby="myThirdLabel">
                                      <div class="modal-dialog" role="document">
                                          <form class="form-horizontal" action="/cgi/category/delete" method="post" enctype="multipart/form-data">
                                          <div class="modal-content">
                                              <div class="modal-header">
                                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                  <h4 class="modal-title" id="myThirdLabel">是否删除分类信息</h4>
                                              </div>
                                              <div class="modal-body">

                                                      <div class="form-group">
                                                          <label for="text" class="col-sm-4 control-label">分类信息</label>
                                                          <div class="col-sm-8">
                                                                  <%--隐藏id--%>
                                                              <input type="text" name="id" id="deleteID" value="${category.id}" hidden>
                                                              <input type="text" class="form-control" id="deleteText"
                                                                     placeholder="请输入分类名称" name="text"
                                                                     value="${category.text} "
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
                  <a href="/cgi/category/manage?pageNow=1" >首页</a>
                  <c:choose>
                      <c:when test="${page.pageNow - 1 > 0}">
                          <a href="/cgi/category/manage?pageNow=${page.pageNow - 1}">上一页</a>
                      </c:when>
                      <c:when test="${page.pageNow - 1 <= 0}">
                          <a href="/cgi/category/manage?pageNow=1" >上一页</a>
                      </c:when>
                  </c:choose>
                  <c:choose>
                      <c:when test="${page.totalPageCount==0}">
                          <a href="/cgi/category/manage?pageNow=${page.pageNow}">下一页</a>
                      </c:when>
                      <c:when test="${page.pageNow + 1 < page.totalPageCount}">
                          <a href="/cgi/category/manage?pageNow=${page.pageNow + 1}">下一页</a>
                      </c:when>
                      <c:when test="${page.pageNow + 1 >= page.totalPageCount}">
                          <a href="/cgi/category/manage?pageNow=${page.totalPageCount}">下一页</a>
                      </c:when>
                  </c:choose>
                  <c:choose>
                      <c:when test="${page.totalPageCount==0}">
                          <a href="/cgi/category/manage?pageNow=${page.pageNow}" >   尾页</a>
                      </c:when>
                      <c:otherwise>
                          <a href="/cgi/category/manage?pageNow=${page.totalPageCount}">尾页 </a>
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

  

  </body>
</html>


<script>

    function edititem(obj){
        var tr=$(obj).parent().parent();
        var categoryID = tr.children("td#categoryID").text();
        var categoryText = tr.children("td#categoryText").text();
        $('#updateID').val(categoryID);
        $('#updateText').val(categoryText);
    };


    function deleteitem(obj){
        var tr=$(obj).parent().parent();
        var categoryID = tr.children("td#categoryID").text();
        var categoryText = tr.children("td#categoryText").text();
        $('#deleteID').val(categoryID);
        $('#deleteText').val(categoryText);
    };


</script>
