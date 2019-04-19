package com.edusoft.dto;

import org.springframework.stereotype.Component;

import java.io.StringReader;

//管理员类
@Component
public class Manager {
    private String id;//管理员id
    private String realname;//管理员名字
    private String username;//管理员账号
    private String password;//管理员密码
    private String phone;//管理员联系方式
    private String record;//管理员记录
    private String address;//管理员地址

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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRecord() {
        return record;
    }

    public void setRecord(String record) {
        this.record = record;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


    @Override
    public String toString() {
        return "Manager{" +
                "id='" + id + '\'' +
                ", realname='" + realname + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", record='" + record + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
