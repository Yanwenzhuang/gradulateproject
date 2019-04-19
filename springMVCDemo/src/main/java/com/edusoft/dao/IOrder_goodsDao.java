package com.edusoft.dao;

import com.edusoft.dto.Category;
import com.edusoft.dto.Order_goods;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IOrder_goodsDao extends IBaseDao<Order_goods> {
    /**
     * 使用注解方式传入多个参数
     * @return #{startPos},#{pageSize}
     */
    public List<Order_goods> selectOrderByPage(@Param(value = "startPos") Integer startPos, @Param(value = "pageSize") Integer pageSize);

    /**
     * 取得分类数量
     */
    public long getOrderCount();

}
