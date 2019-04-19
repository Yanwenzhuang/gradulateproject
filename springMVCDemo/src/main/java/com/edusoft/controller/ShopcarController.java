package com.edusoft.controller;

import com.edusoft.dto.*;
import com.edusoft.service.impl.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.*;


@Controller
@RequestMapping("/cgi/shopcar")
public class ShopcarController {
    @Autowired
    ShopcarServiceImpl ssi;
    @Autowired
    Shopcar_goodsServiceImpl sgsi;
    @Autowired
    GoodsServiceImpl gsi;



    //    向购物车添加商品
    @RequestMapping("/addGoods")
    @Transactional
    public String addGoods(String goodsID, String count, HttpSession session) {
        Shopcar shopcar = null;
        Shopcar_goods shopcar_goods1 = new Shopcar_goods();
        boolean flag = false;
        boolean flag1 = false;
  //      登录的客户
        Customer customer = (Customer) session.getAttribute("customer");
  //      根据页面传来的ID，找到相应的商品
        Goods goods = gsi.findOneById(goodsID);

        Map map = new HashMap();
        List<Shopcar> shopcarList = ssi.findByProp(map);
        for (Shopcar s : shopcarList) {
//            判断要把商品加入购物车的顾客的ID，是否存在购物车表里
            if (s.getCustomer().getId().equals(customer.getId())) {
                flag = true;
                shopcar=s;
                break;
            }
        }
//        flag==true,说明顾客的ID已经存在购物车表里
        if (flag) {
            Map map1 = new HashMap();
            map1.put("shopcar", shopcar);
            List<Shopcar_goods> shopcar_goodsListList = sgsi.findByProp(map1);
            for (Shopcar_goods sg : shopcar_goodsListList) {
                if (sg.getGoods().getId().equals(goodsID)) {
                    flag1 = true;
                    shopcar_goods1 = sg;
                    break;
                }
            }

//      flag1==true,说明该顾客已经把该商品加入购物车了，不需要再插入数据，只需增加count数量即可
            if (flag1) {
                shopcar_goods1.setCount(shopcar_goods1.getCount() + Integer.parseInt(count));
                sgsi.update(shopcar_goods1);
            } else {
//                购物车表有相应的顾客ID，但是顾客没有收藏此类商品，所以向中间表插入一条数据
                Shopcar_goods shopcar_goods = new Shopcar_goods();
                shopcar_goods.setShopcar(shopcar);
                shopcar_goods.setGoods(goods);
                shopcar_goods.setCount(Integer.parseInt(count));
                sgsi.add(shopcar_goods);
            }

        } else {
//            flag==false,说明购物车表里没有该顾客的ID，直接将数据插入购物车表和中间表
            Shopcar shopcar1 = new Shopcar();
            shopcar1.setCustomer(customer);
            if (ssi.add(shopcar1)) {
                Shopcar_goods shopcar_goods = new Shopcar_goods();
                shopcar_goods.setShopcar(shopcar1);
                shopcar_goods.setGoods(goods);
                shopcar_goods.setCount(Integer.parseInt(count));
                sgsi.add(shopcar_goods);
            }
        }

     //  计算购物车表里的总金额
        Map map2 = new HashMap();
        List<Shopcar> shopcarList1 = ssi.findByProp(map2);
        for(Shopcar s:shopcarList1){
            float total=0;
            Map map3 = new HashMap();
            map3.put("shopcar",s);
            List<Shopcar_goods> shopcar_goodsList = sgsi.findByProp(map3);
            for(Shopcar_goods sg:shopcar_goodsList){
                total+=sg.getCount()*sg.getGoods().getPrice();
            }
            s.setTotal(total);
            ssi.update(s);
        }
        return "redirect:/cgi/shopcar/toShopcarUI";
    }

//    加入购物车成功之后，或者下订单之后，继续浏览其他商品
    @RequestMapping("/goodsDisplay")
    @Transactional
    public String goodsDisplay(HttpSession session){
        Enumeration atts = session.getAttributeNames();
        while (atts.hasMoreElements()){
            String name =(String)atts.nextElement();
            if(name.equals("goodID")){
//                删除session的属性名为goodsID 的属性
                session.removeAttribute(name);
            }
        }
        return "redirect:/cgi/goods/goodsDisplayUI";
    }

//    去购物车管理页面
    @RequestMapping("/toShopcarUI")
    public String toShopcarUI(Model model,HttpSession session){
        Customer customer = (Customer) session.getAttribute("customer");
        Shopcar shopcar = new Shopcar();
        shopcar.setCustomer(customer);
        Shopcar shopcar1 = ssi.findOneByProp(shopcar);
//        shopcar1==null,说明购物车表里没有记录该顾客的信息
        if(shopcar1!=null){
//            获取该顾客，购物车里商品的总金额
            Float total = shopcar1.getTotal();
//        根据购物车ID，获取这个顾客在购物车里的所有商品
            Map map = new HashMap();
            map.put("shopcar",shopcar1);
            List<Shopcar_goods> shopcar_goodsList = sgsi.findByProp(map);
            model.addAttribute("content",shopcar_goodsList);
            model.addAttribute("total",total);
        }else {
            shopcar.setTotal(0);
            ssi.add(shopcar);
        }
        return "/shopcar/shopcar";
    }

