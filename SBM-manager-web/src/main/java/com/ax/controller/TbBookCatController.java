package com.ax.controller;

import com.ax.pojo.SBResult;
import com.ax.pojo.TbBookCat;
import com.ax.service.TbBookCatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 *  书本  分类  表现层
 * */
@Controller
public class TbBookCatController {

    @Autowired
    private TbBookCatService tbBookCatService;

    @RequestMapping("/bookcat/findBookCatByParentId")
    @ResponseBody
    public List<TbBookCat> findBookCatByParentId(@RequestParam(defaultValue = "0") Long parentId) {

        List<TbBookCat>  list = tbBookCatService.findCatByParentId(parentId);

        return  list;
    }

}
