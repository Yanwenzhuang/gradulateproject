package com.edusoft.dto;

/**
 * 购物车与商品的中间表
 */

public class Shopcar_goods {
    private String id;//类的id
    private Shopcar shopcar;//购物车
    private Goods goods;//商品
    private int count;//商品数量

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Shopcar getShopcar() {
        return shopcar;
    }

    public void setShopcar(Shopcar shopcar) {
        this.shopcar = shopcar;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "Shopcar_goods{" +
                "id='" + id + '\'' +
                ", shopcar=" + shopcar +
                ", goods=" + goods +
                ", count=" + count +
                '}';
    }
}
