package com.edusoft.dao;

import com.edusoft.dto.Order_goods;
import com.edusoft.dto.Shopcar_goods;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IShopcar_goodsDao extends IBaseDao<Shopcar_goods>{


    public List<Shopcar_goods> selectShopcarByPage(@Param(value = "startPos") Integer startPos, @Param(value = "pageSize") Integer pageSize);

    public long getShopcarCount();

}
