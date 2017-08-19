package com.javalec.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter{
    // 요청 전 처리
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 세션객체 생성
        HttpSession session = request.getSession();
        // session에 관리자id가 null이면
        if(session.getAttribute("id").equals("admin")){
        	return true; // 요청 실행 O
        // null이 아니면
        } else {
        	response.sendRedirect(request.getContextPath()+"/home.do"); //일반사용자 로그인화면으로 리다이렉트
            return false; // 요청 실행 X
            
        }
    }
    // 요청 처리 후 
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        // TODO Auto-generated method stub
        super.postHandle(request, response, handler, modelAndView);
    }
}
