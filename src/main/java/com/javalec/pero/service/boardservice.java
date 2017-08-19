package com.javalec.pero.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.pero.dao.boardDao;
import com.javalec.pero.dto.boardDto;

@Service
public class boardservice {
	 	@Autowired
	  private boardDao Dao;
	 	
	  public int getListboardCount(){
		  return Dao.getListboardCount();
	  }
	  public List<boardDto> listboard(int startrow,int endrow) {
	        return Dao.listboard(startrow,endrow);
	   }
	  public void boardinsert(boardDto vo){
		  int num =Dao.maxnum();
		  	vo.setBoard_num(num);
		  Dao.boardinsert(vo);
	  }
	  public boardDto detailboard(int num){
		  Dao.boardreadcount(num);
		  return Dao.detailboard(num);
	  }
	  public void boardmodify(boardDto vo){
		  Dao.boardmodify(vo);
	  }
	  public void boarddelete(int num){
	       Dao.boarddelete(num);
	  }
	  public int getListqaboardCount(){
		  return Dao.getListqaboardCount();
	  }
	  public List<boardDto> listqaboard(int startrow,int endrow) {
	        return Dao.listqaboard(startrow,endrow);
	   }
	  public void qaboardinsert(boardDto vo){
		  int num =Dao.qamaxnum();
		  	vo.setBoard_num(num);
		  Dao.qaboardinsert(vo);
	  }
	  public boardDto detailqaboard(int num){
		  Dao.qaboardreadcount(num);
		  return Dao.detailqaboard(num);
	  }
	  public void qaboardmodify(boardDto vo){
		  Dao.qaboardmodify(vo);
	  }
	  public void qaboarddelete(int num){
		  List<Integer> a = Dao.qatree(num);
		  a.add(num);
		  for(int i=0; i<a.size(); i++){
			  Dao.qaboarddelete(a.get(i));
		  }
	       
	  }
	  public void qaboardreply(boardDto vo){
	
		  vo.setBoard_parent(vo.getBoard_num());
		  int num =Dao.qamaxnum();
		  vo.setBoard_num(num);
		  Dao.updateqa(vo.getBoard_re_ref(),vo.getBoard_re_seq());
		  vo.setBoard_re_seq(vo.getBoard_re_seq()-1);
		  vo.setBoard_re_lev(vo.getBoard_re_lev()+1);
		  Dao.insertreply(vo);
	  }
}
