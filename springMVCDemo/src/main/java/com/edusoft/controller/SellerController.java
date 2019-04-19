package com.edusoft.controller;

import com.alibaba.fastjson.JSON;
import com.edusoft.dto.*;
import com.edusoft.service.impl.Order_goodsServiceImpl;
import com.edusoft.service.impl.SellerServiceImpl;
import com.edusoft.util.Utils;
import com.sun.org.apache.xpath.internal.operations.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cgi/seller")
public class SellerController {
    @Autowired
    SellerServiceImpl ssi;
    @Autowired
    Seller seller;
    @Autowired
    Order_goodsServiceImpl ogsi;

//    管理员管理商家的页面
    @RequestMapping("/sellerManage")
    public String manage(Model model, HttpServletRequest request) throws SQLException {
        String pageNow = request.getParameter("pageNow");
        Page1 page = null;
        List<Seller> list = new ArrayList<>();
        int totalCount = (int) ssi.getSellerCount();
        if(pageNow !=null){
            page = new Page1(totalCount,Integer.parseInt(pageNow));
            list = ssi.selectSellerByPage(page.getStartPos(),page.getPageSize());
        }else {
            page = new Page1(totalCount,1);
            list = ssi.selectSellerByPage(page.getStartPos(),page.getPageSize());
        }

        model.addAttribute("content",list);
        model.addAttribute("page",page);
        return "/seller/sellerManage";
    }

//    获取商家的数据
    @RequestMapping("/getData")
    @ResponseBody
    public String getData() throws SQLException {
        Map queryMap = new HashMap();
        List<Seller> sellerList = ssi.findByProp(queryMap);
        Map map = new HashMap();
        map.put("data",sellerList);
        return JSON.toJSONString(map);
    }

    //查看顾客订单
    @RequestMapping("/toCustomerOrderUI")
    public String manage(HttpSession session,Model model) throws SQLException {
        Seller seller = (Seller)session.getAttribute("seller");
        String sellerID = seller.getId();
        Map map = new HashMap();
        List<Order_goods> ordergoodsList = new ArrayList<>();
        List<Order_goods> order_goodsList = ogsi.findByProp(map);
        for(int i=0;i<order_goodsList.size();i++){
            String id = order_goodsList.get(i).getGoods().getSeller().getId();
            if(id.equals(sellerID)){
                ordergoodsList.add(order_goodsList.get(i));
            }
        }
        model.addAttribute("content",ordergoodsList);
        return "/seller/customerOrder";
    }


//    去注册的页面
    @RequestMapping("/toSellerRegisterUI")
    public String toSellerRegisterUI(){
        return "/seller/edit";
    }

//    从注册页面获取数据进行数据，向数据库中添加一条记录
    @RequestMapping("/doSellerEdit")
    public String doSellerRegister(Seller seller,
                   @RequestParam("uploadfile") List<MultipartFile> uploadfile)
            throws IOException, NoSuchAlgorithmException, SQLException {
//        判断文件是否存在
//        MultipartFile file = uploadfile.get(0);
//        file.getOriginalFilename().equals("")表示没有选择图片
//        if(!file.getOriginalFilename().equals("")){
////            获取文件的原始名称，单个图片上传，取第一个元素
//            String originalFilename = file.getOriginalFilename();
////            设置文件的存放目录
//            String dirPath = "C:/Users/Administrator/Desktop/upload/";
//            File filePath = new File(dirPath+originalFilename);
////            判断文件的存放路径是否存在，如果不存在，就先创建目录
//            if(!filePath.exists()){
//                filePath.mkdirs();
//            }
//            使用MultipartFile接口的方法实现把文件上传到指定的位置
//            1、文件复制到目标处
//                file.transferTo(new File(filePath+originalFilename));
////            2、回写图片的信息进对象，以便持久化
//            seller.setLogo(originalFilename);
//        }
        if(seller.getId().equals("")){
            seller.setPassword(Utils.EncoderByMd5(seller.getPassword()));
            ssi.add(seller);
            return "/seller/login";
        }else {
            ssi.update(seller);
            return "redirect:/cgi/goods/manage";
        }

    }

//    去登录的界面
    @RequestMapping(value = "/toSellerLoginUI",method = RequestMethod.GET)
    public String toSellerLoginUI(){
        return "/seller/login";
    }

    @RequestMapping(value = "/doSellerLogin",method = RequestMethod.POST)
//    @ResponseBody
    public String doSellerLogin(String username, String password,HttpSession session, HttpServletRequest request)
            throws UnsupportedEncodingException, NoSuchAlgorithmException,SQLException {
        seller.setUsername(username);
        seller.setPassword(Utils.EncoderByMd5(password));
        Seller seller1 = ssi.findOneByProp(seller);
        Map map = new HashMap();
        if(seller1!=null){
            session.setAttribute("seller",seller1);
            return "redirect:/cgi/goods/manage";
        }else {
            request.setAttribute("message","用户名或密码错误");
           return "/seller/login";
        }
    }

    // 管理员管理页面的注销处理
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        //清除session的数据
        session.invalidate();
        return "redirect:/cgi/goods/goodsDisplayUI";
    }



    //去商家的个人管理页面
    @RequestMapping("/toSellerEditUI/{id}")
    public String toEditUI(@PathVariable String id,Model model) throws SQLException {
        Seller seller = ssi.findOneByld(id);
        model.addAttribute("seller",seller);
        return "/seller/edit";
    }

//    判断商家是否存在
    @RequestMapping("/isExist")
    @ResponseBody
    public String isExist(@RequestParam String username) throws SQLException {
        seller.setUsername(username);
        Seller seller1=ssi.findOneByProp(seller);
        Map map = new HashMap();
        if(seller1!=null){
            map.put("flag",1);
        }else {
            map.put("flag",0);
        }
        return JSON.toJSONString(map);
    }





}
