package com.ax.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 用于页面跳转的controller
 *
 * */
@Controller
public class PageController {

    /**
     * 页面跳转  跳转到首页
     *
     * */
    @RequestMapping("/")
    public String showPage() {

        return "common/homepage";
    }

    /**
     * 可以用于跳转指定的jsp页面
     *
     * */
    @RequestMapping("/{pathName}_{jspName}")
    public String skip(@PathVariable String pathName,@PathVariable String jspName) {
        return pathName+"/"+jspName;
    }

//    /**
//     * 根据路径，将页面跳转指定jsp
//     *
//     * */
//    @RequestMapping("/login")
//    public String skipPageLogin( ) {
//        return  "common/login";
//    }
//
//    @RequestMapping("/regist")
//    public String skipPageRegist( ) {
//        return  "common/regist";
//    }

    @RequestMapping("/validatecode")
    public String skipPageValidatecode() {
        return "checkcode/validatecode";
    }

}
