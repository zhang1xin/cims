<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String type = request.getParameter("type");
%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <link rel="shortcut icon" href="img/favicon.html">
    <title>补贴添加</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap-reset.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/assets/bootstrap-datepicker/css/datepicker.css"/>
    <link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet">
<body>
<section id="container" class="">

    <div class="row">
        <div class="col-lg-12">
            <section class="panel">
                <header class="panel-heading">
                    <%= "1".equals(type) ? "供暖" : "物业"%>补贴添加
                </header>
                <div class="panel-body">
                    <form class="form-horizontal tasi-form" method="post">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="hidden" id="personId" name="personId" readonly required>
                                <input type="text" class="form-control" id="personName" placeholder="输选择姓名" readonly required>
                                <span class="help-block">请选择人员!</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">身份证号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="personCard" placeholder="请选择姓名证件编号" readonly
                                       required>
                                <span class="help-block">根据选择的人员自动显示该人员的证件编号!</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">补贴金额</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="请输入补贴金额">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">更改原因</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="请输入更改原因">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label"></label>
                            <div class="col-lg-10">
                                <button type="submit" class="btn btn-success">添加</button>
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
        $('#personName').click(function (){
            let array;
            // 1. 查询补贴人员
            let request = new XMLHttpRequest();
            request.onreadystatechange = function (){
                if (request.readyState === 4 && request.status === 200){
                    array = JSON.parse(request.responseText);

                }
            };
            /* 配置请求相关参数
             * 请求方式: post/get
             * 请求地址
             * 同步/异步: true-异步(默认) false-同步*/
            request.open('get',"${pageContext.request.contextPath}/person.do?kc=subsidy&type=<%=type%>", false);
            request.send();

            // 人员列表
            let html ='<table class="table table-striped table-advance table-hover">';
            html += '   <thead>';
            html += '    <tr>';
            html += '        <th></th>';
            html += '        <th><i class="icon-bullhorn"></i>序号</th>';
            html += '        <th><i class="icon-male"></i>姓名</th>';
            html += '        <th><i class="icon-bookmark"></i>身份证号</th>';
            html += '    </tr>';
            html += '   </thead>';
            html += '   <tbody>';
            $.each(array, function (i, o ){
                html += '    <tr>';
                html += '        <th><input type="radio" name="id"/></th>';
                html += '        <th>'+(i+1)+'</th>';
                html += '        <th>'+o.name+'</th>';
                html += '        <th>'+o.card+'</th>';
                html += '    </tr>';
            });

            html += '   </tbody>';
            html += '</table>';

            html += '   <div style="text-align: center">';
            html += '       <div class="btn-group">';
            html += '           <button class="btn btn-primary" type="button" id="ok">确定</button>';
            html += '       </div>';
            html += '   </div>';

            // 补贴人员选择层
            let index = layer.open({
                type: 1,
                title: '选择补贴人员',
                skin: 'layui-layer-rim', //加上边框
                area: ['420px', '240px'], //宽高
                content: html
            });

            // 人员选择点击事件
            $('#ok').click(function (){
                if ($('[name = id]:checked').length === 0)
                {
                    //墨绿深蓝风
                    layer.alert('请选择补贴人员', {
                        skin: 'layui-layer-molv' //样式类名
                        ,closeBtn: 0
                    });
                }else{
                    // 1. 写入选中的数据到页面
                    let object = $('[name = id]:checked').first();
                    let id = $(object).val();
                    let name = $(object).parent().nextAll().eq(1).text();
                    let card = $(object).parent().nextAll().eq(2).text();
                    $('#personId').val(id);
                    $('#personName').val(name);
                    $('#personCard').val(card);
                    // 2. 关闭弹出层
                    layer.close(index);
                }

            })

        });
        $('#date').datepicker({
            format: 'yyyy-mm-dd'
        });
    });
</script>
</body>
</html>
