<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>描述</title>
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
                <h2 id="param"></h2>
                <h3>描述列表</h3>
                <button type="button" class="btn btn-success" onclick="javascript :history.back(-1);">返回上一页</button>&nbsp;&nbsp;
                <button type="button" class="btn btn-warning" onclick="window.location.href='../index'">返回首页</button>
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">查询条件</div>
        <div class="panel-body">
            <form class="form-inline">
                <div class="row">
                    <div class="col-sm-3">
                        <label for="type" class=" control-label">描述类型：</label>
                        <select name="type" id="type2" class="selectpicker form-control"></select>
                    </div>
                    <div class="col-sm-3">
                        <button class="btn btn-primary" type="button" id="btn_query">查询</button>
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
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        新增描述
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="type" class="col-sm-3 control-label"><span
                                        style="color: red;">*</span>描述类型</label>
                            <div class="col-sm-9">
                                <select name="type" id="type" class="selectpicker form-control">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="content" class="col-sm-3 control-label"><span
                                        style="color: red;">*</span>描述内容</label>
                            <div class="col-sm-9">
                                    <textarea rows="5" class="form-control" name="content" value="" id="content"
                                              maxlength="100"
                                              placeholder="请输入描述内容"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-9">
                                <input type="hidden" class="form-control" id="versionId" name="versionId" value=""
                                       readonly="readonly ">
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
                        修改描述信息
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">

                            <div class="col-sm-9">
                                <input type="hidden" class="form-control" id="id" name="id" value=""
                                       readonly="readonly ">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="type1" class="col-sm-3 control-label"><span
                                        style="color: red;">*</span>描述类型</label>
                            <div class="col-sm-9">
                                <select name="type" id="type1" class="selectpicker form-control">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="content1" class="col-sm-3 control-label"><span style="color: red;">*</span>描述内容</label>
                            <div class="col-sm-9">
                                    <textarea rows="5" class="form-control" name="content" value="" id="content1"
                                              maxlength="100"
                                              placeholder="请输入描述内容"></textarea>
                            </div>
                        </div>
                        <div class="form-group">

                            <div class="col-sm-9">
                                <input type="hidden" class="form-control" id="versionId1" name="versionId" value=""
                                       readonly="readonly ">
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
</body>
<script type="text/javascript">
    $(document).ready(function () {
        var rname = localStorage.getItem("rname");
        var rpaltform = localStorage.getItem("rpaltform");
        var rversionCode = localStorage.getItem("rversionCode");
        console.log(rname,rpaltform,rversionCode);
        $("#param").html(rname+"("+rpaltform+")"+rversionCode);
        getType2();
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
                url: "../description/del",
                data: {"str": str},
                success: function (data) {
                    if (data == "删除成功") {
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
            var versionId = localStorage.getItem("rversionId");
            console.log("versionId=", versionId)
            $("#versionId").val(versionId);
            getType();
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
                    $("#type1").val(row[i].type);
                    $("#content1").val(row[i].content);
                    $("#versionId1").val(row[i].versionId);
                }
            }
        });
    });
    $(function () {
        // getType();
       getType1()
    });

    function initTable() {
        $('#mytable').bootstrapTable({
            method: 'get',//请求方式
            contentType: "application/x-www-form-urlencoded",
            url: '../description/listDescriptions',//请求路径
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
                title: '描述编号',
                field: 'id',
                align: 'center',
                // visible: false
            }, {
                title: '描述类型',
                field: 'type',
                align: 'center',
            }, {
                title: '描述内容',
                field: 'content',
                align: 'center',
            }]
        })
    };


    //查询条件
    function queryParams(params) {//上传服务器的参数
        var versionId = localStorage.getItem("rversionId");
        console.log("versionId=", versionId)
        return {
            versionId:versionId,
            type: $.trim($("#type2").val()),
            pageSize: params.pageSize,
            pageNumber: params.pageNumber,
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

        //异步提交数据
        $.ajax({
            url: "../description/update",
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
            console.log(d)
        });
        console.log(JSON.stringify(d));
        //异步提交数据
        $.ajax({
            url: "../description/add",
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
        });

        return false;
    };
    function getType() {
        console.log("走getType方法");
        $("#type").empty();
        $.ajax({
            url: '../description/findType',
            dataType: 'json',
            type: 'get',
            success: function (res) {
                if (res) {
                    console.log("getType",res)
                    var data = res.data.typeList
                    var str = "";
                    for (var i = 0; i < data.length; i++) {
                        str +="<option value=" + data[i].typeName + ">" + data[i].typeName + "</option>";
                    }
                    $("#type").append("<option value=\"\">--选择描述类型--</option>" + str);
                }
                else {
                    console.log("失败")
                }
            },
            error: function () {
                alert('请求出错');
            },
        })
    }
    function getType1() {
        console.log("走getType方法");
        $("#type1").empty();
        $.ajax({
            url: '../description/findType',
            dataType: 'json',
            type: 'get',
            success: function (res) {
                if (res) {
                    console.log("getType1",res)
                    var data = res.data.typeList
                    var str = "";
                    for (var i = 0; i < data.length; i++) {
                        str +="<option value=" + data[i].typeName + ">" + data[i].typeName + "</option>";
                    }
                    $("#type1").append(str);
                }
                else {
                    console.log("失败")
                }
            },
            error: function () {
                alert('请求出错');
            },
        })
    }
    function getType2() {
        console.log("走getType方法");
        $("#type").empty();
        $.ajax({
            url: '../description/findType',
            dataType: 'json',
            type: 'get',
            success: function (res) {
                if (res) {
                    console.log("getType2",res)
                    var data = res.data.typeList
                    var str = "";
                    for (var i = 0; i < data.length; i++) {
                        str +="<option value=" + data[i].typeName + ">" + data[i].typeName + "</option>";
                    }
                    $("#type2").append("<option value=\"\">--选择描述类型--</option>" + str);
                }
                else {
                    console.log("失败")
                }
            },
            error: function () {
                alert('请求出错');
            },
        })
    }
    // $('#addModal').on('hide.bs.modal', function () {
    //     $('#form_data')[0].reset();
    // });
</script>
</html>