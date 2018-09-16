package com.ax.service.impl;

import com.ax.mapper.TbBookCatMapper;
import com.ax.pojo.TbBookCat;
import com.ax.pojo.TbBookCatExample;
import com.ax.service.TbBookCatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TbBookCatServiceImpl implements TbBookCatService {

    @Autowired
    private TbBookCatMapper tbBookCatMapper;

    /**
     *  根据父类id 查询书本的分类
     *
     * */
    public List<TbBookCat> findCatByParentId(Long parentId) {
        //调用方法查询商品id
        List<TbBookCat> bookCatList = findBookCatByParentId(parentId);
        //获取商品结果，并遍历  判断中间是否存在父 节点
        if(bookCatList != null && bookCatList.size() >0) {
            for(TbBookCat tbBookCat : bookCatList ) {
                //判断是否是父节点
                if(tbBookCat.getIsParent()) {
                    //如果是父节点，就查询出所有子节点，并将子节点的结果存放在父节点
                    List childList = findCatByParentId(tbBookCat.getId());
                    tbBookCat.setChildList(childList);
                }
            }
        }
        return bookCatList;
    }

    /**
     *  根据父id查询所有子节点
     *  */
    public List findBookCatByParentId (Long parentId) {
        TbBookCatExample  tbBookCatExample = new TbBookCatExample();
        tbBookCatExample.createCriteria().andParentIdEqualTo(parentId);
        List<TbBookCat> tbBookCats = tbBookCatMapper.selectByExample(tbBookCatExample);
        return  tbBookCats;
    }

//    /**
//     *
//     * 查询全部的书本类型
//     * */
//    public SBResult findCatAll() {
//        Map<String,TbBookCat> tbBookCatMap = new HashMap<>();
//        //查询所有父类id为0的数据
//        SBResult result = findCatByParentId(0L);
//        List<TbBookCat> tbBookCatslist = (List<TbBookCat>) result.getData();
//        if(tbBookCatslist != null && tbBookCatslist.size() >0) {
//            for (TbBookCat tbBookCat : tbBookCatslist ) {
//                if(tbBookCat.getIsParent()) {
//                    findCatByParentId
//                }
//            }
//        }
//        return null;
//    }
}
