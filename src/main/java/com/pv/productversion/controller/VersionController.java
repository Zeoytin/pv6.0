package com.pv.productversion.controller;

import com.alibaba.fastjson.JSONArray;
import com.pv.productversion.entity.Version;
import com.pv.productversion.entity.VersionLabel;
import com.pv.productversion.entity.VersionRelated;
import com.pv.productversion.service.LabelService;
import com.pv.productversion.service.RelatedService;
import com.pv.productversion.service.VersionService;
import com.pv.productversion.util.MyFileUtil;
import com.pv.productversion.util.ResultUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

@Controller
@RequestMapping("/version")
@Api(tags = "version-Controller")
public class VersionController {
    @Autowired
    private VersionService versionService;
    @Autowired
    private RelatedService relatedService;
    @Autowired
    private LabelService labelService;

    @Value("${file.uploadFolder}")
    private String uploadFolder;
    @Value("${file.localhostPath}")
    private String localhostPath;
    @RequiresPermissions("select")
    @ApiOperation(value = "版本页面", notes = "版本页面")
    @RequestMapping(value = "/query",method = RequestMethod.GET)
    public String queryVersions() {
        return "version/version";
    }
    @RequiresPermissions("select")
    @ApiOperation(value = "跳转审核页面", notes = "审核页面")
    @RequestMapping(value = "/tocheck", method = RequestMethod.GET)
    public String checkProducts() {
        return "version/check";
    }
    @RequiresPermissions("select")
    @ApiOperation(value = "获取产品的最新版本", notes = "根据产品id获取产品的最新版本")
    @RequestMapping(value = "/latestVersions", method = RequestMethod.GET)
    @ResponseBody
    public ResultUtil getLatestVersion(@RequestParam("productId") Long productId) {
        if (productId != null) {
            Version latestVersion = versionService.getLatestVersion(productId);
            return ResultUtil.success().add("latestVersion", latestVersion);
        }
        return ResultUtil.error("获取失败");
    }
    @RequiresPermissions("select")
    @ApiOperation(value = "获取产品的所有版本列表", notes = "获取产品的非树形版本列表")
    @RequestMapping(value = "/versionList", method = RequestMethod.GET)
    @ResponseBody
    public ResultUtil versionList(@RequestParam("productId") Long productId) {
        if (productId != null) {
            List<Version> versions = versionService.versionList(productId);
            return ResultUtil.success().add("versions", versions);
        }
        return ResultUtil.error("获取失败");
    }
    @RequiresPermissions("insert")
    @ApiOperation(value = "增加版本", notes = "传版本对象json增加版本")
    @PostMapping(value = "/add")
    @ResponseBody
    public ResultUtil addVersion(Version version, @RequestParam("file") MultipartFile file, @RequestParam("label") String label) {
        if (version != null && label != null && file != null) {
            // 获取文件名
//            String fileName = file.getOriginalFilename();
//            System.out.print("上传的文件名为: " + fileName + "\n");
//
//            fileName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + "_" + fileName;
//            System.out.print("（加个时间戳，尽量避免文件名称重复）保存的文件名为: " + fileName + "\n");
            String fileName = MyFileUtil.getNewFileName(file);
            String path = uploadFolder + fileName;
            String result = MyFileUtil.uploadFile(file, path);
            if (result == "上传成功") {
                String filePath = localhostPath + fileName;
                System.out.println("filePath = " + filePath);
                version.setUrl(filePath);
                version.setFileName(fileName);
                versionService.insert(version);
                VersionLabel versionLabel = new VersionLabel();
                versionLabel.setLabel(label);
                versionLabel.setVersionId(version.getId());
                labelService.addLabel(versionLabel);
                return ResultUtil.success();
            }
            return ResultUtil.error("保存失败");
        }
        return ResultUtil.error("保存失败");
    }
    @RequiresPermissions("delete")
    @ApiOperation(value = "删除版本", notes = "根据id删除版本")
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil deleteVersion(@RequestParam("id") Long id) {
        if (id != null) {
            versionService.delete(id);
            return ResultUtil.success();
        }
        return ResultUtil.error("删除失败");
    }
    @RequiresPermissions("update")
    @ApiOperation(value = "修改版本", notes = "传版本对象json修改版本")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil updateVersion(Version version, @RequestParam("label") String label, @RequestParam(value = "file", required = false) MultipartFile file) {

        if (version != null && label != null) {
            if (file == null) {
                versionService.update(version);
                Long versionId = version.getId();
                labelService.modifyLabel(versionId, label);
                return ResultUtil.success();
            }
            if (file != null) {
                if (MyFileUtil.removeFile(uploadFolder, version.getFileName())) {
                    String fileName = MyFileUtil.getNewFileName(file);
                    String path = uploadFolder + fileName;
                    String result = MyFileUtil.uploadFile(file, path);
                    if (result == "上传成功") {
                        String filePath = localhostPath + fileName;
                        System.out.println("filePath = " + filePath);
                        version.setUrl(filePath);
                        version.setFileName(fileName);
                        System.out.println(version);
                        versionService.update(version);
                        Long versionId = version.getId();
                        labelService.modifyLabel(versionId, label);
                        return ResultUtil.success();
                    }
                }
            }
        }
        return ResultUtil.error("修改失败");
    }
    @RequiresPermissions("select")
    @ApiOperation(value = "根据版本id查询版本信息", notes = "根据id来获取版本信息")
    @RequestMapping(value = "/findById", method = RequestMethod.GET)
    @ResponseBody
    public ResultUtil findProduct(@RequestParam("id") Long id) {
        if (id != null) {
            Version version = versionService.getVersionById(id);
            return ResultUtil.success().add("version", version);
        }
        return ResultUtil.error("查询失败");
    }
    @RequiresPermissions("select")
    @ApiOperation(value = "跳转关联页面", notes = "关联页面")
    @RequestMapping(value = "/findRelated",method = RequestMethod.GET)
    public String findRelated() {
        return "version/related";
    }
    @RequiresPermissions("select")
    @ApiOperation(value = "查询各个版本号关联", notes = "查询版本号关联")
    @RequestMapping(value = "/related", method = RequestMethod.GET)
    @ResponseBody
    public ResultUtil findList(@RequestParam("versionId") Long versionId) {
        if (versionId != null) {
            List<Version> list = versionService.queryRelated(versionId);
            return ResultUtil.success().add("list", list);
        }

        return ResultUtil.error("查询失败");
    }
    @RequiresPermissions("insert")
    @ApiOperation(value = "关联版本号", notes = "根据id关联相互关联")
    @RequestMapping(value = "/makeRelated", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil makeRelated(@RequestParam("versionId") Long versionId, @RequestParam("parentId") Long parentId) {
        if (versionId != null) {
            VersionRelated versionRelated = new VersionRelated();
            versionRelated.setVersionId(versionId);
            versionRelated.setParentId(parentId);
            relatedService.addRelated(versionRelated);
            return ResultUtil.success();
        }
        return ResultUtil.error("关联失败");
    }
    @RequiresPermissions("delete")
    @ApiOperation(value = "删除关联版本号", notes = "删除关联相互关联")
    @PostMapping(value = "/deleteRelated")
    @ResponseBody
    public ResultUtil deleteRelated(VersionRelated versionRelated) {
        if (versionRelated != null) {
            Long id = relatedService.findId(versionRelated.getVersionId(), versionRelated.getParentId());
            relatedService.deleteRelated(id);
            return ResultUtil.success();
        }
        return ResultUtil.error("删除失败");
    }

    //   日历的请求Calender
    @ApiOperation(value = "日历展示", notes = "日历展示")
    @RequestMapping(value = "/selectall",method = RequestMethod.GET)
    @ResponseBody
    public List<Version> selectall() {
        return versionService.selectall();
    }

    //文件下载相关代码
    @RequiresPermissions("select")
    @ApiOperation(value = "文件下载", notes = "文件下载")
    @RequestMapping(value = "/download", method = RequestMethod.POST)
    public String downloadFile(@RequestParam("fileName") String fileName, HttpServletResponse response) {

        if (fileName != null) {
            //当前是从该工程的WEB-INF//File//下获取文件(该目录可以在下面一行代码配置)然后下载到C:\\users\\downloads即本机的默认下载的目录
            String path = uploadFolder + fileName;
            System.out.println("path=" + path);
            File file = new File(path);
            if (file.exists()) {
                response.setContentType("application/force-download");// 设置强制下载不打开
                response.addHeader("Content-Disposition",
                        "attachment;fileName=" + fileName);// 设置文件名

                byte[] buffer = new byte[1024];
                FileInputStream fis = null;
                BufferedInputStream bis = null;
                try {
                    fis = new FileInputStream(file);
                    bis = new BufferedInputStream(fis);
                    OutputStream os = response.getOutputStream();
                    int i = bis.read(buffer);
                    while (i != -1) {
                        os.write(buffer, 0, i);
                        i = bis.read(buffer);
                    }
                    System.out.println("success");
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (bis != null) {
                        try {
                            bis.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                    if (fis != null) {
                        try {
                            fis.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            } else {
                return "nofile";
            }
        }
        return null;
    }
    @RequiresPermissions("select")
    @ApiOperation(value = "获取未审核的版本列表", notes = "分页查询获取版本信息")
    @RequestMapping(value = "/allVersions",method = RequestMethod.GET)
    @ResponseBody
    public ResultUtil allVersions( @RequestParam("pageSize") int pageSize, @RequestParam("pageNumber") int pageNumber) {
        if (pageNumber <= 1) {
            pageNumber = 1;
        }
        int beginNumber = (pageNumber - 1) * pageSize;
        List<Version> versionList = versionService.allVersions(pageSize, beginNumber);
        int total = versionService.countChecked();
        return ResultUtil.success().add("rows", versionList).add("total", total);
    }
    @RequiresPermissions("update")
    @ApiOperation(value = "审核版本", notes = "根据选中的ids批量审核版本")
    @RequestMapping(value = "/check",method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil checkVersion(@RequestParam("str") String str) {
        if (str != null && str.length() != 0) {
            JSONArray jsons = JSONArray.parseArray(str);
            for (Object object : jsons) {
                Long id = Long.parseLong(object.toString());
                versionService.checked(id);
            }
            return ResultUtil.success();
        }
        return ResultUtil.error("审核失败");
    }
}
