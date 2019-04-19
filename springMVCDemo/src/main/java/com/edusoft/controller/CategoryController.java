package com.edusoft.controller;


import com.alibaba.fastjson.JSON;
import com.edusoft.dto.Category;
import com.edusoft.dto.Manager;
import com.edusoft.dto.Page;
import com.edusoft.dto.Page1;
import com.edusoft.service.impl.CategoryServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//控制层
@Controller
@RequestMapping("/cgi/category")
public class CategoryController {
    //自动注入
    @Autowired
    CategoryServiceImpl csi;
    @Autowired
    Category category;

    //    请求映射
    @RequestMapping("/manage")  //HandlerMapping
   //    @ResponseBody
    public String doManage(Model model, HttpServletRequest request)
            throws SQLException {
        String pageNow = request.getParameter("pageNow");
        Page1 page = null;
        List<Category> list = new ArrayList<>();
        int totalCount = (int) csi.getCategoryCount();
        if(pageNow !=null){
            page = new Page1(totalCount,Integer.parseInt(pageNow));
            list = csi.selectCategoryByPage(page.getStartPos(),page.getPageSize());
        }else {
            page = new Page1(totalCount,1);
            list = csi.selectCategoryByPage(page.getStartPos(),page.getPageSize());
        }
        Map map = new HashMap();
        map.put("success", true);
        map.put("data", list);
        map.put("status", 200);
    //     将数据添加到域对象model
       model.addAttribute("content",map);
       model.addAttribute("page",page);
    //    视图信息，根据视图解析规则拼接具体页面信息
       return "/category/categoryManage";
    }

    //getDate
    @RequestMapping("/getData")  //HandlerMapping
    @ResponseBody
    public String getData() throws SQLException {
        Map queryMap = new HashMap();
        List<Category> list = csi.findByProp(queryMap);
        Map map = new HashMap();
//        map.put("success", true);
        map.put("data", list);
        return JSON.toJSONString(map);
    }


    @RequestMapping("/findOneById/{id}")
    public String doFindOneById(@PathVariable String id,Model model) throws SQLException {
        //查找对象
        Category category = csi.findOneByld(id);
        //将数据添加到域对象model上
        model.addAttribute("category",category);

        return "/category/edit";
    }

    @RequestMapping("/update")
    public String doUpdate(Category category) throws SQLException {
        String page="";
        //根据对象的id属性进行判断，如果没有，则添加
        if(category.getId().equals("")){
            if(csi.add(category)){
                page = "redirect:/cgi/category/manage";//重定向
            }else {
                page ="/category/edit";
            }
        }else {
            if(csi.update(category)){
                page="redirect:/cgi/category/manage";//重定向
            }else{
                page="/category/edit";
            }
        }
        return page;
    }

    @RequestMapping("/toEdit")
    public String toEdit(){
        return "/category/edit";
    }


    @RequestMapping("/delete")
    public String doDelete(Category category) throws SQLException {
        //查找对象
        csi.delete(category);
        return "redirect:/cgi/category/manage";
    }

}
