
<html>
<head>
    <title>关联</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.bootcss.com/zTree.v3/3.5.29/css/zTreeStyle/zTreeStyle.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/zTree.v3/3.5.29/js/jquery.ztree.all.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="../css/myztree.css">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>关联管理系统</h1>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h2 id="param"></h2>
                <h3>关联列表</h3>
                <button type="button" class="btn btn-success" onclick="return addParentRelated()">
                    新增关联
                </button>&nbsp;&nbsp;
                <button type="button" class="btn btn-success" onclick="javascript :history.back(-1);">返回上一页</button>&nbsp;&nbsp;
                <button type="button" class="btn btn-warning" onclick="window.location.href='../index'">返回首页</button>
            </div>
        </div>
    </div>
</div>
<div class="zTreeDemoBackground left">
    <ul id="dataTree" class="ztree"></ul>
</div>
<!-- 模态框示例（Modal） -->
<form method="post" action="" class="form-horizontal" role="form" id="form_data1" onsubmit="return add_related1()"
      style="margin: 20px;">
    <div class="modal fade" id="addRelated1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel1">
                        新增关联
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">产品名称</label>
                            <div class="col-sm-9">
                                <select name="name" id="name1" class="selectpicker form-control">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="versionCode2" class="col-sm-3 control-label">版本号</label>
                            <div class="col-sm-9">
                                <select name="versionCode" id="versionCode1" class="selectpicker form-control">
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
                    <span id="tip1"> </span>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</form>
<!-- 模态框示例（Modal） -->
<form method="post" action="" class="form-horizontal" role="form" id="form_data2" onsubmit="return add_related()"
      style="margin: 20px;">
    <div class="modal fade" id="addRelated" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel2">
                        新增关联
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">产品名称</label>
                            <div class="col-sm-9">
                                <select name="name" id="name" class="selectpicker form-control">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="versionCode2" class="col-sm-3 control-label">版本号</label>
                            <div class="col-sm-9">
                                <select name="versionCode" id="versionCode2" class="selectpicker form-control">
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
                    <span id="tip2"> </span>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</form>

