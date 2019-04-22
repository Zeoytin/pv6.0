<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>产品</title>
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
                <h2>产品列表</h2>
                <button type="button" class="btn btn-success" onclick="window.location.href='../index'">返回首页</button>
            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">查询条件</div>
        <div class="panel-body">
            <form class="form-inline">
                <div class="row">
                    <div class="col-sm-4">
                        <label class="control-label">产品名称：</label>
                        <input name="name" id="pname" type="text" class="form-control">
                    </div>
                    <#--<div class="col-sm-4">-->
                    <#--<label class="control-label">平台：</label>-->
                    <#--<select name="paltform" id="paltform" class="selectpicker form-control">-->
                    <#--<option value="">请选择平台</option>-->
                    <#--<option value="PC">PC</option>-->
                    <#--<option value="ios">ios</option>-->
                    <#--<option value="andriod">andriod</option>-->
                    <#--</select>-->
                    <#--</div>-->
                    <div class="col-sm-4">
                        <button class="btn btn-primary" type="button" id="btn_query">查询</button>
                        <#--<input class="btn btn-default" type="button" value="批量删除" onclick="BtchDelete()">-->
                    </div>
                </div>
            </form>
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
                        新增产品
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><span
                                        style="color: red;">*</span>产品名称</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="name" value="" id="name"
                                       placeholder="请输入产品名称">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="paltform" class="col-sm-3 control-label"><span
                                        style="color: red;">*</span>平台</label>
                            <div class="col-sm-9">
                                <select name="paltform" id="paltform" class="selectpicker form-control">
                                    <option value="">请选择平台</option>
                                    <option value="PC">PC</option>
                                    <option value="ios">ios</option>
                                    <option value="andriod">andriod</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="versionName" class="col-sm-3 control-label"><span style="color: red;">*</span>版本名称</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="versionName" value=""
                                       id="versionName"
                                       placeholder="请输入版本名称">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="versionCode" class="col-sm-3 control-label"><span style="color: red;">*</span>版本号</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="versionCode" value=""
                                       id="versionCode"
                                       placeholder="请输入版本号">
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
                        修改产品信息
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
                            <#--<label for="id" class="col-sm-3 control-label">ID</label>-->
                            <div class="col-sm-9">
                                <input type="hidden" class="form-control" id="isCheck" name="isCheck" value=""
                                       readonly="readonly ">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name1" class="col-sm-3 control-label"><span
                                        style="color: red;">*</span>产品名称</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="name" value="" id="name1"
                                       placeholder="请输入产品名称">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="paltform1" class="col-sm-3 control-label"><span
                                        style="color: red;">*</span>平台</label>
                            <div class="col-sm-9">
                                <select name="paltform" id="paltform1" class="selectpicker form-control">
                                    <option value="">请选择平台</option>
                                    <option value="PC">PC</option>
                                    <option value="ios">ios</option>
                                    <option value="andriod">andriod</option>
                                </select>
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
        initTable();
        //查询
        $('#btn_query').on("click", function () {
            console.log("查询");
            $('#mytable').bootstrapTable('selectPage', 1);
        });
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
                url: "../product/del",
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
                    $("#name1").val(row[i].name);
                    $("#paltform1").val(row[i].paltform);
                }
            }
        });
    });


    function initTable() {
        $('#mytable').bootstrapTable({
            method: 'get',//请求方式
            contentType: "application/x-www-form-urlencoded",
            url: '../product/listProducts',//请求路径
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
            }, {
                title: '产品编号',
                field: 'id',
                align: 'center',
                // visible: false
            }, {
                title: '产品名称',
                field: 'name',
                align: 'center',
            }, {
                title: '平台',
                field: 'paltform',
                align: 'center',
            }, {
                title: '审核',
                field: 'isCheck',
                align: 'center',
                visible: false
            },{
                field: 'operation',
                title: '操作',
                align: 'center',
                events: operateEvents,//给按钮注册事件
                formatter: addFunctionAlty//表格中增加按钮
            }]
        })
    };

    // 修改按钮、删除按钮
    function addFunctionAlty(value, row, index) {
        return [
            '<button type="button" id="btn_more" class="btn btn-info">查看版本</button>  ',
        ].join('');
    }

    window.operateEvents = {

        // 点击查看按钮执行的方法
        'click #btn_more': function (e, value, row, index) {
            toVersion(row.id, row.name, row.paltform);
        },
    };

    function toVersion(proid, proname, propaltform) {
        console.log(proid, proname, propaltform);
        if (!window.localStorage) {
            alert("浏览器不支持localStorage")

        } else {
            localStorage.setItem("proid", proid);
            localStorage.setItem("proname", proname);
            localStorage.setItem("propaltform", propaltform);
            console.log("++成功++")
            // window.location.href = "/version/latestVersions/"+proid;
            window.location.href = "../version/query";

        }
    }

    //查询条件
    function queryParams(params) {//上传服务器的参数
        return {
            pageSize: params.pageSize,
            pageNumber: params.pageNumber,
            name: $.trim($("#pname").val()),
            // paltform: $.trim($("#paltform").val()),
        }
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
            url: "../product/update",
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
        var name = $("#name").val();
        var paltform = $("#paltform").val();
        var versionName = $("#versionName").val();
        var versionCode = $("#versionCode").val();
        // 异步提交数据
        $.ajax({
            url: "../product/add",
            // contentType: 'application/json;charset=UTF-8',
            data: {
                "name": name,
                "paltform": paltform,
                "versionName": versionName,
                "versionCode": versionCode
            },
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
</script>
</html>