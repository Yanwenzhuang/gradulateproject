package com.edusoft.dto;

import org.springframework.stereotype.Component;

//商品分类的类

@Component
public class Category {
    private String id;//商品分类 ID
    private String text;//商品分类的名称

    //自定义一个二参构造
    public Category(String text) {
        this.text = text;
    }

    public Category() {
    }

    //getter and setter 用菜单或快捷键自动生成
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }



    //改写toString 用菜单或快捷键自动生成
    @Override
    public String toString() {
        return "Category{" +
                "id='" + id + '\'' +
                ", text='" + text + '\'' +
                '}';
    }
}
