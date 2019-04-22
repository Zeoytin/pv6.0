package com.pv.productversion.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @program: uploadfiledemo
 * @Date: 2019/3/28 10:02
 * @Author: Zhaoyt
 * @Description:
 */
public class MyFileUtil {
    /*
     * @Description:
     * @param
     * @Return:
     * @Author: Zhaoyt
     * @Date: 2019/3/28 11:50
     */
    public static String uploadFile(MultipartFile file, String path){
        System.out.print("保存文件绝对路径" + path + "\n");

        //创建文件路径
        File dest = new File(path);

        //判断文件是否已经存在
        if (dest.exists()) {
            return "文件已经存在";
        }

        //判断文件父目录是否存在
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdir();
        }

        try {
            //上传文件
            file.transferTo(dest); //保存文件
            System.out.print("保存文件路径" + path + "\n");
            return "上传成功";
        } catch (IOException e) {
            return "上传失败";
        }
    }

    /*
     * @Description: 删除文件
     * @param  uploadFolder;fileName
     * @Return: true or false
     * @Author: Zhaoyt
     * @Date: 2019/3/28 11:49
     */
    public static boolean removeFile(String uploadFolder, String fileName) {
        try {
            String path = uploadFolder + fileName;
            System.out.println("path=" + path);
            File file = new File(path);
            if (file.delete()) {
                System.out.println(file.getName() + " is deleted");
                return true;
            } else {
                System.out.println("Delete failed.");
                return false;
            }
        } catch (Exception e) {
            System.out.println("Exception occured");
            e.printStackTrace();
            return false;
        }
    }
    public static String getNewFileName(MultipartFile file){
        String fileName = file.getOriginalFilename();
        System.out.print("上传的文件名为: " + fileName + "\n");

        fileName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + "_" + fileName;
        System.out.print("（加个时间戳，尽量避免文件名称重复）保存的文件名为: " + fileName + "\n");
        return fileName;
    }
}
