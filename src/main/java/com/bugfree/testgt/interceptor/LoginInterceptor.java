package com.bugfree.testgt.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bugfree.testgt.model.User;
import com.bugfree.testgt.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        System.out.println("***********1u**********");
        User user = (User) session.getAttribute("user");
        if(user == null){
        	System.out.println("***********2u**********");
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            String email = auth.getName();
            System.out.println("***********2u**********"+email);
            //user = userService.findByUserName(email);
            //session.setAttribute("user", user);
        }

        return super.preHandle(request, response, handler);
    }
}
