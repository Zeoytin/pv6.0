package com.pv.productversion.controller;

import com.alibaba.fastjson.JSONArray;
import com.pv.productversion.entity.Role;
import com.pv.productversion.service.RoleService;
import com.pv.productversion.util.ResultUtil;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @program: pv3.0
 * @Date: 2019/4/2 17:14
 * @Author: Zhaoyt
 * @Description:
 */
@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    @ApiOperation(value = "跳转角色页面", notes = "角色页面")
    @RequestMapping(value = "/query", method = RequestMethod.GET)
    public String queryRoles() {
        return "urp/role";
    }

    @RequiresPermissions("select")
    @ApiOperation(value = "获取角色列表", notes = "分页查询获取角色信息")
    @RequestMapping(value = "/roleList", method = RequestMethod.GET)
    @ResponseBody
    public ResultUtil roleList() {
        List<Role> list = roleService.selectAll();
        return ResultUtil.success().add("rows", list).add("total", list.size());
    }

    @RequiresPermissions("insert")
    @ApiOperation(value = "添加角色", notes = "添加角色")
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil addRole(@RequestBody Role role) {
        if (role != null) {
            roleService.insert(role);
            return ResultUtil.success();
        }
        return ResultUtil.error("添加失败");
    }

    @RequiresPermissions("update")
    @ApiOperation(value = "修改角色", notes = "修改角色")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil updateRole(@RequestBody Role role) {
        if (role != null) {
            roleService.update(role);
            return ResultUtil.success();
        }
        return ResultUtil.error("修改失败");
    }

    @RequiresPermissions("delete")
    @ApiOperation(value = "删除角色", notes = "根据选中的ids批量删除角色")
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil deleteRole(@RequestParam("str") String str) {
        if (str != null && str.length() != 0) {
            JSONArray jsons = JSONArray.parseArray(str);
            for (Object object : jsons) {
                Integer id = Integer.parseInt(object.toString());
                roleService.delete(id);
            }
            return ResultUtil.success();
        }
        return ResultUtil.error("删除失败");
    }

    @RequiresPermissions("select")
    @ApiOperation(value = "根据角色ID查询权限")
    @RequestMapping(value = "/findPermissionByRoleId", method = RequestMethod.GET)
    @ResponseBody
    public ResultUtil findPermissionByRoleId(@RequestParam("rid") Integer rid) {
        List permissions = roleService.findPermissionByRoleId(rid);
        if (permissions.size() > 0) {
            return ResultUtil.success().add("permissions", permissions);
        }
        return ResultUtil.error("没有权限");
    }

    @RequiresPermissions("insert")
    @ApiOperation(value = "给角色分配权限")
    @RequestMapping(value = "/setPermission", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil setPermission(@RequestParam("rid")Integer rid, @RequestParam("pids")String pids) {
        int result = roleService.setPermissionForRole(rid, pids);
        if (result > 0) {
            return ResultUtil.success();
        }
        return ResultUtil.error("分配失败");
    }
    @RequiresPermissions("delete")
    @ApiOperation(value = "清空权限")
    @RequestMapping(value = "/cleanPermission", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil cleanPermission(@RequestParam("rid") Integer rid) {
        int result = roleService.cleanRolePermission(rid);
        if (result > 0) {
            return ResultUtil.success();
        }
        return ResultUtil.error("清空失败");
    }
}
