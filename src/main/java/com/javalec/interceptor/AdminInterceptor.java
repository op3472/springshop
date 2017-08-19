package com.javalec.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter{
    // ��û �� ó��
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // ���ǰ�ü ����
        HttpSession session = request.getSession();
        // session�� ������id�� null�̸�
        if(session.getAttribute("id").equals("admin")){
        	return true; // ��û ���� O
        // null�� �ƴϸ�
        } else {
        	response.sendRedirect(request.getContextPath()+"/home.do"); //�Ϲݻ���� �α���ȭ������ �����̷�Ʈ
            return false; // ��û ���� X
            
        }
    }
    // ��û ó�� �� 
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        // TODO Auto-generated method stub
        super.postHandle(request, response, handler, modelAndView);
    }
}
