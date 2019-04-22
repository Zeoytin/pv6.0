package com.pv.productversion.util;

import java.util.HashMap;
import java.util.Map;

public class ResultUtil {
    private int code;
    private String message;
    private Map<String, Object> data = new HashMap<String, Object>();

    public static ResultUtil success(){
        ResultUtil ResultUtil = new ResultUtil();
        ResultUtil.setCode(1);
        ResultUtil.setMessage("操作成功");
        return ResultUtil;
    }

    public static ResultUtil error(String str){
        ResultUtil ResultUtil = new ResultUtil();
        ResultUtil.setCode(0);
        ResultUtil.setMessage(str);
        return ResultUtil;
    }

    public ResultUtil add(String key, Object value){
        this.getData().put(key, value);
        return this;
    }


    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }
}

