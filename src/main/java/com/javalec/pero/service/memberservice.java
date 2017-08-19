package com.javalec.pero.service;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.javalec.pero.dao.*;
import com.javalec.pero.dto.memberDto;
@Service
public class memberservice {
	  @Autowired
	  private memberDao memberDao;	
	  
	  public void MemberIdCheckActio(Model model){
		  Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		String id = request.getParameter("id");
		int result =memberDao.duplicateIdCheck(id);
		
		
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out;
		try {
			out = response.getWriter();
			if(result!=0)  out.println("0"); // 아이디 중복
	        else        out.println("1");
	        
	        out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	
        
	  }
	  
	  public void MemberInsert(memberDto vo){
		  memberDao.MemberInsert(vo);
	  }
	  
	  public void Memberlogin(memberDto vo,Model model) throws IOException{
		  Map<String, Object> map = model.asMap();
		  memberDto dto=memberDao.Memberlogin(vo);
		  HttpServletResponse response = (HttpServletResponse) map.get("response");
		  HttpSession session = (HttpSession) map.get("session");
		  response.setContentType("text/html;charset=euc-kr"); 
          PrintWriter out = response.getWriter(); 
          System.out.println();
		  if(dto==null){
			  out.println("<script>"); 
			  out.println("alert('아이디가 존재하지  않습니다.');"); 
	          out.println("location.href='home.do';"); 
	          out.println("</script>"); 
	          out.close(); 
		  }
		  else if(!vo.getUserPw().equals(dto.getUserPw())){
			  out.println("<script>"); 
	          out.println("alert('비밀번호가 일치하지 않습니다.');"); 
	          out.println("location.href='home.do';"); 
	          out.println("</script>"); 
	          out.close(); 
		  }
		  else{
			  session.setAttribute("id",vo.getUserId() );
		  }
	  }
	  
	  public memberDto infomation(String id){
		 return memberDao.info(id);
		  
	  }
	  
	  
	  public void Memberupdate(memberDto vo){
		  memberDao.Memberupdate(vo);
	  }
	  public int Memberdelete(Model model) throws IOException{
		  Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String id = request.getParameter("userId");
		String pass = request.getParameter("userPw");
		memberDao.membercart(id);
		memberDao.memberorders(id);
		memberDao.memberorderlist(id);
		return memberDao.Memberdelete(id, pass);
	
	  }
	  public int Memberselect(Model model) throws IOException{
		  Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String id = request.getParameter("userId");
		String pass = request.getParameter("userPw");
		
		
		return memberDao.Memberselect(id, pass);
	
	  }
}
