package com.ax.controller;

import com.ax.pojo.SBResult;
import com.ax.pojo.TbUser;
import com.ax.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {


    @Autowired
//    private UserService service;

    @RequestMapping("/page/login")
    public String showLogin() {
        //跳转到指定界面
        return "common/login";
    }

    @RequestMapping ("/user/login")
    @ResponseBody
    public SBResult login(TbUser tbUser) {
        //调用方法登录
//        SBResult sbResult = service.login(tbUser);
        //返回结果
//        return sbResult;
        return  null;
    }

}
