package com.edusoft.dao;

import com.edusoft.dto.Customer;
import com.edusoft.dto.Seller;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ICustomerDao extends IBaseDao<Customer>{
    /**
     * 使用注解方式传入多个参数
     * @return #{startPos},#{pageSize}
     */
    List<Customer> selectCustomerByPage(@Param(value = "startPos") Integer startPos, @Param(value = "pageSize") Integer pageSize);

    /**
     * 取得商家数量
     */
    public long getCustomerCount();
}
