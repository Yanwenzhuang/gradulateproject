package com.edusoft.dto;

import org.springframework.stereotype.Component;

import java.sql.Date;

//顾客类
@Component
public class Customer {
    private String id; //顾客id
    private String realname;//顾客名字
    private String username;//顾客账户
    private String password;//密码
    private String address;//地址
    private String gender;//性别
    private Date regDate;//注册日期,系统自动生成
    private String email;//电子邮箱
    private String phone;//联系电话
    private String IDcard;//身份证，18位

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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getIDcard() {
        return IDcard;
    }

    public void setIDcard(String IDcard) {
        this.IDcard = IDcard;
    }

//    toString方法
    @Override
    public String toString() {
        return "Customer{" +
                "id='" + id + '\'' +
                ", realname='" + realname + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", address='" + address + '\'' +
                ", gender='" + gender + '\'' +
                ", regDate=" + regDate +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", IDcard='" + IDcard + '\'' +
                '}';
    }
}
