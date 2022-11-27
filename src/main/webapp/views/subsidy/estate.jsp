<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="javakc-zhg">
 	<link rel="shortcut icon" href="img/favicon.html">
    <title>物业补贴管理</title>
    <link href="../../static/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../static/css/bootstrap-reset.css" rel="stylesheet">
    <link href="../../static/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../static/assets/bootstrap-datepicker/css/datepicker.css" />
    <link href="../../static/css/style.css" rel="stylesheet">
  </head>
  <body>
  <section id="container" class="">
      <div class="row">
          <div class="col-lg-12">
              <section class="panel">
                  <header class="panel-heading">
                      物业补贴
                  </header>
                  <div class="row">
	                  <div class="col-lg-12">
	                      <section class="panel">
	                          <div class="panel-body">
	                              <form class="form-inline" role="form">
	                                  <div class="form-group">
	                                      <label class="">姓名</label>
	                                      <input type="text" class="form-control" placeholder="输入姓名">
	                                  </div>
	                                  <div class="form-group">
	                                      <label class="">身份证号</label>
	                                      <input type="text" class="form-control" placeholder="请输入身份证号">
	                                  </div>
	                                  <div class="form-group">
	                                      <label class="">月份</label>
	                                      <input type="text" id="sdate" class="form-control" placeholder="请输入开始日期" readonly>
	                                  </div>
	                                  <button type="submit" class="btn btn-success">搜索</button>
	                                  <button type="button" id="create" class="btn btn-info">添加</button>
	                                  <button type="submit" class="btn btn-danger">批量删除</button>
	                              </form>
	                          </div>
	                      </section>
	                  </div>
	              </div>
                  <table class="table table-striped table-advance table-hover">
                      <thead>
	                      	<tr>
								<th><input type="checkbox"/></th>
	                          	<th><i class="icon-bullhorn"></i>序号</th>
	                          	<th><i class="icon-male"></i>月份</th>
	                          	<th><i class="icon-bookmark"></i>姓名</th>
	                          	<th><i class="icon-edit"></i>身份证</th>
	                          	<th><i class="icon-tags"></i>职级</th>
	                          	<th><i class="icon-jpy"></i>金额</th>
	                          	<th><i class="icon-home"></i>操作</th>
	                      	</tr>
                      </thead>
                      <tbody>
	                      	<tr>
	                      		<th><input type="checkbox"/></th>
	                          	<td>1</td>
	                          	<td>2018年8月</td>
	                          	<td>Lorem Ipsum1</td>
	                          	<td>12120799282881800 </td>
	                          	<td>部级副职 </td>
	                          	<td>1988.35￥ </td>
	                          	<td>
	                              	<button class="btn btn-primary btn-xs"><i class="icon-pencil"></i></button>
	                              	<button class="btn btn-danger btn-xs"><i class="icon-trash "></i></button>
	                          	</td>
	                      	</tr>
	                      	<tr>
	                      		<th><input type="checkbox"/></th>
	                          	<td>2</td>
	                          	<td>2018年8月</td>
	                          	<td>Lorem Ipsum2</td>
	                          	<td>12120799282881800 </td>
	                          	<td>部级正职 </td>
	                          	<td>13867.12￥ </td>
	                          	<td>
	                              	<button class="btn btn-primary btn-xs"><i class="icon-pencil"></i></button>
	                              	<button class="btn btn-danger btn-xs"><i class="icon-trash "></i></button>
	                          	</td>
	                      	</tr>
                      </tbody>
                  </table>
                  <div class="btn-row">
                      <div class="btn-toolbar">
                          <div class="btn-group">
                              <button class="btn btn-primary" type="button">首页</button>
                              <button class="btn btn-primary" type="button">上页</button>
                              <button class="btn btn-primary" type="button">下页</button>
                              <button class="btn btn-primary" type="button">末页</button>
                          </div>
                      </div>
                  </div>
              </section>
          </div>
      </div>
  	</section>
    <script src="../../static/js/jquery.js"></script>
    <script src="../../static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../static/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script>
		$(document).ready(function() 
		{
			$('#create').bind('click', function()
			{
				window.location.href='./create.html';
			});
			$('#sdate').datepicker({
	            format: 'yyyy-mm'
	        });
		});
    </script>
  </body>
</html>