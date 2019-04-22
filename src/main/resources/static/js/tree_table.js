var tree;
$(function () {
    var oTable = new TableInit();
    oTable.Init();
    $("#expandAllTree").on('click', function () {
        if ($("#expandAllTree").val() == '展开所有') {
            $('#tree_table').bootstrapTable("expandAllTree")//展开\
            $("#expandAllTree").val('折叠所有')
        } else {
            $('#tree_table').bootstrapTable("collapseAllTree")//折叠
            $("#expandAllTree").val('展开所有')
        }
    })

});


var TableInit = function () {

    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        var versionId = localStorage.getItem("versionId3");
        $.ajax({
            url: '/version/getRelated',
            data:{"versionId":versionId},
            method: 'post',
            dataType: 'json',
            async: false,
            success: function (data) {
                console.log(data);
                tree = JSON.stringify(data)
            }
        })
        $('#tree_table').bootstrapTable({
            class: 'table table-hover table-bordered',
            data: eval(tree),
            pagination: false,
            treeView: true,
            striped: true,   //是否各行渐变色
            bordered: true,  //是否显示边框
            treeId: "id",
            treeField: "name",
            columns: [
                {field: 'name', title: '产品名称'},
                {field: 'id', title: '关联ID',visible: false},
                {field: 'product_id', title: '产品ID',visible: false},
                {field: 'paltform', title: '平台'},
                {field: 'version_id', title: '版本ID',visible: false},
                {field: 'version_name', title: '版本名称'},
                {field: 'version_code', title: '版本号'},
                {field: 'create_time', title: '发版时间', formatter: 'timeFormatter'},
                {field: 'parent_id', title: '父ID',visible: false},
                {
                    title: '操作',
                    formatter: function (value, row) {
                        a = '<button class="btn btn-primary"  data-toggle="modal" data-target="#addeventModal"' +
                            ' onclick="addRelated(' + row.id + ',' + row.version_id + ','+row.product_id+')" >添加子关联</button>　'
                        if (row.type == 'X') {
                            a = ""
                        }
                        b = '<button class="btn btn-danger"   data-toggle="modal" data-target="#delModal"' +
                            ' onclick="delRelated(' + row.id + ')"' +
                            ' >删除</button>　'
                        return a + b
                    }
                },
            ],

        });
    }
    return oTableInit;
};
function addR(id) {
    console.log("添加子关联的id=",id);
}
function deleteR(id) {
    console.log("删除的id=",id);
    $.ajax(
        {
            url: "/version/deleteRelated",
            data: {"id": id},
            type: "post",
            success: function (data) {
                if (data == "删除成功") {
                    alert('操作成功');
                    location.reload();
                }
                else {
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