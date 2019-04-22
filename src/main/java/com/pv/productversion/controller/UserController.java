package com.pv.productversion.controller;

import com.alibaba.fastjson.JSONArray;
import com.pv.productversion.entity.User;
import com.pv.productversion.service.RoleService;
import com.pv.productversion.service.UserService;
import com.pv.productversion.util.ResultUtil;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @program: pv3.0
 * @Date: 2019/4/2 14:55
 * @Author: Zhaoyt
 * @Description:
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;

    @ApiOperation(value = "跳转用户页面", notes = "用户页面")
    @RequestMapping(value = "/query",method = RequestMethod.GET)
    public String queryUsers() {
        return "urp/user";
    }

    @RequiresPermissions("select")
    @ApiOperation(value = "获取用户列表", notes = "分页查询获取用户信息")
    @RequestMapping(value = "/userList", method = RequestMethod.GET)
    @ResponseBody
    public ResultUtil userList() {
        List<User> list = userService.selectAll();
        return ResultUtil.success().add("rows", list).add("total", list.size());
    }

    @RequiresPermissions("insert")
    @ApiOperation(value = "添加用户", notes = "添加用户")
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil addUser(@RequestBody User user) {
        if (user != null) {
            userService.insert(user);
            return ResultUtil.success();
        }
        return ResultUtil.error("添加失败");
    }

    @RequiresPermissions("update")
    @ApiOperation(value = "修改用户", notes = "修改用户")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil updateUser(@RequestBody User user) {
        if (user != null) {
            userService.update(user);
            return ResultUtil.success();
        }
        return ResultUtil.error("修改失败");
    }

    @RequiresPermissions("delete")
    @ApiOperation(value = "删除用户", notes = "根据选中的ids批量删除用户")
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil deleteUser(@RequestParam("str") String str) {
        if (str != null && str.length() != 0) {
            JSONArray jsons = JSONArray.parseArray(str);
            for (Object object : jsons) {
                Integer id = Integer.parseInt(object.toString());
                userService.delete(id);
            }
            return ResultUtil.success();
        }
        return ResultUtil.error("删除失败");
    }

    @RequiresPermissions("insert")
    @ApiOperation(value = "给用户分配角色")
    @RequestMapping(value = "/setRole", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil setRole(@RequestParam("uid") Integer uid,@RequestParam("rids") String rids) {
        int result = userService.setRoleForUser(uid, rids);
        if (result > 0) {
            return ResultUtil.success();
        }
        return ResultUtil.error("分配失败");
    }

    @RequiresPermissions("delete")
    @ApiOperation(value = "清空角色")
    @RequestMapping(value = "/cleanRole", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil cleanRole(@RequestParam("uid") Integer uid) {
        int result = userService.cleanUserRole(uid);
        if (result > 0) {
            return ResultUtil.success();
        }
        return ResultUtil.error("清空失败");
    }

    @RequiresPermissions("select")
    @ApiOperation(value = "根据用户ID查询角色")
    @RequestMapping(value = "/findRoleByUserId", method = RequestMethod.GET)
    @ResponseBody
    public ResultUtil findRoleByUserId(@RequestParam("uid") Integer uid) {
        List roles = userService.findRoleByUserId(uid);
        if (roles.size() > 0) {
            return ResultUtil.success().add("roles", roles);
        }
        return ResultUtil.error("没有角色");
    }

    @RequiresPermissions("select")
    @ApiOperation(value = "查询用户对应角色以及角色对应权限")
    @RequestMapping(value = "/selectURP", method = RequestMethod.GET)
    @ResponseBody
    public ResultUtil selectURP(@RequestParam("id") Integer id) {
        User user = userService.selectURP(id);
        if (user != null) {
            return ResultUtil.success().add("user", user);
        }
        return ResultUtil.error("无数据");
    }

}
