package com.edusoft.dto;
/**
 * 购物车
 */

import org.springframework.stereotype.Component;

@Component
public class Shopcar {
    private String id;//购物车ID
    private Customer customer;//顾客
    private float total;//商品总金额

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    @Override
    public String toString() {
        return "Shopcar{" +
                "id='" + id + '\'' +
                ", customer=" + customer +
                ", total=" + total +
                '}';
    }
}
