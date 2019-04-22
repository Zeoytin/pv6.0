<html>
<head>
    <title>版本</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.bootcss.com/jquery-treegrid/0.2.0/css/jquery.treegrid.min.css">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>版本管理系统</h1>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h2 id="h2"></h2>
                <h3>最新版本</h3>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 column">
            <button type="button" class="btn btn-success" onclick="javascript :history.back(-1);">返回上一页</button>&nbsp;&nbsp;
            <button type="button" class="btn btn-warning" onclick="window.location.href='../index'">返回首页</button>
        </div>
    </div>
    <br>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>版本ID</th>
                    <th>版本名字</th>
                    <th>版本号</th>
                    <th>发版时间</th>
                    <th>文件地址</th>
                    <th>附件名称</th>
                    <th style="display:none;">产品ID</th>
                    <th>标签</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="tboby">
                <#--<tr>-->
                <#--<td>${version.id}</td>-->
                <#--<td>${version.versionName}</td>-->
                <#--<td>${version.versionCode}</td>-->
                <#--<td>${version.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>-->
                <#--<td>${version.url!}</td>-->
                <#--<td>${version.fileName!}</td>-->
                <#--<td style="display:none;">${version.productId}</td>-->
                <#--<td>-->
                <#--<button type="button" class="btn btn-info" onclick="return findRelated(${version.id},${version.productId},'${version.versionCode}')">-->
                <#--查看当前关联-->
                <#--</button>-->
                <#--</td>-->
                <#--</tr>-->
                </tbody>
            </table>
        </div>
    </div>


    <div>
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="page-header">
                    <h2>历史版本</h2>
                    <button type="button" class="btn  btn-success" style="margin-right:15px;"
                            <#--onclick="return addParent(${version.productId})">新增大版本-->
                            onclick="return addParent()">新增大版本
                    </button>
                </div>
            </div>
        </div>
        <div class="row clearfix">
            <div class="col-md-12 column">
                <table id="table"></table>
            </div>
        </div>
    </div>

    <!-- 添加版本模态框模态框示例（Modal） -->
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
                            新增版本
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="versionName" class="col-sm-3 control-label"><span
                                            style="color: red;">*</span>版本名称</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="versionName" value=""
                                           id="versionName"
                                           placeholder="请输入版本名称">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="versionCode" class="col-sm-3 control-label"><span
                                            style="color: red;">*</span>版本号</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="versionCode" value=""
                                           id="versionCode"
                                           placeholder="请输入版本号">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="type" class="col-sm-3 control-label"><span
                                            style="color: red;">*</span>标签</label>
                                <div class="col-sm-9">

                                    <select name="label" id="label" class="selectpicker form-control">
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="url" class="col-sm-3 control-label">选择文件</label>
                                <div class="col-sm-9">
                                    <input type="file" class="form-control" name="file" id="file">
                                    <#--<input type="file" class="form-control" name="files" id="files" multiple>-->
                                </div>
                            </div>
                            <#--<div class="form-group">-->
                            <#--<label for="url" class="col-sm-3 control-label">文件地址</label>-->
                            <#--<div class="col-sm-9">-->
                            <#--<input type="text" class="form-control" name="url" value="" id="url"-->
                            <#--placeholder="请输入文件地址">-->
                            <#--</div>-->
                            <#--</div>-->
                            <#--<div class="form-group">-->
                            <#--<label for="fileName" class="col-sm-3 control-label">附件名称</label>-->
                            <#--<div class="col-sm-9">-->
                            <#--<input type="text" class="form-control" name="fileName" value="" id="fileName"-->
                            <#--placeholder="请输入附件名称">-->
                            <#--</div>-->
                            <#--</div>-->
                            <div class="form-group">
                                <div class="col-sm-9">
                                    <input type="hidden" class="form-control" name="parentId" value="" id="parentId"
                                           readonly="readonly ">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-9">
                                    <input type="hidden" class="form-control" name="productId" value=""
                                           id="productId"
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
                        <span id="tip"> </span>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </form>

    <form method="post" action="" class="form-horizontal" role="form" id="update_data"
          onsubmit="return update_form()"
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
                            修改版本信息
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
                                <label for="versionName1" class="col-sm-3 control-label"><span
                                            style="color: red;">*</span>版本名称</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="versionName" value=""
                                           id="versionName1"
                                           placeholder="请输入版本名称">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="versionCode1" class="col-sm-3 control-label"><span
                                            style="color: red;">*</span>版本号</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="versionCode" value=""
                                           id="versionCode1"
                                           placeholder="请输入版本号">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-9">
                                    <input type="hidden" class="form-control" name="createTime" value=""
                                           id="createTime1"
                                           disabled="disabled">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="type" class="col-sm-3 control-label"><span
                                            style="color: red;">*</span>标签</label>
                                <div class="col-sm-9">

                                    <select name="label" id="label1" class="selectpicker form-control">
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="url1" class="col-sm-3 control-label">文件地址</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="url" value="" id="url1"
                                           placeholder="请输入文件地址">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="fileName1" class="col-sm-3 control-label">附件名称</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="fileName" value="" id="fileName1"
                                           placeholder="请输入附件名称">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="url" class="col-sm-3 control-label">选择文件</label>
                                <div class="col-sm-9">
                                    <input type="file" class="form-control" name="file" id="file1">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-9">
                                    <input type="hidden" class="form-control" name="parentId" value=""
                                           id="parentId1"
                                           readonly="readonly ">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-9">
                                    <input type="hidden" class="form-control" name="productId" value=""
                                           id="productId1"
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
                        <span id="tip1"> </span>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </form>
