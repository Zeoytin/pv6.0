<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>标签</title>
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
                <h2>标签列表</h2>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 column">
            <button type="button" class="btn btn-success" onclick="window.location.href='../index'">返回首页</button>
        </div>
    </div>
    <div id="toolbar" class="btn-group">
        <button id="btn_add" type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
        </button>
        <button id="btn_edit" type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
        </button>
        <button id="btn_delete" type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
        </button>
    </div>
    <table class="table table-hover" id="mytable"></table>
</div>
<!-- 模态框示例（Modal） -->
<form method="post" action="" class="form-horizontal" role="form" id="form_data" onsubmit="return add_form()"
      style="margin: 20px;">
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        新增标签
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><span
                                        style="color: red;">*</span>标签名称</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="labelName" value="" id="labelName"
                                       placeholder="请输入类型名称">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">
                        提交
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</form>

<form method="post" action="" class="form-horizontal" role="form" id="update_data" onsubmit="return update_form()"
      style="margin: 20px;">
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel1">
                        修改标签
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <#--<label for="id" class="col-sm-3 control-label">ID</label>-->
                            <div class="col-sm-9">
                                <input type="hidden" class="form-control" id="id" name="id" value=""
                                       readonly="readonly ">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name1" class="col-sm-3 control-label"><span
                                        style="color: red;">*</span>标签名称</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="labelName" value="" id="labelName1"
                                       placeholder="请输入标签名称">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">
                        提交
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        //调用函数，初始化表格
        // getData();
        // $('#table').bootstrapTable('destroy');
        initTable();

        //删除
        $('#btn_delete').on("click", function () {
            console.log("删除")
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
                url: "../label/del",
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
        //新增
        $('#btn_add').on("click", function () {
            console.log("新增");
            $('#addModal').modal('show');
        });
        //修改
        $('#btn_edit').on("click", function () {
            console.log("修改");
            var row = $.map($("#mytable").bootstrapTable('getSelections'), function (row) {
                return row;
            });
            if (row.length == 1) {
                for (var i = 0; i < row.length; i++) {
                    console.log(row[i].id);
                    //打开弹出框：
                    $('#updateModal').modal();
                    $("#id").val(row[i].id);
                    $("#labelName1").val(row[i].labelName);
                }
            }
        });
    });


    function initTable() {
        $('#mytable').bootstrapTable({
            method: 'get',//请求方式
            contentType: 'application/json;charset=UTF-8',
            url: '../label/allLabel',//请求路径
            cache: false,
            toolbar: '#toolbar',//工具按钮用哪个容器
            height: 500, //自定义表格的高度,
            responseHandler: function (res) {
                console.log("返回数据=", res)
                return res.data.labelList;
            },
            columns: [{
                checkbox: true
            }, {
                title: '标签编号',
                field: 'id',
                align: 'center',
                // visible: false
            }, {
                title: '标签名称',
                field: 'labelName',
                align: 'center',
            }],
            onLoadSuccess: function (json) {
                console.log("success",json);
                $("#mytable").bootstrapTable('load',json);
            },
            onLoadError: function () {
                alert("load fail")
            }
        })
    };


    // 修改表单
    function update_form() {
        var d = {};
        var t = $('#update_data').serializeArray();
        $.each(t, function () {
            d[this.name] = this.value;
        });
        console.log(JSON.stringify(d));

        // 异步提交数据
        $.ajax({
            url: "../label/update",
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(d),
            type: "post",
            success: function (data) {
                if (data.code == 1) {
                    alert("操作成功");
                    // location.reload();
                    $('#updateModal').modal('hide');
                    $('#mytable').bootstrapTable('refresh');
                } else {
                    alert('操作失败');
                }
            },
            error: function () {
                alert('请求出错');
            },
        });

        return false;
    };

    // 增加表单
    function add_form() {
        var d = {};
        var t = $('#form_data').serializeArray();
        $.each(t, function () {
            d[this.name] = this.value;
        });
        console.log(JSON.stringify(d));
        // 异步提交数据
        $.ajax({
            url: "../label/add",
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(d),
            type: "post",
            success: function (data) {
                if (data.code == 1) {
                    alert("添加成功");
                    // location.reload();
                    $('#addModal').modal('hide');
                    $('#mytable').bootstrapTable('refresh');

                } else {
                    alert('操作失败');
                }
            },
            error: function () {
                alert('请求出错');
            },
            complete: function () {

            }
        });

        return false;
    };
    $('#addModal').on('hide.bs.modal', function () {
        $('#form_data')[0].reset();
    });
    // function getData() {
    //     $.ajax({
    //         url: '/label/allLabel',
    //         dataType: 'json',
    //         type: 'get',
    //         success: function (data) {
    //             if (data) {
    //                 console.log("getData=",data)
    //             }
    //             else {
    //                 console.log("失败")
    //             }
    //         },
    //         error: function () {
    //             alert('请求出错');
    //         },
    //     })
    // }
</script>
</html>