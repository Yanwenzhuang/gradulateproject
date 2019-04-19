package com.edusoft.dto;

import org.springframework.stereotype.Component;

import java.sql.Date;

//商品类
@Component
public class Goods {
    private String id;//商品ID 系统自动生成
    private String name;//商品名称
    private String image;//商品图片
    private Date indate;//商品上架日期 系统自动生成
    private float price;//商品价格
    private Seller seller;//商家 不能为空
    private Category category;//商品分类 不能为空
    private int stock;//商品上架数量（库存）
    private String state;//商品状态 0 在售 1下架  2 缺货 默认值0

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getIndate() {
        return indate;
    }

    public void setIndate(Date indate) {
        this.indate = indate;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Seller getSeller() {
        return seller;
    }

    public void setSeller(Seller seller) {
        this.seller = seller;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", image='" + image + '\'' +
                ", indate=" + indate +
                ", price=" + price +
                ", seller=" + seller +
                ", category=" + category +
                ", stock=" + stock +
                ", state='" + state + '\'' +
                '}';
    }
}
