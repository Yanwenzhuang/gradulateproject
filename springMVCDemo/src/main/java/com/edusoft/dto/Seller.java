package com.edusoft.dto;

import org.springframework.stereotype.Component;

import java.sql.Date;

/**
 * 商家
 * author:teacher 2018-8-9 v1.0
 */
@Component
public class Seller {
    private String id;//商家编号，数据库自动生成
    private String realname;//商家实名
    private String username;//商家账号，必填
    private String password;//商家密码
    private String shopname;//商家店铺名
    private String address;//商家地址
    private String email;//商家邮箱
    private String url;//商家网址
    private String phone;//商家电话
    private String logo;//商标
    private Date regdate;//商家注册日期,数据库自动生成


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getShopname() {
        return shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    @Override
    public String toString() {
        return "Seller{" +
                "id='" + id + '\'' +
                ", realname='" + realname + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", shopname='" + shopname + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", url='" + url + '\'' +
                ", phone='" + phone + '\'' +
                ", logo='" + logo + '\'' +
                ", regdate=" + regdate +
                '}';
    }
}