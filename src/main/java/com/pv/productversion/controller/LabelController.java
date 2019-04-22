package com.pv.productversion.controller;

import com.alibaba.fastjson.JSONArray;
import com.pv.productversion.entity.Label;
import com.pv.productversion.entity.VersionLabel;
import com.pv.productversion.service.LabelService;
import com.pv.productversion.util.ResultUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Api(tags = "label-Controller")
@Controller
@RequestMapping("/label")
public class LabelController {
    @Autowired
    private LabelService labelService;
    @RequiresPermissions("select")
    @ApiOperation(value = "跳转描述页面", notes = "描述页面")
    @RequestMapping(value = "/toLabel", method = RequestMethod.GET)
    public String toLabel() {
        return "version/label";
    }

    //列出所有标签
    @RequiresPermissions("select")
    @ApiOperation(value = "获取所有标签", notes = "获取所有标签")
    @RequestMapping(value = "/allLabel", method = RequestMethod.GET)
    @ResponseBody
    public ResultUtil allLabel() {
        List<Label> list = labelService.allLabel();
//        int total = labelService.count();
        if (list.size() != 0) {
            return ResultUtil.success().add("labelList", list);
        }
        return ResultUtil.error("暂无标签");
    }

    //获取版本的标签
    @RequiresPermissions("select")
    @ApiOperation(value = "获取版本的标签", notes = "根据版本ID获取版本标签")
    @RequestMapping(value = "/getLabel", method = RequestMethod.GET)
    @ResponseBody
    public ResultUtil getLabel(@RequestParam("versionId") Long versionId) {
        return ResultUtil.success().add("label", labelService.getLabel(versionId));
    }

    //新增版本标签
    @RequiresPermissions("insert")
    @ApiOperation(value = "新增版本标签", notes = "新增版本标签")
    @RequestMapping(value = "addVersionLabel", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil addLabel(@RequestBody VersionLabel versionLabel) {
        if (versionLabel != null) {
            labelService.addLabel(versionLabel);
            return ResultUtil.success();
        }
        return ResultUtil.error("保存失败");
    }

    //根据id删版本标签
//    @RequestMapping(value = "deleteLabel", method = RequestMethod.POST)
//    public ResultUtil deleteLabel(@RequestParam Long id) {
//        if (id != null) {
//            labelService.deleteLabel(id);
//            return ResultUtil.success();
//        }
//        return ResultUtil.error("删除失败");
//    }

    //修改版本标签
    @RequiresPermissions("update")
    @ApiOperation(value = "修改版本标签", notes = "修改版本标签")
    @RequestMapping(value = "updateVersionLabel", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil updateLabel(@RequestBody VersionLabel versionLabel) {
        if (versionLabel != null) {
            labelService.updateLabel(versionLabel);
            return ResultUtil.success();
        }
        return ResultUtil.error("修改失败");
    }

    @RequiresPermissions("delete")
    @ApiOperation(value = "删除版本标签", notes = "根据版本ID删除版本标签")
    @RequestMapping(value = "/delVersionLabel", method = RequestMethod.POST)
    public ResultUtil delVersionLabel(@RequestParam("versionId") Long versionId) {
        if (versionId != null) {
            labelService.delVersionLabel(versionId);
            return ResultUtil.success();
        }
        return ResultUtil.error("保存失败");
    }

    //新增标签
    @RequiresPermissions("insert")
    @ApiOperation(value = "新增标签", notes = "新增标签")
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil add(@RequestBody Label label) {
        if (label != null) {
            labelService.insert(label);
            return ResultUtil.success();
        }
        return ResultUtil.error("保存失败");
    }

    //修改标签
    @RequiresPermissions("update")
    @ApiOperation(value = "修改标签", notes = "修改标签")
    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil update(@RequestBody Label label) {
        if (label != null) {
            labelService.update(label);
            return ResultUtil.success();
        }
        return ResultUtil.error("修改失败");
    }

    //根据标签id删除标签
    @RequiresPermissions("delete")
    @ApiOperation(value = "删除标签", notes = "根据ID删除标签")
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil del(@RequestParam("str") String str) {
        if (str != null && str.length() != 0) {
            JSONArray jsons = JSONArray.parseArray(str);
            for (Object object : jsons) {
                Long id = Long.parseLong(object.toString());
                labelService.delete(id);
            }
            return ResultUtil.success();
        }
        return ResultUtil.error("删除失败");
    }
}
