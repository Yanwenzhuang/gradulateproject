package com.edusoft.service.impl;

import com.edusoft.dao.ICategoryDao;
import com.edusoft.dao.ISellerDao;
import com.edusoft.dto.Category;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.edusoft.service.IBaseService;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
@Service
public class CategoryServiceImpl implements IBaseService<Category> {
    @Autowired
    ICategoryDao dao;
    

    //服务层添加的方法
    @Override
    public boolean add(Category category) throws SQLException {
        return dao.add(category);
    }

    //通过ID精确查询
    @Override
    public Category findOneByld(String id) throws SQLException {
        return dao.findOneById(id);
    }

    //更新数据
    @Override
    public boolean update(Category category) throws SQLException {
        return dao.update(category);
    }

    //通过参数模糊查询
    @Override
    public List<Category> findByProp(Map qv) throws SQLException {
        return dao.findByProp(qv);
    }

    //通过参数精确查询
    @Override
    public Category findOneByProp(Category category) throws SQLException {
        return dao.findOneByProp(category);
    }

//    删除功能
  @Override
    public boolean delete(Category category) throws SQLException {
        return dao.delete(category);
    }


    public List<Category> selectCategoryByPage(@Param(value = "startPos") Integer startPos, @Param(value = "pageSize") Integer pageSize){
        return dao.selectCategoryByPage(startPos, pageSize);
    };

    /**
     * 取得分类数量
     */
    public long getCategoryCount(){
        return dao.getCategoryCount();
    };
}

