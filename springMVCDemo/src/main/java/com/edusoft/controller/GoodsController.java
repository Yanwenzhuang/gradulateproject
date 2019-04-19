package com.edusoft.controller;

import com.edusoft.dto.*;
import com.edusoft.service.impl.CategoryServiceImpl;
import com.edusoft.service.impl.GoodsServiceImpl;
import com.edusoft.service.impl.SellerServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cgi/goods")
public class GoodsController {
//    商品服务类对象
    @Autowired
    GoodsServiceImpl gsi;
    @Autowired
    SellerServiceImpl ssi;
    @Autowired
    CategoryServiceImpl csi;

//    管理员进入的商品的管理页面
    @RequestMapping("/goodsManage")
    public String goodsManage(Model model,HttpServletRequest request,
                              HttpSession session,String name){
        Seller seller = (Seller)session.getAttribute("seller");
//        Manager manager = (Manager)session.getAttribute("manager");
        Map queryMap = new HashMap();
        if(seller!=null){   //如果是商家，就以商家的id进行模糊查询商品
            queryMap.put("seller",seller);
        }

        String pageNow = request.getParameter("pageNow");
        Page1 page = null;
        List<Goods> goodsList = new ArrayList<>();
        int totalCount = (int) gsi.getGoodsCount(name);
        if(pageNow !=null){
            page = new Page1(totalCount,Integer.parseInt(pageNow));
            goodsList = gsi.selectGoodsByPage(name,page.getStartPos(),
                    page.getPageSize());
        }else {
            page = new Page1(totalCount,1);
            goodsList = gsi.selectGoodsByPage(name,page.getStartPos(),
                    page.getPageSize());
        }
        Map map = new HashMap();
        map.put("data",goodsList);
        model.addAttribute("content",map);
        model.addAttribute("page",page);
        return "/goods/goodsManage";
    }

    //    商家进入的商品的管理页面
    @RequestMapping("/manage")
    public String manage( HttpSession session,HttpServletRequest request,Model model,String categoryID,String sellerID){
        Seller seller = (Seller)session.getAttribute("seller");
        sellerID = seller.getId();
        String pageNow = request.getParameter("pageNow");
        Page page = null;
        List<Goods> goodsList = new ArrayList<>();
        int totalCount = (int) gsi.getSellerCount(categoryID,sellerID);
        if(pageNow !=null){
            page = new Page(totalCount,Integer.parseInt(pageNow));
            goodsList = gsi.selectGoodsBySeller(categoryID,sellerID,page.getStartPos(),page.getPageSize());
        }else {
            page = new Page(totalCount,1);
            goodsList = gsi.selectGoodsBySeller(categoryID,sellerID,page.getStartPos(),page.getPageSize());
        }
        model.addAttribute("content",goodsList);
        model.addAttribute("page",page);
        return "/goods/sellerManage";
    }


//        顾客进入商家的店铺
    @RequestMapping("/cusotmerInShop/{shopname}")
    public String cusotmerInShop(@PathVariable String shopname,HttpServletRequest request,
                           Model model,String categoryID,String sellerID) throws SQLException {
        Seller seller = new Seller();
        seller.setShopname(shopname);
        Seller seller1 = ssi.findOneByProp(seller);
        if(seller1!=null){
            sellerID = seller1.getId();
        }
        String pageNow = request.getParameter("pageNow");
        Page page = null;
        List<Goods> goodsList = new ArrayList<>();
        int totalCount = (int) gsi.getSellerCount(categoryID,sellerID);
        if(pageNow !=null){
            page = new Page(totalCount,Integer.parseInt(pageNow));
            goodsList = gsi.selectGoodsBySeller(categoryID,sellerID,
                    page.getStartPos(),page.getPageSize());
        }else {
            page = new Page(totalCount,1);
            goodsList = gsi.selectGoodsBySeller(categoryID,sellerID,
                    page.getStartPos(),page.getPageSize());
        }
        model.addAttribute("content",goodsList);
        model.addAttribute("shopname",shopname);
        model.addAttribute("page",page);

        return "/goods/manage";
    }

//      没登录前的商品展示页面，以及顾客登录之后的商品展示页面
    @RequestMapping("/goodsDisplayUI")
    public String goodsDisplay(Model model,HttpSession session,
                               HttpServletRequest request,String name){
        // 顾客没登录前选中商品的id
        String goodsID=(String)session.getAttribute("goodID");
        if (goodsID==null){
            String pageNow = request.getParameter("pageNow");
            Page page = null;
            List<Goods> goodsList = new ArrayList<>();
            int totalCount = (int) gsi.getGoodsCount(name);
            if(pageNow !=null){
                page = new Page(totalCount,Integer.parseInt(pageNow));
                goodsList = gsi.selectGoodsByPage(name,page.getStartPos(),
                        page.getPageSize());
            }else {
                page = new Page(totalCount,1);
                goodsList = gsi.selectGoodsByPage(name,page.getStartPos(),
                        page.getPageSize());
            }
            model.addAttribute("content",goodsList);
            model.addAttribute("page",page);
            return "/goods/index";
        }else {   //如果goodsID不为空，说明顾客登录前，有选中的商品
            Goods goods = gsi.findOneById(goodsID);
            model.addAttribute("goods",goods);
            return "/goods/oneGoods";
        }
    }


    //    顾客浏览单个商品
    @RequestMapping("/toOneGoodsUI/{id}")
    public String toGoodsBuyUI(@PathVariable String id,Model model ){
        Goods goods = gsi.findOneById(id);
        model.addAttribute("goods",goods);
        return "/goods/oneGoods";
    }


