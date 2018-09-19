package com.ax.stack.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 书的controller
 * */
@Controller
public class TbBookController {

    /**
     * /bookcat/findBook?bookCatId="+bookCatId
     * */
    @RequestMapping("/bookcat/findBookByCatId")
    public String  findBookByCatId(@RequestParam(defaultValue = "0")Long bookCatId ){

        //调用方法查询书籍

        //返回到指定的界面

        return "";
    }

}
