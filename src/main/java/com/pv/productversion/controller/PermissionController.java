package com.pv.productversion.controller;

import com.alibaba.fastjson.JSONArray;
import com.pv.productversion.entity.Permission;
import com.pv.productversion.service.PermissionService;
import com.pv.productversion.util.ResultUtil;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @program: pv3.0
 * @Date: 2019/4/3 13:44
 * @Author: Zhaoyt
 * @Description:
 */
@Controller
@RequestMapping("/permission")
public class PermissionController {
    @Autowired
    private PermissionService permissionService;

    @ApiOperation(value = "跳转权限页面", notes = "权限页面")
    @RequestMapping(value = "/query", method = RequestMethod.GET)
    public String queryPermissions() {
        return "urp/permission";
    }

    @RequiresPermissions("select")
    @ApiOperation(value = "获取权限列表", notes = "分页查询获取权限信息")
    @RequestMapping(value = "/permissionList", method = RequestMethod.GET)
    @ResponseBody
    public ResultUtil permissionList() {
        List<Permission> list = permissionService.selectAll();
        return ResultUtil.success().add("rows", list).add("total", list.size());
    }

    @RequiresPermissions("insert")
    @ApiOperation(value = "添加权限", notes = "添加权限")
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil addPermission(@RequestBody Permission permission) {
        if (permission != null) {
            permissionService.insert(permission);
            return ResultUtil.success();
        }
        return ResultUtil.error("添加失败");
    }
    @RequiresPermissions("update")
    @ApiOperation(value = "修改权限", notes = "修改权限")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil updatePermission(@RequestBody Permission permission){
        if (permission!=null){
            permissionService.update(permission);
            return ResultUtil.success();
        }
        return ResultUtil.error("修改失败");
    }
    @RequiresPermissions("delete")
    @ApiOperation(value = "删除权限", notes = "根据选中的ids批量删除权限")
    @RequestMapping(value = "/del",method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil deletePermission(@RequestParam("str") String str) {
        if (str != null && str.length() != 0) {
            JSONArray jsons = JSONArray.parseArray(str);
            for (Object object : jsons) {
                Integer id = Integer.parseInt(object.toString());
                permissionService.delete(id);
            }
            return ResultUtil.success();
        }
        return ResultUtil.error("删除失败");
    }
}
