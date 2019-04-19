package com.edusoft.dao;

import com.edusoft.dto.Goods;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IGoodsDao extends IBaseDao<Goods> {
/**
 * 根据商家 查询 商品
// * @param seller
 * @return List<Goods>
 */

//    根据商家ID查询商品
    public List<Goods> findGoodsBySeller(String sellerID);


//    根据分类ID查询商品
    public List<Goods> findGoodsByCategory(String categoryID);


    /**
     * 使用注解方式传入多个参数
     * @return #{startPos},#{pageSize}
     */
    public List<Goods> selectGoodsByPage(@Param(value = "name") String name,
                                         @Param(value = "startPos") Integer startPos,@Param(value = "pageSize") Integer pageSize);

    /**
     * 取得商品总个数
     */
    public long getGoodsCount(@Param(value = "name") String name);

    /**
     * 使用注解方式传入多个参数，用户产品分页，通过登录用户ID查询
     * @return #{startPos},#{pageSize}
     */
    public List<Goods> selectGoodsByCategory(@Param(value = "categoryID") String categoryID,@Param(value = "sellerID") String sellerID,
                                         @Param(value = "startPos") Integer startPos,@Param(value = "pageSize") Integer pageSize);

    /**
     * 取得商品总个数
     */
    public long getCatogoryGoodsCount(@Param(value = "categoryID") String categoryID,@Param(value = "sellerID") String sellerID);


    public List<Goods> selectGoodsBySeller(@Param(value = "categoryID") String categoryID,@Param(value = "sellerID") String sellerID,
                                             @Param(value = "startPos") Integer startPos,@Param(value = "pageSize") Integer pageSize);


    public long getSellerCount(@Param(value = "categoryID") String categoryID,@Param(value = "sellerID") String sellerID);


}

