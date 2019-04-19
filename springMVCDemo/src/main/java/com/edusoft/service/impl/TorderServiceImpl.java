package com.edusoft.service.impl;

import com.edusoft.dao.IOrder_goodsDao;
import com.edusoft.dao.ITorderDao;
import com.edusoft.dto.Order_goods;
import com.edusoft.dto.Torder;
import com.edusoft.service.IBaseService;
import org.apache.ibatis.jdbc.RuntimeSqlException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Service
public class TorderServiceImpl implements IBaseService<Torder> {
    @Autowired
    ITorderDao itd;
    @Autowired
    IOrder_goodsDao igd;


//    添加功能
//    @Transactional(rollbackFor = Exception.class)
//    public boolean add(Torder torder, Order_goods order_goods)throws SQLException{
//        boolean flag1 = itd.add(torder);
//        boolean flag2 =igd.add(order_goods);
//        return flag1 && flag2;
//    }






    //    添加功能
    @Override
    public boolean add(Torder torder) throws SQLException {
        return itd.add(torder);
    }

    @Override
    public Torder findOneByld(String id) throws SQLException {
        return null;
    }

    @Override
    public boolean update(Torder torder) throws SQLException {
        return false;
    }

    @Override
    public List<Torder> findByProp(Map qv) throws SQLException {
        return itd.findByProp(qv);
    }

    @Override
    public Torder findOneByProp(Torder torder) throws SQLException {
        return itd.findOneByProp(torder);
    }

    @Override
    public boolean delete(Torder torder) throws SQLException {
        return false;
    }
}
