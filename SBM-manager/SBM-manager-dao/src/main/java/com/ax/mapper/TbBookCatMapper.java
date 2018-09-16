package com.ax.mapper;

import com.ax.pojo.TbBookCat;
import com.ax.pojo.TbBookCatExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbBookCatMapper {
    int countByExample(TbBookCatExample example);

    int deleteByExample(TbBookCatExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbBookCat record);

    int insertSelective(TbBookCat record);

    List<TbBookCat> selectByExample(TbBookCatExample example);

    TbBookCat selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbBookCat record, @Param("example") TbBookCatExample example);

    int updateByExample(@Param("record") TbBookCat record, @Param("example") TbBookCatExample example);

    int updateByPrimaryKeySelective(TbBookCat record);

    int updateByPrimaryKey(TbBookCat record);
}