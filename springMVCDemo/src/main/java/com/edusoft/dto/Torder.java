package com.edusoft.dto;

import org.springframework.stereotype.Component;

import java.sql.Date;

//订单类
@Component
public class Torder {
    private String id;//订单id号
    private Date orderTime;//下单时间，系统自动生成
    private Customer customer;//下单的客户
    private float total;//订单总金额
    private String receiver;//接受者名字
    private String phone;//联系电话
    private String address;//住址/默认收货地址

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Torder{" +
                "id='" + id + '\'' +
                ", orderTime=" + orderTime +
                ", customer=" + customer +
                ", total=" + total +
                ", receiver='" + receiver + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