    //  去商品的编辑页面，添加新商品
    @RequestMapping("/toGoodsEditUI")
    public String addGoods(){
        return "/goods/edit";
    }

//    去商品的编辑页面，修改商品属性
    @RequestMapping("/toGoodsEditUI/{id}")
    public String toGoodsEdit(@PathVariable String id,Model model){
        Goods goods = gsi.findOneById(id);
        model.addAttribute("goods",goods);
        return "/goods/edit";
    }

//    对商品进行更新或新增
    @RequestMapping("/doGoodsUpdate")
    public String doGoodsUpdate(Goods goods,
               @RequestParam("uploadfile") List<MultipartFile> uploadfile)
            throws IOException {
//        判断所上传的文件是否存在
        MultipartFile file = uploadfile.get(0);
//        file.getOriginalFilename().equals("")表示没有修改或选择图片
        if(!file.getOriginalFilename().equals("")){
//            获取上传文件的原始名称，单个图片上传，取第一个元素
            String originalFilename = file.getOriginalFilename();
//            设置图片存放路径
            String ditPath = "C:/Users/Administrator/Desktop/upload/";
            File filePath = new File(ditPath);
//            如果保存文件的路径不存在，则先创建目录
            if(!filePath.exists()){
                filePath.mkdirs();
            }
//            使用MultipartFile接口的方法，把文件上传到指定的位置
//            1、文件复制到目标处
            file.transferTo(new File(ditPath+originalFilename));
//            2、回写图片信息进对象，以便持久化
            goods.setImage(originalFilename);
        }

        if(goods.getId().equals("")){
            gsi.add(goods);
        }else {
            gsi.update(goods);
        }
        return "redirect:/cgi/goods/manage";
    }

//    根据商家id，查询商品
    @RequestMapping("/findGoodsBySeller")
    @ResponseBody
    public List<Goods> findGoodsBySeller(@RequestParam String sellerID) throws SQLException {
        List<Goods> list = gsi.findGoodsBySeller(sellerID);
        return list;
    }

    //    根据分类id，查询商品
    @RequestMapping("/findGoodsByCategory")
    @ResponseBody
    public List<Goods> findGoodsByCategory(@RequestParam String categoryID) throws SQLException {
        List<Goods> list = gsi.findGoodsByCategory(categoryID);
        return list;
    }


    //    根据分类名称，查询商品
    @RequestMapping("/findGoodsByCategoryText/{text}")
    public String findGoodsByCategoryText(@PathVariable String text,HttpServletRequest request,Model model,
                HttpSession session,String categoryID,String sellerID) throws SQLException {
        String name = text;
        Seller seller = (Seller)session.getAttribute("seller");
        if (seller!=null){
            sellerID = seller.getId();
        }
        Category category = new Category();
        category.setText(text);
        Category category1 = csi.findOneByProp(category);
        if (category1!=null){
            categoryID = category1.getId();
        }
        String pageNow = request.getParameter("pageNow");
        Page page = null;
        List<Goods> goodsList = new ArrayList<>();
        int totalCount = (int) gsi.getCatogoryGoodsCount(categoryID,sellerID);
        if(pageNow !=null){
            page = new Page(totalCount,Integer.parseInt(pageNow));
            goodsList = gsi.selectGoodsByCategory(categoryID,sellerID,page.getStartPos(),page.getPageSize());
        }else {
            page = new Page(totalCount,1);
            goodsList = gsi.selectGoodsByCategory(categoryID,sellerID,page.getStartPos(),page.getPageSize());
        }

        model.addAttribute("content",goodsList);
        model.addAttribute("page",page);
        model.addAttribute("text",name);
        return "/goods/byCategory";
    }

 //    点击'购买'按钮，判断顾客是否登录，没登录就先跳转到登录界面
    @RequestMapping("/toGoodsBuyUI/{id}")
    public String toGoodsBuyUI(@PathVariable String id ,Model model,
                               HttpSession session){
        session.setAttribute("goodID",id);
        Customer customer = (Customer) session.getAttribute("customer");
 //        customer不为空，说明用户已经登录了
        if(customer!=null){
            Goods goods = gsi.findOneById(id);
            model.addAttribute("goods",goods);
            return "/torder/choose1";
        }else {
            return "/customer/login";
        }
    }


//        点击购买之后，的下一步
    @RequestMapping("/toChoose2")
    public String chooseProperties(String goodsID,String count,String price,Model model){
        model.addAttribute("goodsID",goodsID);
        model.addAttribute("count",count);
        model.addAttribute("price",price);
        return "/torder/choose2";
    }


//    点击'购物车'按钮，判断顾客是否登录，没登录就先跳转到登录界面
    @RequestMapping("/toAddOnShopcarUI/{id}")
    public String toAddOnShopcarUI(@PathVariable String id,Model model,HttpSession session){
        session.setAttribute("goodID",id);
        Customer customer = (Customer) session.getAttribute("customer");
//        customer不为空，说明用户已经登录了
        if(customer!=null){
            Goods goods = gsi.findOneById(id);
            model.addAttribute("goods",goods);
            return "/shopcar/choose1";
        }else {
            return "/customer/login";
        }
    }

    //系统管理员删除某个商品
    @RequestMapping("/delete")
    public String doDelete(Goods goods) throws SQLException {
        String goodsID = goods.getId();
        Goods goods1 = gsi.findOneById(goodsID);
        gsi.delete(goods1);
        return "redirect:/cgi/goods/goodsManage";
    }





}
