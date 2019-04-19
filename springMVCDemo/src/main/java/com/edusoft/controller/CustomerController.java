package com.edusoft.controller;

import com.edusoft.dto.*;
import com.edusoft.service.impl.CustomerServiceImpl;
import com.edusoft.service.impl.Order_goodsServiceImpl;
import com.edusoft.util.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//控制层
@Controller
@RequestMapping("/cgi/customer")
public class CustomerController {
    @Autowired
    CustomerServiceImpl csi;
    @Autowired
    Customer customer;
    @Autowired
    Order_goodsServiceImpl ogsi;

//    管理员管理顾客用户的页面
    @RequestMapping("/customerManage")
    public String CustomerManage(Model model,HttpServletRequest request){
        String pageNow = request.getParameter("pageNow");
        Page1 page = null;
        List<Customer> list = new ArrayList<>();
        int totalCount = (int) csi.getCustomerCount();
        if(pageNow !=null){
            page = new Page1(totalCount,Integer.parseInt(pageNow));
            list = csi.selectCustomerByPage(page.getStartPos(),page.getPageSize());
        }else {
            page = new Page1(totalCount,1);
            list = csi.selectCustomerByPage(page.getStartPos(),page.getPageSize());
        }
        model.addAttribute("content",list);
        model.addAttribute("page",page);

        return "/customer/customerManage";
    }

    //    顾客查看自己的个人信息 的页面
//    @RequestMapping("/manage")
//    public String manage(Model model,HttpSession session){
//        Customer customer=(Customer)session.getAttribute("customer");
//        Map queryMap = new HashMap();
//        if (customer!=null){
//            queryMap.put("id",customer.getId());
//        }
//        List<Customer> customerList = csi.findByProp(queryMap);
//        model.addAttribute("content",customerList);
//        return "/customer/manage";
//    }


//    去顾客的注册页面
    @RequestMapping("/toCustomerRegisterUI")
    public String toCustomerRegisterUI(){
        return "/customer/edit";
    }
//    去顾客的修改页面
    @RequestMapping("/toSellerEditUI/{id}")
    public String toSellerEditUI(@PathVariable String id,Model model){
        Customer customer =csi.findOneById(id);
        model.addAttribute("customer",customer);
        return "/customer/edit";
    }

 //    顾客进行注册,或者修改个人信息
    @RequestMapping("/doCustomerEdit")
    public String doCustomerLoginUI(Customer customer)
            throws UnsupportedEncodingException, NoSuchAlgorithmException {

        if(customer.getId().equals("")){
            customer.setPassword(Utils.EncoderByMd5(customer.getPassword()));
            csi.add(customer);
            return "/customer/login";
        }else {
            csi.update(customer);
            return "redirect:/cgi/goods/goodsDisplayUI";
        }
    }

 //    去登录界面
    @RequestMapping(value = "/toCustomerLoginUI",method = RequestMethod.GET)
    public String toCustomerLoginUI(){
        return "/customer/login";
    }
 //    进行登录
    @RequestMapping(value = "/doCustomerLogin",method = RequestMethod.POST)
    public String doCustomerLogin(String username, String password,
                         HttpSession session,HttpServletRequest request)
            throws UnsupportedEncodingException, NoSuchAlgorithmException {
        customer.setUsername(username);
        customer.setPassword(Utils.EncoderByMd5(password));
        Customer customer1 = csi.findOneByProp(customer);
        if(customer1!=null){
            session.setAttribute("customer",customer1);
            return "redirect:/cgi/goods/goodsDisplayUI";
        }else {
            request.setAttribute("msg","用户名或密码错误");
            return "/customer/login";
        }
    }

    // 顾客账号的注销处理
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        //清除session的数据
        session.invalidate();
        return "redirect:/cgi/goods/goodsDisplayUI";
    }


    //顾客查看自己的所有订单
    @RequestMapping("/toCustomerOrderUI")
    public String manage(HttpSession session,Model model) throws SQLException {
        Customer customer = (Customer)session.getAttribute("customer");
        String customerID = customer.getId();
        Map map = new HashMap();
        List<Order_goods> ordergoodsList = new ArrayList<>();
        List<Order_goods> order_goodsList = ogsi.findByProp(map);
        for(int i=0;i<order_goodsList.size();i++){
            String id = order_goodsList.get(i).getTorder().getCustomer().getId();
            if(id.equals(customerID)){
                ordergoodsList.add(order_goodsList.get(i));
            }
        }
        model.addAttribute("content",ordergoodsList);
        return "/customer/customerOrder";
    }

}
