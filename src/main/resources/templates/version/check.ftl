<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>审核</title>
    <!-- 引入bootstrap样式 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- 引入bootstrap-table样式 -->
    <link href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">
    <!-- jquery -->
    <script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- bootstrap-table.min.js -->
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
    <!-- 引入中文语言包 -->
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
</head>

<body>
<div class="container body-content" style="padding-top:10px;">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h2>版本审核列表</h2>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 column">
            <button type="button" class="btn btn-success" onclick="window.location.href='../index'">返回首页</button>
        </div>
    </div>
    <div id="toolbar" class="btn-group">
        <button id="btn_check" type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>审核
        </button>
    </div>
    <table class="table table-hover" id="mytable"></table>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        //调用函数，初始化表格
        initTable();
        //查询
        $('#btn_query').on("click", function () {
            console.log("查询");
            $('#mytable').bootstrapTable('selectPage', 1);
        });
        //删除
        $('#btn_check').on("click", function () {
            console.log("审核")
            var row = $.map($("#mytable").bootstrapTable('getSelections'), function (row) {
                return row;
            });
            var ids = [];
            for (var i = 0; i < row.length; i++) {
                //获取自定义table 的中的checkbox值
                var id = row[i].id;   //这个是你要在列表中取的单个id
                ids.push(id); //然后把单个id循环放到ids的数组中
            }
            var str = JSON.stringify(ids);
            console.log("ids=", str)
            //批量删除：
            $.ajax({
                type: "POST",
                url: "../version/check",
                data: {"str": str},
                success: function (data) {
                    if (data.code == 1) {
                        alert('操作成功');
                        // location.reload();
                        $('#mytable').bootstrapTable('refresh');
                    } else {
                        alert('操作失败');
                    }
                },
                error: function () {
                    alert('请求出错');
                },
            });
        });
    });

    function initTable() {
        $('#mytable').bootstrapTable({
            method: 'get',//请求方式
            contentType: "application/x-www-form-urlencoded",
            url: '../version/allVersions',//请求路径
            toolbar: '#toolbar',//工具按钮用哪个容器
            // striped: true, //是否显示行间隔色
            pageNumber: 1, //初始化加载第一页
            pagination: true,//是否分页
            sidePagination: 'server',//server:服务器端分页|client：前端分页
            pageSize: 5,//单页记录数
            pageList: [5, 10, 20, 30],//可选择单页记录数
            height: 500, //自定义表格的高度,
            paginationPreText: "上一页",
            paginationNextText: "下一页",
            queryParamsType: '',
            queryParams: queryParams,
            responseHandler: function (res) {
                console.log("返回数据=", res)
                return {
                    "total": res.data.total,
                    "rows": res.data.rows
                };
            },
            columns: [{
                checkbox: true
            },
                {field: 'product.name', title: '产品名'},
                {field: 'product.paltform', title: '平台'},
                {field: 'id', title: '版本ID'},
                {field: 'label.label', title: '标签'},
                {field: 'versionCode', title: '版本号'},

                {field: 'versionName', title: '版本名称'},
                {
                    field: 'createTime', title: '发版时间', formatter: function (value, row, index) {
                        return changeDateFormat(value)
                    }
                },
                {field: 'url', title: '文件地址'},
                {field: 'fileName', title: '附件名称'},
                {
                    title: '审核',
                    field: 'isCheck',
                    align: 'center',
                    // visible: false
                }]
        })
    };


    //查询条件
    function queryParams(params) {//上传服务器的参数
        return {
            pageSize: params.pageSize,
            pageNumber: params.pageNumber,
        }
    };
    /**************************************时间格式化处理************************************/
    //转换日期格式(时间戳转换为datetime格式)
    function changeDateFormat(cellval) {
        var dateVal = cellval + "";
        if (cellval != null) {
            var date = new Date(parseInt(dateVal.replace("/Date(", "").replace(")/", ""), 10));
            var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
            var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
            var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
            var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
            var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
            return date.getFullYear() + "/" + month + "/" + currentDate + " " + hours + ":" + minutes + ":" + seconds;
        }
    }

</script>
</html>