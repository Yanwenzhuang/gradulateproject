package com.edusoft.controller;

import com.edusoft.dto.Manager;
import com.edusoft.service.impl.ManagerServiceImpl;
import com.edusoft.util.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

@Controller
@RequestMapping("/cgi/manager")
public class ManagerController {
    @Autowired
    ManagerServiceImpl msi;
    @Autowired
    Manager manager;


//    去注册界面
    @RequestMapping("/toRegisterUI")
    public String register(){
        return "/manager/register";
    }

//    管理员注册，向数据库添加一条数据
    @RequestMapping("/doRegister")
    public String doRegister(Manager manager) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        manager.setPassword(Utils.EncoderByMd5(manager.getPassword()));
        msi.add(manager);
        return "/manager/login";
    }

//    去登录页面
    @RequestMapping(value = "/toLoginUI",method = RequestMethod.GET)
    public String toLoginUI(){
        return "/manager/login";
    }
//    根据账号和密码进行登录
    @RequestMapping(value = "/doLogin",method = RequestMethod.POST)
    public String doLogin(String username, String password,
                          HttpSession session, HttpServletRequest request)
            throws UnsupportedEncodingException, NoSuchAlgorithmException {

        manager.setUsername(username);
        manager.setPassword(Utils.EncoderByMd5(password));
        Manager manager1 = msi.findOneByProp(manager);


        if(manager1!=null){
            session.setAttribute("manager",manager1);
            return "/manager/index";
        }else {
            request.setAttribute("msg","用户名或密码错误");
            return "/manager/login";
        }
    }

    // 管理员管理页面的注销处理
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        //清除session的数据
        session.invalidate();
        return "/manager/login";
    }
    // 直接登录manage.jsp主页,需要写一个拦截器进行拦截
    // 管理员的管理页面
    @RequestMapping(value = "/manage")
    public String manage(){
        return "/manager/index";
    }


}
