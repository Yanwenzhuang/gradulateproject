package com.edusoft.controller;

import com.edusoft.dto.*;
import com.edusoft.service.impl.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cgi/torder")
public class TorderController {
    @Autowired
    TorderServiceImpl tsi;
    @Autowired
    Order_goodsServiceImpl ogsi;
    @Autowired
    ShopcarServiceImpl ssi;
    @Autowired
    Shopcar_goodsServiceImpl sgsi;
    @Autowired
    GoodsServiceImpl gsi;



    //    添加订单(针对直接购买的商品)
    @RequestMapping("/addOrder")
    @Transactional
    public String addOrder(String goodsID, String count,String price,
                           String receiver, String address, String phone, HttpSession session) throws SQLException {
        System.out.println("dingdan:"+count);
        float total = Float.parseFloat(price)*Integer.parseInt(count);//订单总金额
    //    System.out.println(total);
        Customer customer = (Customer) session.getAttribute("customer");
    //        把页面传来的值，填充到订单对象中
        Torder torder = new Torder();
        torder.setCustomer(customer);
        torder.setReceiver(receiver);
        torder.setPhone(phone);
        torder.setAddress(address);
        torder.setTotal(total);
        if(tsi.add(torder)) {
            session.setAttribute("torder",torder);
            Order_goods order_goods = new Order_goods();
            order_goods.setTorder(torder);
            order_goods.setGoods(gsi.findOneById(goodsID));
            order_goods.setCount(Integer.parseInt(count));
            ogsi.add(order_goods);
            return "/torder/success";
        }else{
            return "/torder/a2";
        }
    }



    //    添加订单(针对购物车里的商品)，下单之后需要清除购物车里的商品
    @RequestMapping("/addShopcarOrder")
    @Transactional
    public String doOrder(String shopcarID,String total,String receiver,
                          String address,String phone,HttpSession session) throws SQLException {
        Customer customer = (Customer) session.getAttribute("customer");

        Torder torder = new Torder();
        torder.setCustomer(customer);
        torder.setReceiver(receiver);
        torder.setPhone(phone);
        torder.setAddress(address);
        torder.setTotal(Float.parseFloat(total));
        if(tsi.add(torder)) {
            Map map = new HashMap();
            map.put("shopcarID",ssi.findOneById(shopcarID));
            List<Shopcar_goods> shopcar_goodsList = sgsi.findByProp(map);
            for (Shopcar_goods sg:shopcar_goodsList){
                Order_goods order_goods = new Order_goods();
                order_goods.setTorder(torder);
                order_goods.setGoods(sg.getGoods());
                order_goods.setCount(sg.getCount());
                ogsi.add(order_goods);
            }

//          下单之后，删除购物车里的商品
            Shopcar shopcar = new Shopcar();
            shopcar.setCustomer(customer);
            Shopcar shopcar1 = ssi.findOneByProp(shopcar);

            Map map1 = new HashMap();
            map1.put("shopcar",shopcar1);
            List<Shopcar_goods> shopcar_goodsList1 = sgsi.findByProp(map1);
            for (Shopcar_goods sg:shopcar_goodsList1){
                sgsi.delete(sg);
            }
//        购物车清空之后，将购物车里的总金额设置为0
            shopcar1.setTotal(0);
            ssi.update(shopcar1);

            return "/torder/success";
        }else{
            return "/torder/a2";
        }
    }


    //管理员查看所有的订单，进行管理
    @RequestMapping("/manage")
    public String manage(Model model, HttpServletRequest request) throws SQLException {
        String pageNow = request.getParameter("pageNow");
        Page1 page = null;
        List<Order_goods> list = new ArrayList<>();
        int totalCount = (int) ogsi.getOrderCount();
        if(pageNow !=null){
            page = new Page1(totalCount,Integer.parseInt(pageNow));
            list = ogsi.selectOrderByPage(page.getStartPos(),page.getPageSize());
        }else {
            page = new Page1(totalCount,1);
            list = ogsi.selectOrderByPage(page.getStartPos(),page.getPageSize());
        }

        model.addAttribute("content",list);
        model.addAttribute("page",page);
        return "/torder/torderManage";
    }


   //    顾客查看自己的全部订单
//    @RequestMapping("/CustomerOrder")
//    public String customerOrder(HttpSession session,Model model) throws SQLException {
//        Customer customer = (Customer) session.getAttribute("customer");
//        Map map = new HashMap();
//        map.put("customer",customer);
//        List<Torder> torderList = tsi.findByProp(map);
//        for (Torder torder:torderList){
//            Map map1 = new HashMap();
//            map1.put("torder",torder);
//            List<Order_goods> order_goodsList = ogsi.findByProp(map1);
//            model.addAttribute("content",order_goodsList);
//        }
//
//        return "/torder/manage";
//    }


//    顾客查看自己刚下的订单
    @RequestMapping("/CustomerOneOrder")
    public String CustomerOneOrder(HttpSession session,Model model) throws SQLException {
        Torder torder = (Torder) session.getAttribute("torder");
        Map map = new HashMap();
        map.put("torder",torder);
//        根据顾客刚刚所下的订单对订单中间表进行模糊查询
        List<Order_goods> order_goodsList = ogsi.findByProp(map);
        model.addAttribute("content",order_goodsList);
        return "/torder/manage";
    }













}

