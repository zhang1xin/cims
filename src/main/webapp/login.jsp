<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Mosaddek">
        <title>干部收入管理系统</title>
        <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/css/bootstrap-reset.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/assets/font-awesome/css/font-awesome.css" rel="stylesheet"/>
        <link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/css/style-responsive.css" rel="stylesheet"/>
    </head>
    <body class="login-body">
        <div class="container">
            <form class="form-signin" action="${pageContext.request.contextPath}/login.do" method="post">
                <h2 class="form-signin-heading">登陆</h2>
                <div class="login-wrap">
                    <input type="text" class="form-control" placeholder="账号" name="userName" autofocus>
                    <input type="password" class="form-control" placeholder="密码" name="passWord">
                    <label class="checkbox">
                        <input type="checkbox" value="remember-me"> 记住我
                        <span class="pull-right"> <a href="#"> 忘记密码?</a></span>
                    </label>
                    <button class="btn btn-lg btn-login btn-block" type="submit">登陆</button>
                </div>
            </form>
        </div>
    </body>
</html>