</div>
</body>
<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-table/1.12.1/bootstrap-table.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-table/1.12.0/extensions/treegrid/bootstrap-table-treegrid.js"></script>
<script src="https://cdn.bootcss.com/jquery-treegrid/0.2.0/js/jquery.treegrid.min.js"></script>
<script src="../js/tree.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        var proid = localStorage.getItem("proid");
        var proname = localStorage.getItem("proname");
        var propaltform = localStorage.getItem("propaltform");
        console.log(proid, proname, propaltform);
        $("#h2").html(proname + "(" + propaltform + ")");
        lastestVersion(proid);
        showList(proid);
        getLabel();
        getLabel1();
    });

    function lastestVersion(proid) {
        $.ajax({
            url: '../version/latestVersions',
            data: {"productId": proid},
            method: 'get',
            dataType: 'json',
            async: false,
            success: function (res) {
                // console.log(res);
                var data = res.data.latestVersion;
                console.log(data)
                var $tr = $("<tr></tr>");
                var $li1 = "<td>" + data.id + "</td>";
                var $li2 = "<td>" + data.versionName + "</td>";
                var $li3 = "<td>" + data.versionCode + "</td>";
                var $li4 = "<td>" + changeDateFormat(data.createTime) + "</td>";
                var $li5 = (data.url == null) ? "<td>-</td>" : "<td><a href='/version/'>" + data.url + "</a></td>";
                var $li6 = (data.fileName == null) ? "<td>-</td>" : "<td>" + data.fileName + "</td>";
                var $li7 = "<td style=\"display:none;\">" + data.productId + "</td>";
                var $li8 = (data.label == null) ? "<td>-</td>" : "<td>" + data.label.label + "</td>";
                var $bt = "<td><button type=\"button\" class=\"btn btn-info\" onclick=\"return findRelated(" + data.id + "," + data.productId + "," + "'" + data.versionCode + "'" + ")\">查看当前关联</button></td>";
                $tr.append($li1, $li2, $li3, $li4, $li5, $li6, $li7,$li8, $bt);
                //将获取的tr 追加到 table中
                $('#tboby').append($tr);
            }
        })
    }

    function showList(productId) {//历史版本
        if (!productId) {
            alert('Error！');
            return true;
        }
        $.ajax({
            url: '../version/versionList',
            data: {"productId": productId},
            method: 'get',
            dataType: 'json',
            async: false,
            success: function (res) {
                // console.log(res);
                var data = res.data.versions;
                console.log(data);
                tree = JSON.stringify(data);
            }
        })
        $('#table').bootstrapTable({
            class: 'table table-hover table-bordered',
            data: eval(tree),
            pagination: false,
            treeView: true,
            striped: true,   //是否各行渐变色
            bordered: true,  //是否显示边框
            treeId: "id",
            treeField: "versionCode",
            height: 500,
            columns: [
                {field: 'versionCode', title: '版本号'},
                {field: 'id', title: 'ID', visible: false},
                {field: 'versionName', title: '版本名称'},
                {
                    field: 'createTime', title: '发版时间', formatter: function (value, row, index) {
                        return changeDateFormat(value)
                    }
                },
                {field: 'url', title: '文件地址'},
                {field: 'fileName', title: '附件名称'},
                {field: 'parentId', title: '父ID', visible: false},
                {field: 'productId', title: '产品ID', visible: false},
                {field: 'label', title: '标签',
                    // events: labelEvents,
                    formatter: function (value, row, index) {
                        if (value == null) {
                            return "-";
                        } else {
                            return value.label;
                        }
                    }
               },
                {
                    field: 'operate',
                    title: '操作',
                    align: 'center',
                    events: operateEvents,
                    formatter: 'operateFormatter'
                },
            ],

        });
        return false;
    };


    //跳转关联页面
    function findRelated(versionId3, productId3, versionCode3) {
        console.log(versionId3, productId3, versionCode3);
        if (!window.localStorage) {
            alert("浏览器不支持localStorage")

        } else {
            localStorage.setItem("versionId3", versionId3);
            localStorage.setItem("productId3", productId3);
            localStorage.setItem("versionCode3", versionCode3);
            console.log("++成功++")
            // window.location.href = "/version/findRelated/" + versionId3;
            window.location.href = "../version/findRelated";

        }
    };


