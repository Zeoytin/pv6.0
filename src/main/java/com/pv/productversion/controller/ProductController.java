package com.pv.productversion.controller;

import com.alibaba.fastjson.JSONArray;
import com.pv.productversion.entity.Product;
import com.pv.productversion.entity.Version;
import com.pv.productversion.service.ProductService;
import com.pv.productversion.service.VersionService;
import com.pv.productversion.util.ResultUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/product")
@Api(tags = "product-Controller")
public class ProductController {
    @Autowired
    ProductService productService;
    @Autowired
    VersionService versionService;
    @ApiOperation(value = "跳转日历页面", notes = "日历页面")
    @RequestMapping(value = "/calender",method = RequestMethod.GET)
    public String calender() {
        return "calender";
    }

    @ApiOperation(value = "跳转产品页面", notes = "产品页面")
    @RequestMapping(value = "/query",method = RequestMethod.GET)
    public String queryProducts() {
        return "product/query";
    }
//    @ApiOperation(value = "跳转审核页面", notes = "审核页面")
//    @RequestMapping(value = "/tocheck",method = RequestMethod.GET)
//    public String checkProducts() {
//        return "product/check";
//    }
@RequiresPermissions("select")
    @ApiOperation(value = "获取产品列表", notes = "分页查询获取产品信息")
    @RequestMapping(value = "/listProducts", method = RequestMethod.GET)
    @ResponseBody
    public ResultUtil productList(@RequestParam(value = "name",required = false) String name, @RequestParam("pageSize") int pageSize, @RequestParam("pageNumber") int pageNumber) {
        if (pageNumber <= 1) {
            pageNumber = 1;
        }
        int beginNumber = (pageNumber - 1) * pageSize;
        List<Product> productList = productService.listProducts(name, pageSize, beginNumber);
        int total = productService.count(name);
        //key需要与js中 dataField对应，bootStrap默认值为rows
        //total需要返回到前台，用于计算分页导航栏
        return ResultUtil.success().add("rows", productList).add("total", total);
    }
    @RequiresPermissions("select")
    @ApiOperation(value = "获取除本身之外产品列表", notes = "按照本身id获取除本身之外产品信息")
    @RequestMapping(value = "/listProduct",method = RequestMethod.GET)
    @ResponseBody
    public ResultUtil productList(@RequestParam("id") Long id) {
        if (id != null) {
            List<Product> list = productService.selectProducts(id);
            return ResultUtil.success().add("list",list);
        }
        return ResultUtil.error("获取失败");
    }
    @RequiresPermissions("insert")
    @ApiOperation(value = "增加产品和默认版本号", notes = "传产品和版本信息增加产品")
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil addProduct(@RequestParam("name") String name, @RequestParam("paltform") String paltform, @RequestParam("versionName") String versionName, @RequestParam("versionCode") String versionCode) {
        if (name != null && name.length() != 0 && paltform != null && name.length() != 0 && versionName != null && versionName.length() != 0 && versionCode != null && versionCode.length() != 0) {
            Product product = new Product();
            product.setName(name);
            product.setPaltform(paltform);
            productService.insert(product);
            Version version = new Version();
            version.setVersionName(versionName);
            version.setVersionCode(versionCode);
            version.setProductId(product.getId());
            version.setParentId(null);
            versionService.insert(version);
            return ResultUtil.success();
        }
        return ResultUtil.error("保存失败");
    }
    @RequiresPermissions("delete")
    @ApiOperation(value = "删除产品", notes = "根据选中的ids批量删除产品")
    @RequestMapping(value = "/del",method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil deleteProduct(@RequestParam("str") String str) {
        if (str != null && str.length() != 0) {
            JSONArray jsons = JSONArray.parseArray(str);
            for (Object object : jsons) {
                Long id = Long.parseLong(object.toString());
                productService.delete(id);
                versionService.deleteByProduct(id);
            }
            return ResultUtil.success();
        }
        return ResultUtil.error("删除失败");
    }
    @RequiresPermissions("update")
    @ApiOperation(value = "修改产品", notes = "传产品对象json修改产品")
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil updateProduct(@RequestBody Product product) {
        if (product != null) {
            productService.update(product);
            return ResultUtil.success();
        }
        return ResultUtil.error("修改失败");
    }

    //↓没有用到
    @RequiresPermissions("select")
    @ApiOperation(value = "根据产品id查询产品信息", notes = "根据id来获取产品信息")
    @RequestMapping(value = "/findById",method = RequestMethod.GET)
    @ResponseBody
    public ResultUtil findProduct(@RequestParam("id") Long id) {
        if (id != null) {
            Product product = productService.getProductById(id);
            return ResultUtil.success().add("product",product);
        }
        return ResultUtil.error("查询失败");
    }

//    @ApiOperation(value = "获取未审核的产品列表", notes = "分页查询获取产品信息")
//    @RequestMapping(value = "/allProducts",method = RequestMethod.GET)
//    @ResponseBody
//    public ResultUtil allProducts(@RequestParam(value = "name",required = false) String name, @RequestParam("pageSize") int pageSize, @RequestParam("pageNumber") int pageNumber) {
//        if (pageNumber <= 1) {
//            pageNumber = 1;
//        }
//        int beginNumber = (pageNumber - 1) * pageSize;
//        List<Product> productList = productService.allProducts(name, pageSize, beginNumber);
//        int total = productService.countChecked(name);
//        return ResultUtil.success().add("rows", productList).add("total", total);
//    }
//
//    @ApiOperation(value = "审核产品", notes = "根据选中的ids批量审核产品")
//    @RequestMapping(value = "/check",method = RequestMethod.POST)
//    @ResponseBody
//    public ResultUtil checkProduct(@RequestParam("str") String str) {
//        if (str != null && str.length() != 0) {
//            JSONArray jsons = JSONArray.parseArray(str);
//            for (Object object : jsons) {
//                Long id = Long.parseLong(object.toString());
//                productService.checked(id);
//            }
//            return ResultUtil.success();
//        }
//        return ResultUtil.error("审核失败");
//    }

}
