package com.edusoft.service.impl;

import com.edusoft.dao.ISellerDao;
import com.edusoft.dto.Seller;
import com.edusoft.service.IBaseService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.*;
@Service
public class SellerServiceImpl implements IBaseService<Seller> {
    @Autowired
    ISellerDao dao;
    

    //添加数据
    @Override
    public boolean add(Seller seller) throws SQLException {
        return dao.add(seller);
    }

    //根据id精确查找
    public Seller findOneByld(String id) throws SQLException{
        return dao.findOneById(id);
    }

    //更新数据
    public boolean update(Seller t) throws SQLException{
        return  dao.update(t);
    }
    //模糊查找
    public List<Seller> findByProp(Map qv) throws SQLException {
        return dao.findByProp(qv);
    }

//    精确查找
    @Override
    public Seller findOneByProp(Seller seller) throws SQLException {
        return dao.findOneByProp(seller);
    }

//    根据参数精确查询,判断商家是否存在
    public boolean isExist(Seller seller) throws SQLException{
        return dao.findOneByProp(seller)!=null?true:false;
    }

//    删除功能
    @Override
    public boolean delete(Seller seller) throws SQLException {
        return dao.delete(seller);
    }

    public List<Seller> selectSellerByPage(@Param(value = "startPos") Integer startPos, @Param(value = "pageSize") Integer pageSize){
        return dao.selectSellerByPage(startPos, pageSize);
    }

    /**
     * 取得商家数量
     */
    public long getSellerCount(){
        return dao.getSellerCount();
    }



}
