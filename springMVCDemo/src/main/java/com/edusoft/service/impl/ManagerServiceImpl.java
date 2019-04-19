package com.edusoft.service.impl;

import com.edusoft.dao.IBaseDao;
import com.edusoft.dao.IManagerDao;
import com.edusoft.dto.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class ManagerServiceImpl implements IBaseDao<Manager> {
    @Autowired
    IManagerDao img;

//    添加
    @Override
    public boolean add(Manager manager) {
        return img.add(manager);
    }

    @Override
    public boolean update(Manager manager) {
        return false;
    }

    @Override
    public boolean delete(Manager manager) {
        return false;
    }

    @Override
    public Manager findOneById(String id) {
        return null;
    }

//    根据参数精确查询
    @Override
    public Manager findOneByProp(Manager manager) {
        return img.findOneByProp(manager);
    }

    @Override
    public List<Manager> findByProp(Map map) {
        return null;
    }
}