   // 在购物车里，令某一个商品，数量增加1
    @RequestMapping("/addOneGoods/{id}")
    @Transactional
    public String addOneGoods(@PathVariable String id){
        Shopcar_goods shopcar_goods = sgsi.findOneById(id);
    //    将商品的数量加1，对购物车中间类进行更新
        shopcar_goods.setCount(shopcar_goods.getCount()+1);
        if(sgsi.update(shopcar_goods)){
    //       根据购物车中间类，获取购物车表的总金额,进行更新
            Shopcar shopcar = ssi.findOneById(shopcar_goods.getShopcar().getId());
            shopcar.setTotal(shopcar.getTotal()+shopcar_goods.getGoods().getPrice());
            ssi.update(shopcar);
        }
        return "redirect:/cgi/shopcar/toShopcarUI";
    }

    // 在购物车里，令某一个商品，数量减少1
    @RequestMapping("/reduceOneGoods/{id}")
    @Transactional
    public String reduceOneGoods(@PathVariable String id){
        Shopcar_goods shopcar_goods = sgsi.findOneById(id);
        if(shopcar_goods.getCount()>1){
//            将商品的数量减1，对购物车中间类进行更新
            shopcar_goods.setCount(shopcar_goods.getCount()-1);
            if(sgsi.update(shopcar_goods)){
//                根据购物车中间类的购物类的id，获取购物车表的总金额,进行更新
                Shopcar shopcar = ssi.findOneById(shopcar_goods.getShopcar().getId());
                shopcar.setTotal(shopcar.getTotal()-shopcar_goods.getGoods().getPrice());
                ssi.update(shopcar);
                }
            }
        return "redirect:/cgi/shopcar/toShopcarUI";
    }

    //  删除购物车里的商品,商品总金额也应该相应减少
    @RequestMapping("/deleteGoods/{id}")
    @Transactional
    public String deleteGoods(@PathVariable String id){
        Shopcar_goods shopcar_goods = sgsi.findOneById(id);
        float total = shopcar_goods.getCount()*shopcar_goods.getGoods().getPrice();
        if(sgsi.delete(shopcar_goods)){
            Shopcar shopcar = ssi.findOneById(shopcar_goods.getShopcar().getId());
            shopcar.setTotal(shopcar.getTotal()-total);
            ssi.update(shopcar);
            return "redirect:/cgi/shopcar/toShopcarUI";
        }else {
            return "/shopcar/success";
        }
    }


//    清空购物车，删除购物车里面所有的商品
    @RequestMapping("/deleteAllGoods")
    @Transactional
    public String deleteAllGoods(HttpSession session){
        Customer customer = (Customer) session.getAttribute("customer");
        System.out.println("顾客"+customer);
        Shopcar shopcar = new Shopcar();
        shopcar.setCustomer(customer);
//        找到该顾客的购物车
        Shopcar shopcar1 = ssi.findOneByProp(shopcar);
        System.out.println("购物车"+shopcar1);

//        根据购物车ID找到购物车中间表里相对于的商品
        Map map = new HashMap();
        map.put("shopcar",shopcar1);
        List<Shopcar_goods> shopcar_goodsList = sgsi.findByProp(map);
        System.out.println(shopcar_goodsList.size());
        for (Shopcar_goods sg:shopcar_goodsList){
            sgsi.delete(sg);
        }

//        购物车清空之后，将购物车里的总金额设置为0
        shopcar1.setTotal(0);
        ssi.update(shopcar1);

        return "redirect:/cgi/shopcar/toShopcarUI";
    }


//    去下单页面
    @RequestMapping("/toOrderUI")
    public String toOrderUI(Model model,HttpSession session){
//        得到当前顾客，查找相应的购物车
        Customer customer = (Customer) session.getAttribute("customer");
        Shopcar shopcar = new Shopcar();
        shopcar.setCustomer(customer);
        Shopcar shopcar1 = ssi.findOneByProp(shopcar);//查找到相应的购物车
        float total = shopcar1.getTotal();//得到购物车的总金额,将值传递到页面
        model.addAttribute("total",total);

//        根据购物车ID传递到页面
        model.addAttribute("shopcarID",shopcar1.getId());
        return "/shopcar/choose2";
    }



    //管理员查看所有的购物车信息，进行管理
    @RequestMapping("/manage")
    public String manage(Model model,HttpServletRequest request) throws SQLException {
        String pageNow = request.getParameter("pageNow");
        Page1 page = null;
        List<Shopcar_goods> list = new ArrayList<>();
        int totalCount = (int) sgsi.getShopcarCount();
        if(pageNow !=null){
            page = new Page1(totalCount,Integer.parseInt(pageNow));
            list = sgsi.selectShopcarByPage(page.getStartPos(),page.getPageSize());
        }else {
            page = new Page1(totalCount,1);
            list = sgsi.selectShopcarByPage(page.getStartPos(),page.getPageSize());
        }

        model.addAttribute("content",list);
        model.addAttribute("page",page);

        return "/shopcar/shopcarManage";
    }







}
