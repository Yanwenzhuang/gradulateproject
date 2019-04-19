package com.edusoft.dto;

import org.springframework.stereotype.Component;

//订单与商品的中间类
@Component
public class Order_goods {
    private String id;//订单与商品中间类的id
    private Torder torder;//所属订单编号
    private Goods goods;//订单对应的商品编号
    private int count;//商品的购买数量

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Torder getTorder() {
        return torder;
    }

    public void setTorder(Torder torder) {
        this.torder = torder;
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
        return "Order_goods{" +
                "id='" + id + '\'' +
                ", torder=" + torder +
                ", goods=" + goods +
                ", count=" + count +
                '}';
    }
}
