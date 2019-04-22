package com.pv.productversion.util;

import com.alibaba.fastjson.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * @program: pv5.0
 * @Date: 2019/4/9 13:25
 * @Author: Zhaoyt
 * @Description:
 */
public class JSONUtil {
    private static final Logger logger = LoggerFactory.getLogger(JSONUtil.class);

    static String returnJSONResult(boolean success, String state ,String message,Object entity){
        Map map = new HashMap();
        map.put("isSuccess",success);
        map.put("stateCode",state);
        map.put("message",message);
        map.put("entity",entity);
        JSONObject json = new JSONObject(map);
        logger.info("返回JSON字符串：" + json.toString());
        return json.toString();
    }

    /**
     * 设置失败消息JSON字符串
     * @param message
     * @return
     */
    static String returnFailReuslt(String message){
        return returnJSONResult(false, "200" ,message,null);
    }

    /**
     * 设置返回实体JSON字符串
     * @param entity
     * @return
     */
    static String returnEntityReuslt(Object entity){
        return returnJSONResult(true, "200" ,null,entity);
    }

    /**
     * 设置403权限不足JSON字符串
     * @return
     */
    public static String returnForbiddenResult(){
        return returnJSONResult(false, "403" ,"权限不足!! 禁止访问!!",null);
    }

    /**
     * 返回成功消息JSON字符串
     * @param message
     * @return
     */
    static String returnSuccessResult(String message){
        return returnJSONResult(true, "200" ,message,null);
    }


}
