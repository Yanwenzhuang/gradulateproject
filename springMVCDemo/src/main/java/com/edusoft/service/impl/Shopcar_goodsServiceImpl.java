package com.edusoft.service.impl;

import com.edusoft.dao.IBaseDao;
import com.edusoft.dao.IShopcar_goodsDao;
import com.edusoft.dto.Shopcar_goods;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class Shopcar_goodsServiceImpl implements IBaseDao<Shopcar_goods> {
    @Autowired
    IShopcar_goodsDao isg;

    @Override
    public boolean add(Shopcar_goods shopcar_goods) {
        return isg.add(shopcar_goods);
    }

    @Override
    public boolean update(Shopcar_goods shopcar_goods) {
        return isg.update(shopcar_goods);
    }

    @Override
    public boolean delete(Shopcar_goods shopcar_goods) {
        return isg.delete(shopcar_goods);
    }

    @Override
    public Shopcar_goods findOneById(String id) {
        return isg.findOneById(id);
    }

    @Override
    public Shopcar_goods findOneByProp(Shopcar_goods shopcar_goods) {
        return null;
    }

    @Override
    public List<Shopcar_goods> findByProp(Map map) {
        return isg.findByProp(map);
    }

    public List<Shopcar_goods> selectShopcarByPage(@Param(value = "startPos") Integer startPos, @Param(value = "pageSize") Integer pageSize){
        return isg.selectShopcarByPage(startPos, pageSize);
    }

    public long getShopcarCount(){
        return isg.getShopcarCount();
    }

}