// function labelFormatter(value, row, index) {
//     var label = findlabel1(row.id);
//     return [
//         '<button type="button" class="RoleOflabel btn   btn-warning">'+label+'</button>'
//     ].join('');
//}
    // 历史版本里的操作格式化按钮
    function operateFormatter(value, row, index) {
        if (row.parentId == null) {
            return [
                '<button type="button" class="RoleOfadd btn  btn-success">新增子版本</button>&nbsp;',
                '<button type="button" class="RoleOfedit btn  btn-info">修改</button>&nbsp;',
                '<button type="button" class="RoleOfdelete btn   btn-danger">删除</button>&nbsp;',
                // '<button type="button" class="RoleOfmore btn  btn-primary">查看描述</button>&nbsp;',
                '<button type="button" class="RoleOfrelated btn   btn-warning">查看关联</button>'
            ].join('');
        }
        return [
            '<button type="button" class="RoleOfedit btn  btn-info">修改</button>&nbsp;',
            '<button type="button" class="RoleOfdelete btn   btn-danger">删除</button>&nbsp;',
            // '<button type="button" class="RoleOfmore btn  btn-primary">查看描述</button>&nbsp;',
            '<button type="button" class="RoleOfrelated btn   btn-warning">查看关联</button>'
        ].join('');
    }


    function addParent() {
        var productId = localStorage.getItem("proid");
        $("#addModal").modal('show');
        add1(productId);
    }

    //初始化操作按钮的方法
    window.operateEvents = {
        'click .RoleOfadd': function (e, value, row, index) {
            $("#addModal").modal('show');
            add(row.id, row.productId);
        },
        'click .RoleOfrelated': function (e, value, row, index) {
            findRelated(row.id, row.productId, row.versionCode);
        },
        // 'click .RoleOfmore': function (e, value, row, index) {
        //     more(row.id, row.versionCode);
        // },
        'click .RoleOfdelete': function (e, value, row, index) {
            del(row.id);
        },
        'click .RoleOfedit': function (e, value, row, index) {
            $("#updateModal").modal('show');
            // update(row.id);
            $("#id").val(row.id);
            $("#versionName1").val(row.versionName);
            $("#versionCode1").val(row.versionCode);
            $("#createTime1").val(row.createTime);
            $("#url1").val(row.url);
            $("#fileName1").val(row.fileName);
            $("#parentId1").val(row.parentId);
            $("#productId1").val(row.productId);
            // $("#label1").val(row.label);
            findlabel(row.id);
        },
    };
// window.labelEvents={
//     'click .RoleOflabel': function (e, value, row, index) {
//         findlabel(row.id);
//         // row.label = findlabel1(row.id);
//     },
// };
function findlabel(id) {
    $.ajax(
        {
            url: "../label/getLabel",
            data: {"versionId": id},
            type: "get",
            success: function (data) {
                if (data.code == 1) {
                    console.log(data);
                    var label = data.data.label.label;
                    console.log(label);
                    $("#label1").val(label);
                    console.log('操作成功');
                } else {
                    console.log('操作失败');
                }
            },
            error: function () {
                console.log('请求出错');
            },
            complete: function () {
            }
        });
}
    // function findlabel1(id) {
    // var label = "";
    //     $.ajax(
    //         {
    //             url: "/label/getLabel",
    //             data: {"versionId": id},
    //             type: "get",
    //             success: function (data) {
    //                 if (data.code == 1) {
    //                     console.log(data);
    //                     label = data.data.label.label;
    //                     if (data.data.label.label==null) {
    //                         label = "无标签";
    //                     }
    //                     console.log(label);
    //                     console.log('操作成功');
    //                 } else {
    //                     console.log('操作失败');
    //                 }
    //             },
    //             error: function () {
    //                 console.log('请求出错');
    //             },
    //             complete: function () {
    //             }
    //         });
    //     return label;
    // }