</body>
<script>
    $(document).ready(function () {
        var versionId = localStorage.getItem("versionId3");
        var versionCode = localStorage.getItem("versionCode3");
        var proname = localStorage.getItem("proname");
        var propaltform = localStorage.getItem("propaltform");
        console.log(versionId);
        $("#param").html(proname + "(" + propaltform + ")" + versionCode);
    });
    var zTreeNodes = (function () {
        var result;
        var versionId = localStorage.getItem("versionId3");
        console.log(versionId);
        $.ajax({
            // url: '/version/relatedTest',
            // url: '/version/treeRelated',
            url: '../version/related',
            type: 'get',
            dataType: 'json',
            async: false,
            data: {
                "versionId": versionId
            },
            error: function (data) {
                console.log(data);
            },
            success: function (res) {
                console.log("关联数据",res);
                var data = res.data.list;
                getName(data)
                result = data;
                console.log("result===========", result)
            }
        });
        return result;
    })();
    $(function () {
        //初始化数据
        console.log("zTreeNodes=====", zTreeNodes)
        $.fn.zTree.init($("#dataTree"), setting, zTreeNodes);
        //添加表头
        var li_head = ' <li class="head"><div class="diy">名称</div><div class="diy">平台</div><div class="diy">版本号</div>' +
            '<div style="display:none;">ID</div><div class="diy">操作</div></li>';
        // var li_head = ' <li class="head"><a><div class="diy">名称</div><div class="diy">平台</div><div class="diy">版本号</div>' +
        //     '<div style="display:none;">ID</div><div class="diy">操作</div></a></li>';
        var rows = $("#dataTree").find('li');
        if (rows.length > 0) {
            rows.eq(0).before(li_head)
        } else {
            $("#dataTree").append(li_head);
            $("#dataTree").append('<li ><div style="text-align: center;line-height: 30px;" >无符合条件数据</div></li>')
        }
    });

    function getName(data) {
        for (var j = 0; j < data.length; j++) {
            // data[j]['name'] = data[j].product.name+"("+data[j].product.paltform+")"+data[j].version.versionCode
            data[j]['name'] = data[j].product.name;
            if (data[j].children != undefined && data[j].children.length > 0) {
                getName(data[j].children)
            }
        }
    }

    var setting = {
        view: {
            showLine: false,
            showIcon: false,
            addDiyDom: addDiyDom
        }
    };

    function addDiyDom(treeId, treeNode) {
        var spaceWidth = 30;
        var liObj = $("#" + treeNode.tId);
        var aObj = $("#" + treeNode.tId + "_a");
        var switchObj = $("#" + treeNode.tId + "_switch");
        var icoObj = $("#" + treeNode.tId + "_ico");
        var spanObj = $("#" + treeNode.tId + "_span");
        aObj.attr('title', '');
        aObj.append('<div class="diy swich"></div>');
        var div = $(liObj).find('div').eq(0);
        switchObj.remove();
        spanObj.remove();
        icoObj.remove();
        div.append(switchObj);
        div.append(spanObj);
        var spaceStr = "<span style='height:1px;display: inline-block;width:" + (spaceWidth * treeNode.level) + "px'></span>";
        switchObj.before(spaceStr);
        var editStr = '';
        editStr += '<div class="diy">' + (treeNode.product.paltform == null ? ' ' : treeNode.product.paltform) + '</div>';
        editStr += '<div class="diy">' + (treeNode.versionCode == null ? ' ' : treeNode.versionCode) + '</div>';
        editStr += '<div style="display:none;">' + (treeNode.id == null ? ' ' : treeNode.id) + '</div>';
        editStr += '<div class="diy">' + formatHandle(treeNode) + '</div>';
        aObj.append(editStr);
    }

    function formatHandle(treeNode) {
        var versionId = localStorage.getItem("versionId3");
        var htmlStr = '';
        if (versionId == treeNode.id) {
            htmlStr += '<div class="icon_div"><input type="button" class="ck" onclick="doMore(\'' + treeNode.id + '\',\'' + treeNode.name + '\',\'' + treeNode.product.paltform + '\',\'' + treeNode.versionCode + '\')" value="查看详情"/></div>';
            htmlStr += '<div class="icon_div"><input type="button" class="ck" onclick="doAdd(\'' + treeNode.id + '\',\'' + treeNode.product.id + '\')" value="添加子关联"/></div>';
        } else {
            htmlStr += '<div class="icon_div"><input type="button" class="ck" onclick="doMore(\'' + treeNode.id + '\',\'' + treeNode.name + '\',\'' + treeNode.product.paltform + '\',\'' + treeNode.versionCode + '\')" value="查看详情"/></div>';
            htmlStr += '<div class="icon_div"><input type="button" class="ck" onclick="doAdd(\'' + treeNode.id + '\',\'' + treeNode.product.id + '\')" value="添加子关联"/></div>';
            htmlStr += '<div class="icon_div"><input type="button" class="ck" onclick="doDelete(\'' + treeNode.id + '\',\'' + getCurrentRoot(treeNode) + '\')" value="删除"/></div>';
        }

        return htmlStr;

        // htmlStr += '<div class="icon_div"><a class="icon_add" title="添加子部门" href="javascript:addSector(\'' + treeNode.id + '\')">添加子部门</a></div>';
        // htmlStr += '<div class="icon_div"><a class="icon_del" title="删除" href="javascript:del(\'' + treeNode.id + '\')">删除</a></div>';
        // return htmlStr;
    }

    function doAdd(versionId2, productId) {
        console.log('添加子关联：' + versionId2);
        console.log(versionId2, "productId=", productId)
        localStorage.setItem("versionId2", versionId2);
        // localStorage.setItem("parentId", id);
        if (productId != null) {
            console.log("productId");
            getProduct(productId);
        }
        $("#addRelated").modal('show');
    }

    function getCurrentRoot(treeNode) {
        if (treeNode.getParentNode() != null) {
            var parentNode = treeNode.getParentNode();
            return getCurrentRoot(parentNode);
        } else {
            return treeNode.id;
        }
    }

    function doDelete(id, e) {
        console.log('删除：' + id);
        var parentNode = e;
        console.log('parentNode=' + parentNode);

        $.ajax(
            {
                url: "../version/deleteRelated",
                data: {
                    "versionId": id,
                    "parentId": parentNode
                },
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

    function addParentRelated() {
        $("#addRelated1").modal('show');
        var productId = localStorage.getItem("productId3");
        console.log(productId)
        getProduct(productId);
    }

    //----下拉框-----start
    function getProduct(productId) {
        console.log("走getProduct方法");
        $("#name").empty();
        $("#name1").empty();
        $.ajax({
            url: '../product/listProduct',
            data: {"id": productId},
            dataType: 'json',
            type: 'get',
            success: function (res) {
                if (res) {
                    console.log("产品列表除本身",res)
                    var data = res.data.list
                    var str = "";
                    for (var i = 0; i < data.length; i++) {
                        str += "<option value=" + data[i].id + ">" + data[i].name + "(" + data[i].paltform + ")" + "</option>";
                    }
                    $("#name").append("<option value=\"\">--选择产品名称--</option>" + str);
                    $("#name1").append("<option value=\"\">--选择产品名称--</option>" + str);
                } else {
                    console.log("失败")
                }
            },
            error: function () {
                alert('请求出错');
            },

        })
    }

    $("#name").change(function () {
        console.log("111");
        var id = $(this).find("option:selected").val();
        getVersionCode(id);
    })
    $("#name1").change(function () {
        console.log("222");
        var id = $(this).find("option:selected").val();
        getVersionCode(id);
    })

    function getVersionCode(id) {
        $("#versionCode1").empty();
        $("#versionCode2").empty();
        console.log("走getVersionCode方法");
        $.ajax({
            url: '../version/versionList',
            dataType: 'json',
            type: 'get',
            data: {"productId": id},
            success: function (res) {
                if (res) {
                    console.log("版本列表",res)
                    var data = res.data.versions
                    var str2 = "";
                    for (var i = 0; i < data.length; i++) {
                        str2 += "<option value=" + data[i].id + ">" + data[i].versionCode + "</option>";
                    }
                    $("#versionCode2").append(" <option value=\"\">--选择产品平台--</option>" + str2);
                    $("#versionCode1").append(" <option value=\"\">--选择产品平台--</option>" + str2);

                } else {
                    console.log("失败")
                }

            },
            error: function () {
                alert('请求出错');
            },
        })
    }

    //-------下拉框----------end
    //提交增加的关联
    function add_related() {
        var versionId = $("#versionCode2").val();
        // var parentId = localStorage.getItem("parentId");
        var parentId = localStorage.getItem("versionId2");
        console.log("versionId=", versionId, "parentId=", parentId);
        $.ajax({
            url: "../version/makeRelated",
            // contentType: 'application/json;charset=UTF-8',
            data: {
                "versionId": versionId,
                "parentId": parentId
            },
            type: "post",
            beforeSend: function () {
                $("#tip2").html("<span style='color:blue'>正在处理...</span>");
                return true;
            },
            success: function (data) {
                if (data.code == 1) {

                    var msg = "关联";
                    $("#tip2").html("<span style='color:blueviolet'>恭喜，" + msg + "成功！</span>");
                    alert(msg + "OK！");
                    location.reload();
                } else {
                    $("#tip2").html("<span style='color:red'>失败，请重试</span>");
                    alert('操作失败');
                }
            },
            error: function () {
                alert('请求出错');
            },
            complete: function () {
                $('#tip2').hide();
            }
        });
        return false;
    }

    function add_related1() {
        var versionId = $("#versionCode1").val();
        // var parentId = localStorage.getItem("parentId");
        var parentId = localStorage.getItem("versionId3");
        console.log("versionId=", versionId, "parentId=", parentId);
        $.ajax({
            url: "../version/makeRelated",
            // contentType: 'application/json;charset=UTF-8',
            data: {
                "versionId": versionId,
                "parentId": parentId
            },
            type: "post",
            beforeSend: function () {
                $("#tip2").html("<span style='color:blue'>正在处理...</span>");
                return true;
            },
            success: function (data) {
                if (data.code == 1) {

                    var msg = "关联";
                    $("#tip2").html("<span style='color:blueviolet'>恭喜，" + msg + "成功！</span>");
                    alert(msg + "OK！");
                    location.reload();
                } else {
                    $("#tip2").html("<span style='color:red'>失败，请重试</span>");
                    alert('操作失败');
                }
            },
            error: function () {
                alert('请求出错');
            },
            complete: function () {
                $('#tip2').hide();
            }
        });
        return false;
    }

    function doMore(rversionId, rname, rpaltform, rversionCode) {
        if (rversionId != null) {
            localStorage.setItem("rname", rname);
            localStorage.setItem("rpaltform", rpaltform);
            localStorage.setItem("rversionCode", rversionCode);
            localStorage.setItem("rversionId", rversionId);
            // window.location.href = "/description/listDescription/" + rversionId;
            window.location.href = "../description/query";

        }

    }
</script>
</html>