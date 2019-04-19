package com.edusoft.service.impl;

import com.edusoft.dao.IBaseDao;
import com.edusoft.dao.IGoodsDao;
import com.edusoft.dto.Goods;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service
public class GoodsServiceImpl implements IBaseDao<Goods> {
    @Autowired
    IGoodsDao dao;

    @Override
    public boolean add(Goods goods) {
        return dao.add(goods);
    }

    @Override
    public boolean update(Goods goods) {
        return dao.update(goods);
    }

    @Override
    public boolean delete(Goods goods) {
        return dao.delete(goods);
    }

    @Override
    public Goods findOneById(String id) {
        return dao.findOneById(id);
    }

    @Override
    public Goods findOneByProp(Goods goods) {
        return dao.findOneByProp(goods);
    }

    @Override
    public List<Goods> findByProp(Map map) {
        return dao.findByProp(map);
    }

//    根据商家ID查询商品
    public List<Goods> findGoodsBySeller(String sellerID){
        return dao.findGoodsBySeller(sellerID);
    }

//    根据分类ID查询商品
    public List<Goods> findGoodsByCategory(String categoryID){
        return dao.findGoodsByCategory(categoryID);
    }

    /**
     * 使用注解方式传入多个参数，用户产品分页，通过登录用户ID查询
     * @return #{startPos},#{pageSize}
     */
    public List<Goods> selectGoodsByPage(@Param(value = "name") String name,
                                         @Param(value = "startPos") Integer startPos,@Param(value = "pageSize") Integer pageSize){
        return dao.selectGoodsByPage(name,startPos,pageSize);
    }


    /**
     * 取得商品总个数
     */
    public long getGoodsCount(@Param(value = "name") String name){
        return dao.getGoodsCount(name);
    };


    public List<Goods> selectGoodsByCategory(@Param(value = "categoryID") String categoryID,@Param(value = "sellerID") String sellerID,
                                             @Param(value = "startPos") Integer startPos,@Param(value = "pageSize") Integer pageSize){
        return dao.selectGoodsByCategory(categoryID,sellerID,startPos,pageSize);
    }

    /**
     * 取得商品总个数
     */
    public long getCatogoryGoodsCount(@Param(value = "categoryID") String categoryID,@Param(value = "sellerID") String sellerID){
        return dao.getCatogoryGoodsCount(categoryID,sellerID);
    }

    public List<Goods> selectGoodsBySeller(@Param(value = "categoryID") String categoryID,@Param(value = "sellerID") String sellerID,
                                           @Param(value = "startPos") Integer startPos,@Param(value = "pageSize") Integer pageSize){
        return dao.selectGoodsBySeller(categoryID, sellerID, startPos, pageSize);
    }


    public long getSellerCount(@Param(value = "categoryID") String categoryID,@Param(value = "sellerID") String sellerID){
        return dao.getSellerCount(categoryID, sellerID);
    }



}