</script>
<script>


    function add(id, productId) {
        console.log("add 方法 , parentId = " + parentId, "productId = " + productId);
        $("#parentId").val(id);
        $("#productId").val(productId);
        // getLabel();
    }

    function add1(productId) {
        console.log("add 方法 , productId = " + productId);
        $("#parentId").val(null);
        $("#productId").val(productId);
        // getLabel();
    }

    function del(id) {
        console.log("del 方法 , id = " + id);
        $.ajax(
            {
                url: "../version/del",
                data: {"id": id},
                type: "post",
                success: function (data) {
                    if (data.code == 1) {
                        alert('操作成功');
                        location.reload();
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

    }


    // function update(id) {
    //     console.log("update 方法 , id = " + id);
    //     $.ajax(
    //         {
    //             url: "/version/findById",
    //             data: {"id": id},
    //             type: "get",
    //             // contentType: 'application/json;charset=UTF-8',
    //             beforeSend: function () {
    //                 $("#tip").html("<span style='color:blue'>正在处理...</span>");
    //             },
    //             success: function (res) {
    //                 if (res.code==1) {
    //                     var data = res.data.version
    //                     $("#id").val(data.id);
    //                     $("#versionName1").val(data.versionName);
    //                     $("#versionCode1").val(data.versionCode);
    //                     $("#createTime1").val(data.createTime);
    //                     $("#url1").val(data.url);
    //                     $("#fileName1").val(data.fileName);
    //                     $("#parentId1").val(data.parentId);
    //                     $("#productId1").val(data.productId);
    //                     $("#label1").val(data.label);
    //                 } else {
    //                     $("#tip").html("<span style='color:red'>失败，请重试</span>");
    //                     //  alert('操作失败');
    //                 }
    //             },
    //             error: function () {
    //                 alert('请求出错');
    //             },
    //             complete: function () {
    //                 $('#tips').hide();
    //             }
    //         });
    // }

    // 修改
    function update_form() {
        // var d = {};
        // var t = $('#update_data').serializeArray();
        // $.each(t, function () {
        //     d[this.name] = this.value;
        //     console.log(d)
        // });
        // console.log(JSON.stringify(d));
        var updateData = new FormData($("#update_data")[0]);
        console.log("update=",updateData);
        // 异步提交数据
        $.ajax({
            url: "../version/update",
            // contentType: 'application/json;charset=UTF-8',
            // data: JSON.stringify(d),
            data: updateData,
            type: "post",
            cache: false,
            dataType: 'json',
            contentType: false, //不设置内容类型
            processData: false, //不处理数据
            beforeSend: function () {
                $("#tip1").html("<span style='color:blue'>正在处理...</span>");
                return true;
            },
            success: function (data) {
                if (data.code == 1) {

                    var msg = "操作";
                    $("#tip1").html("<span style='color:blueviolet'>恭喜，" + msg + "成功！</span>");
                    alert(msg + "OK！");
                    location.reload();
                } else {
                    $("#tip1").html("<span style='color:red'>失败，请重试</span>");
                    alert('操作失败');
                }
            },
            error: function () {
                alert('请求出错');
            },
            complete: function () {
                $('#tip1').hide();
            }
        });

        return false;
    }

    function add_form() {
        var uploadFile = new FormData($("#form_data")[0]);
        console.log("addData",uploadFile);
        $.ajax({
            url: "../version/add",
            type: "post",
            data: uploadFile,
            cache: false,
            dataType: 'json',
            contentType: false, //不设置内容类型
            processData: false, //不处理数据
            beforeSend: function () {
                $("#tip").html("<span style='color:blue'>正在处理...</span>");
                return true;
            },
            success: function (data) {
                if (data.code == 1) {
                    alert("OK！");
                    console.log("=======", data);
                }
            },
            error: function () {
                alert('请求出错');
            }
        });
        return false;
    }


    function getLabel() {
        console.log("走getLabel方法");
        $("#label").empty();
        $.ajax({
            url: '../label/allLabel',
            dataType: 'json',
            type: 'get',
            success: function (data) {
                if (data.code == 1) {
                    console.log(data)
                    var list = data.data.labelList
                    var str = "";
                    for (var i = 0; i < list.length; i++) {
                        str += "<option value=" + list[i].labelName + ">" + list[i].labelName + "</option>";
                    }
                    $("#label").append("<option value=\"\">--选择标签--</option>" + str);
                } else {
                    console.log("失败")
                }
            },
            error: function () {
                alert('请求出错');
            },
        })
    }

    function getLabel1() {
        console.log("走getLabel方法");
        $("#label1").empty();
        $.ajax({
            url: '../label/allLabel',
            dataType: 'json',
            type: 'get',
            success: function (data) {
                if (data.code == 1) {
                    console.log(data)
                    var list = data.data.labelList
                    var str = "";
                    for (var i = 0; i < list.length; i++) {
                        str += "<option value=" + list[i].labelName + ">" + list[i].labelName + "</option>";
                    }
                    $("#label1").append("<option value=\"\">--选择标签--</option>" + str);
                } else {
                    console.log("失败")
                }
            },
            error: function () {
                alert('请求出错');
            },
        })
    }

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

    $('#addModal').on('hidden.bs.modal', function () {
        $('#form_data')[0].reset();
    });

</script>

</html>
