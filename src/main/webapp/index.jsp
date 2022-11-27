<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <title>干部收入管理系统-主页</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap-reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/css/owl.carousel.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/style-responsive.css" rel="stylesheet" />
    <style>
        iframe {
            display: block; /* iframe are inline by default */
            background: #ceced0;
            border: none; /* Reset default border */
            height: 100vh; /* Viewport-relative units */
            width: 100%;
        }
    </style>
  </head>
  <body>
  <section id="container" class="">
      <!--header start-->
      <header class="header white-bg">
            <div class="sidebar-toggle-box">
                <div data-original-title="Toggle Navigation" data-placement="right" class="icon-reorder tooltips"></div>
            </div>
            <!--logo start-->
            <a href="#" class="logo">管理<span>系统</span></a>
            <!--logo end-->
            <div class="nav notify-row" id="top_menu">
                <!--  notification start -->
                <ul class="nav top-menu">
                    <!-- settings start -->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <i class="icon-tasks"></i>
                            <span class="badge bg-success">1</span>
                        </a>
                        <ul class="dropdown-menu extended tasks-bar">
                            <div class="notify-arrow notify-arrow-green"></div>
                            <li>
                                <p class="green">您有 1 个待办任务</p>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div class="desc">工资发放 v1.3</div>
                                        <div class="percent">40%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% 已完成 (success)</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="external">
                                <a href="#">查看全部</a>
                            </li>
                        </ul>
                    </li>
                    <!-- settings end -->
                    <!-- inbox dropdown start-->
                    <li id="header_inbox_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <i class="icon-envelope-alt"></i>
                            <span class="badge bg-important">2</span>
                        </a>
                        <ul class="dropdown-menu extended inbox">
                            <div class="notify-arrow notify-arrow-red"></div>
                            <li>
                                <p class="red">您有 2 条新消息</p>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo"><img alt="avatar" src="static/img/avatar-mini.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Jonathan Smith</span>
                                    <span class="time">Just now</span>
                                    </span>
                                    <span class="message">
                                        Hello, this is an example msg.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo"><img alt="avatar" src="static/img/avatar-mini2.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Jhon Doe</span>
                                    <span class="time">10 mins</span>
                                    </span>
                                    <span class="message">
                                     Hi, Jhon Doe Bhai how are you ?
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">查看所有消息</a>
                            </li>
                        </ul>
                    </li>
                    <!-- inbox dropdown end -->
                    <!-- notification dropdown start-->
                    <li id="header_notification_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">

                            <i class="icon-bell-alt"></i>
                            <span class="badge bg-warning">3</span>
                        </a>
                        <ul class="dropdown-menu extended notification">
                            <div class="notify-arrow notify-arrow-yellow"></div>
                            <li>
                                <p class="yellow">您有 3 个通知</p>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-danger"><i class="icon-bolt"></i></span>
                                    Server #3 overloaded.
                                    <span class="small italic">34 mins</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-warning"><i class="icon-bell"></i></span>
                                    Server #10 not respoding.
                                    <span class="small italic">1 Hours</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-danger"><i class="icon-bolt"></i></span>
                                    Database overloaded 24%.
                                    <span class="small italic">4 hrs</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">查看所有通知</a>
                            </li>
                        </ul>
                    </li>
                    <!-- notification dropdown end -->
                </ul>
                <!--  notification end -->
            </div>
            <div class="top-nav ">
                <!--search & user info start-->
                <ul class="nav pull-right top-menu">
                    <li>
                        <input type="text" class="form-control search" placeholder="搜索">
                    </li>
                    <!-- user login dropdown start-->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <img alt="" src="static/img/avatar1_small.jpg">
                            <span class="username">${sessionScope.user.nickName}</span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <div class="log-arrow-up"></div>
                            <li><a href="#"><i class=" icon-suitcase"></i>个人信息</a></li>
                            <li><a href="#"><i class="icon-cog"></i> 个人设置</a></li>
                            <li><a href="#"><i class="icon-bell-alt"></i> 通知</a></li>
                            <li><a href="${pageContext.request.contextPath}/logout.do"><i class="icon-key"></i> 退出</a></li>
                        </ul>
                    </li>
                    <!-- user login dropdown end -->
                </ul>
                <!--search & user info end-->
            </div>
        </header>
      <!--header end-->
	  
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu">
                  <li class="active">
                      <a class="" href="${pageContext.request.contextPath}/main.jsp" target="mainFrame">
                          <i class="icon-dashboard"></i>
                          <span>主页</span>
                      </a>
                  </li>
				  <li>
                      <a class="" href="${pageContext.request.contextPath}/person.do"  target="mainFrame">
                          <i class="icon-cogs"></i>
                          <span>人员管理</span>
                      </a>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon-book"></i>
                          <span>离退休补贴</span>
                          <span class="arrow"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="${pageContext.request.contextPath}/subsidy.do?type=1" target="mainFrame">供暖补贴</a></li>
                          <li><a class="" href="${pageContext.request.contextPath}/subsidy.do?type=2" target="mainFrame">物业补贴</a></li>
                      </ul>
                  </li>
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
			<iframe class="mainFrame" name="mainFrame" src="${pageContext.request.contextPath}/main.jsp" frameborder="0" seamless></iframe>
          </section>
      </section>
      <!--main content end-->
  </section>
    <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.scrollTo.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.sparkline.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/owl.carousel.js" ></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.customSelect.min.js" ></script>
    <script src="${pageContext.request.contextPath}/static/js/common-scripts.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/sparkline-chart.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/easy-pie-chart.js"></script>
  <script>
      $(document).ready(function () {
        $("#owl-demo").owlCarousel({
            navigation: true,
            slideSpeed: 300,
            paginationSpeed: 400,
            singleItem: true
        });

        $('select.styled').customSelect();

        $('.sidebar-menu>li').bind('click', function()
        {
            //清除所有一级选中
            $('.sidebar-menu>li').removeClass('active');
            $(this).addClass('active');
        });
        $('.sub>li').bind('click', function()
        {
            //清除所有二级选中
            $('.sub>li').removeClass('active');
            $(this).addClass('active');
        });
    });
  </script>
  </body>
</html>
