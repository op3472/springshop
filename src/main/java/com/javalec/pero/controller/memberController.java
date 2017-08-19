package com.javalec.pero.controller;
import com.javalec.pero.dto.memberDto;
import com.javalec.pero.service.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class memberController {
	  @Autowired
	  private productservice service2;
	  
	  @Autowired
	  private memberservice service;
	  @RequestMapping(value = { "/home.do", "/" })
		    public ModelAndView home(ModelAndView mav){
		  		int limit=12;
		  	     int startrow=(1-1)*limit+1;
			     int endrow=startrow+limit-1;
		        mav.setViewName("home");
		        mav.addObject("list", service2.listProduct(startrow-1,endrow-startrow+1));
		        mav.addObject("banner", service2.listbanner());
		        
		        return mav;
		    }
	 @RequestMapping("/member/write.do")
	    public String memberWrite(){
	        
	        return "member/member_write";
	    }
	 
	 @RequestMapping("/member/IdCheckForm.do")
	    public String IdCheckForm(){
	        return "member/IdCheckForm";
	    }
	 @RequestMapping("/member/MemberIdCheckAction.do")
	 	public String IdCheck(HttpServletRequest request,HttpServletResponse response,Model model){
		 model.addAttribute("request",request);
		 model.addAttribute("response",response);
		 
		 service.MemberIdCheckActio(model);
		 return null;
	 }
	 @RequestMapping("/member/insert.do")
	 	public String insert(@ModelAttribute memberDto vo){
		
		 service.MemberInsert(vo);
		 return "member/joinOk";
	 }
	 @RequestMapping("/login.do")
	 	public String login(@ModelAttribute memberDto vo,HttpServletResponse response,HttpSession session,Model model) throws IOException{
		 model.addAttribute("response",response);
		 model.addAttribute("session",session);
		 if(vo.getUserId().equals("admin")){
		 service.Memberlogin(vo,model);
	     return "redirect:admin/home.do";	 
		 }
		 else{
		 service.Memberlogin(vo,model);
		 return "redirect:home.do";
		 }
	 }
	 @RequestMapping("/logout.do")
	 	public String logout(HttpSession session){
		 session.invalidate();
		 return "redirect:home.do";
	 }
	 @RequestMapping("/myinfo.do")
	 	public String myinfo(){
		 
		 return "myinfo";
	 }
	 @RequestMapping("/info.do")
	 	public String info(HttpSession session,Model model) {
		 String id= (String)session.getAttribute("id");
		 memberDto dto =service.infomation(id);
		 model.addAttribute("member",dto);
		 return "info";
	 }
	 @RequestMapping("/update.do")
	 	public String update(@ModelAttribute memberDto vo){
		
		 service.Memberupdate(vo);
		 return "member/updateOk";
	 }
	 @RequestMapping("/memberdeleteform.do")
	 	public String deleteform(){
		 return "member/deleteform";
	 }
	 @RequestMapping("delete.do")
	 	public void memberdelete(HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model) throws IOException{
		 model.addAttribute("request",request);
		 response.setContentType("text/html;charset=euc-kr"); 
         PrintWriter out = response.getWriter(); 
		 int result=service.Memberselect(model);
		 if(result==0){
			 out.println("<script>"); 
			  out.println("alert('비밀번호가 틀립니다.');"); 
	          out.println("location.href='memberdeleteform.do';"); 
	          out.println("</script>"); 
	          out.close(); 
			 
		 }
		 else{
			 service.Memberdelete(model);
		 session.invalidate();
		  out.println("<script>"); 
          out.println("alert('성공적으로 삭제되었습니다.');"); 
          out.println("location.href='home.do';"); 
          out.println("</script>"); 
          out.close(); 
		 }
		 
	 }
	 @RequestMapping("/admin/home.do")
	    public String adminhome(){
	        
	        return "admin/home";
	   }
	
	 
	 
}
