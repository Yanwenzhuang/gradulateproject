package com.edusoft.service.impl;

import com.edusoft.dao.IOrder_goodsDao;
import com.edusoft.dao.ITorderDao;
import com.edusoft.dto.Order_goods;
import com.edusoft.service.IBaseService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Service
public class Order_goodsServiceImpl implements IBaseService<Order_goods> {
    @Autowired
    IOrder_goodsDao igd;

    @Override
    public boolean add(Order_goods order_goods) throws SQLException {
        return igd.add(order_goods);
    }

    @Override
    public Order_goods findOneByld(String id) throws SQLException {
        return null;
    }

    @Override
    public boolean update(Order_goods order_goods) throws SQLException {
        return false;
    }

    @Override
    public List<Order_goods> findByProp(Map qv) throws SQLException {
        return igd.findByProp(qv);
    }

    @Override
    public Order_goods findOneByProp(Order_goods order_goods) throws SQLException {
        return null;
    }

    @Override
    public boolean delete(Order_goods order_goods) throws SQLException {
        return igd.delete(order_goods);
    }

    public List<Order_goods> selectOrderByPage(@Param(value = "startPos") Integer startPos, @Param(value = "pageSize") Integer pageSize){
        return igd.selectOrderByPage(startPos, pageSize);
    }

    /**
     * 取得分类数量
     */
    public long getOrderCount(){
        return igd.getOrderCount();
    }

}
