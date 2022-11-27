<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <title>人员添加</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap-reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/assets/bootstrap-datepicker/css/datepicker.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet">
<body>
<section id="container" class="">

    <div class="row">
        <div class="col-lg-12">
            <section class="panel">
                <header class="panel-heading">
                    人员添加
                </header>
                <div class="panel-body">
                    <form class="form-horizontal tasi-form" action="${pageContext.request.contextPath}/person.do"
                          method="post">
                        <input type="hidden" name="kc" value="create">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="name" placeholder="输入姓名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">身份证号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="personCard"
                                       placeholder="输入姓名证件编号">
                                <span class="help-block">请输入正确的证件编号, 并确认该编号是唯一的!</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">状态</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="state">
                                    <option value="0">请选择</option>
                                    <option value="1">离休</option>
                                    <option value="2">退休</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">职级</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="grade">
                                    <option value="0">请选择</option>
                                    <option value="1">部级正职</option>
                                    <option value="2">部级副职</option>
                                    <option value="3">司级正职</option>
                                    <option value="4">司级副职</option>
                                    <option value="5">处级正职</option>
                                    <option value="6">处级副职</option>
                                    <option value="7">科级正职</option>
                                    <option value="8">科级副职</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">起薪日期</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="startedDate" type="text"
                                       placeholder="点击这里选择日期..." id="date" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-2">补贴项目</label>
                            <div class="col-lg-10">
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="hotting" value="1"> 供暖
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="property" value="1"> 物业
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">更改原因</label>
                            <div class="col-sm-10">
                                <input type="text" name="reasons" class="form-control" placeholder="请输入更改原因">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label"></label>
                            <div class="col-lg-10">
                                <button type="submit" id="create" class="btn btn-success">添加</button>
                                <button type="submit" class="btn btn-success">重置</button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </div>
</section>

<script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/static/js/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('[name = personCard]').blur(function (){
            let card = $('[name=personCard]').val();
            if ($.trim(card).length === 18){
                // 1. 构建ajax异步引擎对象
                let request = new XMLHttpRequest();
                // 2. 指定请求过程响应函数
                request.onreadystatechange = function (){
                    /* 2.1 请求执行状态码readyState
                    * 0: ajax引擎未实例化 XMLHttpRequest
                    * 1: 请求参数已初始化完毕
                    * 2: 准备调用发送请求
                    * 3: 请求已发出, 但服务器未返回响应
                    * 4: 服务器端已返回响应
                    * */
                    if(request.readyState === 4){
                        // 2.2 响应状态码 status
                        if (request.status === 200){
                            /* 2.3 ajax引擎只能识别两种的数据
                            * 1. string字符串 -> json
                            *  responseText
                            * 2. xml文档
                            *  responseXML
                            * */
                            let text = request.responseText;
                            /* 2.4 字符串与JSON之间的互转
                            * JSON.parse(''); 字符串 转 JSON对象/数组
                            *
                            * JSON.stringify(''); JSON对象/数组 转 字符串
                            * */
                            let json = JSON.parse(text);
                            if (json.success){
                                // 提交按钮是否禁用
                                $('#create').removeAttr('disabled');
                            } else {
                                layer.msg('身份证号不唯一');
                                $('#create').attr('disabled','true');
                            }
                        } else {
                            layer.msg('请求后台校验失败 '+request.statusText);
                        }
                    }
                };
                /* 3. 配置请求相关参数
                * 请求方式: post/get
                * 请求地址
                * 同步/异步: true-异步(默认) false-同步*/
                request.open('post', '${pageContext.request.contextPath}/person.do');
                request.setRequestHeader('content-type','application/x-www-form-urlencoded');
                // 4. 发送请求并携带参数
                request.send('kc=card&personCard='+card);
            } else {
                //提示层
                layer.msg('身份证号格式错误');
                $('#create').attr('disabled','true');
            }
        })
        // 绑定添加按钮
        $('#create').click(function (){
            $('form:eq(0)').submit();
        })

        $('#date').datepicker({
            format: 'yyyy-mm-dd'
        });
    });
</script>
</body>
</html>
