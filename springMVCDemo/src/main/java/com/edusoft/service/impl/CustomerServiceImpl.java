package com.edusoft.service.impl;

import com.edusoft.dao.IBaseDao;
import com.edusoft.dao.ICustomerDao;
import com.edusoft.dto.Customer;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CustomerServiceImpl implements IBaseDao<Customer> {
    @Autowired
    ICustomerDao icd;

//    添加功能
    @Override
    public boolean add(Customer customer) {
        return icd.add(customer);
    }

    @Override
    public boolean update(Customer customer) {
        return icd.update(customer);
    }

    @Override
    public boolean delete(Customer customer) {
        return false;
    }

    @Override
    public Customer findOneById(String id) {
        return icd.findOneById(id);
    }

    @Override
    public Customer findOneByProp(Customer customer) {
        return icd.findOneByProp(customer);
    }

    @Override
    public List<Customer> findByProp(Map map) {
        return icd.findByProp(map);
    }

    /**
     * 使用注解方式传入多个参数
     * @return #{startPos},#{pageSize}
     */
    public List<Customer> selectCustomerByPage(@Param(value = "startPos") Integer startPos, @Param(value = "pageSize") Integer pageSize){
        return icd.selectCustomerByPage(startPos, pageSize);
    }

    /**
     * 取得商家数量
     */
    public long getCustomerCount(){
        return icd.getCustomerCount();
    }

}
