package com.edusoft.dao;

import com.edusoft.dao.IBaseDao;
import com.edusoft.dto.Category;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface ICategoryDao extends IBaseDao<Category> {

    /**
     * 使用注解方式传入多个参数
     * @return #{startPos},#{pageSize}
     */
    public List<Category> selectCategoryByPage(@Param(value = "startPos") Integer startPos, @Param(value = "pageSize") Integer pageSize);

    /**
     * 取得分类数量
     */
    public long getCategoryCount();
}
