package com.pv.productversion.controller;

import com.alibaba.fastjson.JSONArray;
import com.pv.productversion.entity.Description;
import com.pv.productversion.entity.Type;
import com.pv.productversion.service.DescriptionService;
import com.pv.productversion.util.ResultUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/description")
@Api(tags = "description-Controller")
public class DescriptionController {
    @Autowired
    private DescriptionService descriptionService;

    //@ApiOperation(value = "获取描述列表", notes = "获取描述信息")
    //@RequestMapping("/listDescription/{versionId}")
    //public String descriptionList(Model model, @PathVariable("versionId") Long versionId) {
    //    List<Description> descriptionList =descriptionService.listDescription(versionId);
    //    model.addAttribute("descriptionList",descriptionList);
    //    return "version/description";
    //}
    @RequiresPermissions("select")
    @ApiOperation(value = "跳转描述页面", notes = "描述页面")
    @RequestMapping(value = "/query", method = RequestMethod.GET)
    public String queryDescriptions() {
        return "description/query";
    }

    @RequiresPermissions("select")
    @ApiOperation(value = "跳转描述页面", notes = "描述页面")
    @RequestMapping(value = "/toType", method = RequestMethod.GET)
    public String toType() {
        return "description/type";
    }

    @RequiresPermissions("select")
    @ApiOperation(value = "描述列表页面", notes = "描述列表页面")
    @RequestMapping(value = "/listDescriptions", method = RequestMethod.GET)
    @ResponseBody
    public ResultUtil descriptionList(@RequestParam("versionId") Long versionId, @RequestParam(value = "type", required = false) String type, @RequestParam("pageSize") int pageSize, @RequestParam("pageNumber") int pageNumber) {
        if (pageNumber <= 1) {
            pageNumber = 1;
        }
        int beginNumber = (pageNumber - 1) * pageSize;
        List<Description> descriptionList = descriptionService.listDescription(versionId, type, pageSize, beginNumber);
        int total = descriptionService.count(versionId, type);
        return ResultUtil.success().add("rows", descriptionList).add("total", total);
    }

    @RequiresPermissions("insert")
    @ApiOperation(value = "增加描述", notes = "传描述对象json增加描述")
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil addDescription(@RequestBody Description description) {
        if (description != null) {
            descriptionService.insert(description);
            return ResultUtil.success();
        }
        return ResultUtil.error("保存失败");
    }

    @RequiresPermissions("delete")
    @ApiOperation(value = "删除描述", notes = "根据id删除描述")
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil deleteDescription(@RequestParam("str") String str) {
        if (str != null && str.length() != 0) {
            JSONArray jsons = JSONArray.parseArray(str);
            for (Object object : jsons) {
                Long id = Long.parseLong(object.toString());
                descriptionService.delete(id);
            }
            return ResultUtil.success();
        }

        return ResultUtil.error("删除失败");
    }

    @RequiresPermissions("update")
    @ApiOperation(value = "修改描述", notes = "传描述对象json修改描述")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil updateDescription(@RequestBody Description description) {
        if (description != null) {
            System.out.println("description=" + description);
            descriptionService.update(description);
            return ResultUtil.success();
        }
        return ResultUtil.error("修改失败");
    }

    @RequiresPermissions("select")
    @ApiOperation(value = "查询描述信息", notes = "根据id来获取描述信息")
    @RequestMapping(value = "/findById", method = RequestMethod.GET)
    @ResponseBody
    public ResultUtil findProduct(@RequestParam("id") Long id) {
        if (id != null) {
            Description description = descriptionService.getDescriptionById(id);
            return ResultUtil.success().add("description", description);
        }
        return ResultUtil.error("查询失败");
    }

    @RequiresPermissions("select")
    @ApiOperation(value = "查询描述类型", notes = "获取描述类型")
    @RequestMapping(value = "/findType", method = RequestMethod.GET)
    @ResponseBody
    public ResultUtil findType() {
        List<Type> typeList = descriptionService.typeList();
//        int total = descriptionService.count();
        if (typeList.size() != 0) {
            return ResultUtil.success().add("typeList", typeList);

        }
        return ResultUtil.error("暂无类型");
    }

    @RequiresPermissions("insert")
    @ApiOperation(value = "新增类型", notes = "新增描述类型")
    @RequestMapping(value = "/addType", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil addType(@RequestBody Type type) {
        if (type != null) {
            descriptionService.addType(type);
            return ResultUtil.success();
        }
        return ResultUtil.error("保存失败");
    }

    @RequiresPermissions("update")
    @ApiOperation(value = "修改类型", notes = "修改描述类型")
    @RequestMapping(value = "updateType", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil updateType(@RequestBody Type type) {
        if (type != null) {
            descriptionService.updateType(type);
            return ResultUtil.success();
        }
        return ResultUtil.error("修改失败");
    }

    @RequiresPermissions("delete")
    @ApiOperation(value = "删除类型", notes = "根据ID删除描述类型")
    @RequestMapping(value = "/delType", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil delType(@RequestParam("str") String str) {
        if (str != null && str.length() != 0) {
            JSONArray jsons = JSONArray.parseArray(str);
            for (Object object : jsons) {
                Long id = Long.parseLong(object.toString());
                descriptionService.delType(id);
            }
            return ResultUtil.success();
        }
        return ResultUtil.error("删除失败");
    }
}
