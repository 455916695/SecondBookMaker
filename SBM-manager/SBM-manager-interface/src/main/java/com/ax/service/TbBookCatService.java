package com.ax.service;


import com.ax.pojo.TbBookCat;

import java.util.List;

/**
 *  书本类型的 service
 * */
public interface TbBookCatService {

    //思路 ： 使用ajax访问后台数据，先从数据库中查询所有 的parent_id为0的数据
    //        再将其id当做  父类id ，作为参数，去数据后台查询所有的子类，取前五类

    public List<TbBookCat> findCatByParentId(Long parentId);

//    public SBResult  findCatAll();
}
