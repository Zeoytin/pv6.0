package com.pv.productversion.controller;

import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class HomeController {
//    @RequestMapping("/")
//    public String login(){return "login";}
    // 这里如果不写method参数的话，默认支持所有请求，如果想缩小请求范围，还是要添加method来支持get, post等等某个请求。
    @RequestMapping("/login")
    public String login(HttpServletRequest request, Map<String, Object> map) throws Exception {

        System.out.println("HomeController.login");

        // 登录失败从request中获取shiro处理的异常信息。
        // shiroLoginFailure:就是shiro异常类的全类名.
        Object exception = request.getAttribute("shiroLoginFailure");
        String msg = "";
        if (exception != null) {
            if (UnknownAccountException.class.getName().equals(exception)) {
                System.out.println("UnknownAccountException -- > 账号不存在：");
                msg = "账号不存在!";
            } else if (IncorrectCredentialsException.class.getName().equals(exception)) {
                System.out.println("IncorrectCredentialsException -- > 密码不正确：");
                msg = "密码不正确!";
            }  else {
                msg = "else >> "+exception;
                System.out.println("else -- >" + exception);
            }
        }

        map.put("msg", msg);
        // 此方法不处理登录成功,由shiro进行处理.
        return "login";
    }

    @RequestMapping("/403")
    public String unauthorizedRole(){
        System.out.println("------没有权限-------");
        return "403";
    }
    @RequestMapping("/register")
    public String register(){
        System.out.println("------注册----------");
        return "register";
    }
    @RequestMapping("/index")
    public String index(){
        System.out.println("------首页----------");
        return "index";
    }
    @RequestMapping("/")
    public String index1(){
        System.out.println("------首页----------");
        return "index";
    }
//    @RequestMapping("/logout")
//    public String logout(){
//        System.out.println("------退出回到登录页面----------");
//        return "login";
//    }

}
