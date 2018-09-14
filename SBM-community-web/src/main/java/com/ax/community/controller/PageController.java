package com.ax.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *  用于页面跳转
 * */
@Controller
public class PageController {


    @RequestMapping("/common/community")
    public  String  showPage() {

        return "common/community";
    }
}
