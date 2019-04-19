package com.edusoft.service.impl;

import com.edusoft.dao.IBaseDao;
import com.edusoft.dao.IShopcarDao;
import com.edusoft.dto.Shopcar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ShopcarServiceImpl implements IBaseDao<Shopcar> {
    @Autowired
    IShopcarDao isd;

    @Override
    public boolean add(Shopcar shopcar) {
        return isd.add(shopcar);
    }

    @Override
    public boolean update(Shopcar shopcar) {
        return isd.update(shopcar);
    }

    @Override
    public boolean delete(Shopcar shopcar) {
        return false;
    }

    @Override
    public Shopcar findOneById(String id) {
        return isd.findOneById(id);
    }

    @Override
    public Shopcar findOneByProp(Shopcar shopcar) {
        return isd.findOneByProp(shopcar);
    }

    @Override
    public List<Shopcar> findByProp(Map map) {
        return isd.findByProp(map);
    }
}
