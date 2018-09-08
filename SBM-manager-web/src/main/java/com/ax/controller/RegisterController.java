package com.ax.controller;

import com.ax.pojo.SBResult;

import com.ax.pojo.TbUser;
import com.ax.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
/**
 *  用户相关的 controller
 *
 *
 * */
@Controller
public class RegisterController {

    private static String NO = "no";
    private static String YES = "yes";

    @Autowired
    private UserService userService;


    /**
     * 校验验证码
     * /user/checkVercode
     * */
    @RequestMapping("/user/checkVercode")
    @ResponseBody
    public String checkVercode (String vercode, HttpServletRequest request) {
        //第一步：从session中获取验证码，进行验证
        String checkVerCode = (String) request.getSession().getAttribute("key");
        if(StringUtils.isBlank(checkVerCode) ||  !checkVerCode.equals(vercode)) {
            return NO;
        }
        return YES;
    }

    /**
     * 校验数据是否存在
     * */
    @RequestMapping("/user/check/{param}/{type}")
    @ResponseBody
    public SBResult check (@PathVariable String param, @PathVariable Integer type){
        //获取参数，调用service方法，返回结果
        SBResult check = userService.check(param, type);
        //返回结果
        return check;
    }

    /**
     *   注册用户
     * */
    @RequestMapping(value = "/user/register",method = RequestMethod.POST)
    @ResponseBody
    public SBResult  register(TbUser tbUser) {

        //调用方法，注册用户
       SBResult sbResult =  userService.register(tbUser);
        //返回结果
        return sbResult;
    }
}
