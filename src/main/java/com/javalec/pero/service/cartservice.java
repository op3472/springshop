package com.javalec.pero.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.pero.dto.cartDto;
import com.javalec.pero.dto.deliveryDto;
import com.javalec.pero.dto.orderDto;
import com.javalec.pero.dto.productDto;
import com.javalec.pero.dao.*;

@Service
public class cartservice {
	 @Autowired
	  private cartDao cartDao;
	
	 public List<cartDto> listCart(String userId) {
	        return cartDao.listCart(userId);
	    }
	  public int sumMoney(String userId) {
	        return cartDao.sumMoney(userId);
	  }
	  public int sumMoney2(int num) {
	        return cartDao.sumMoney2(num);
	  }
	  public int countCart(int productId, String userId) {
	        return cartDao.countCart(productId, userId);
	    }
	   public void insert(cartDto vo) {
	        cartDao.insert(vo);
	    }
	    public void updateCart(cartDto vo) {
	        cartDao.updateCart(vo);
	    }
	    public void delete(int cartId) {
	        cartDao.delete(cartId);
	    }
	    public void modifyCart(cartDto vo) {
	        cartDao.modifyCart(vo);
	    }
	    public int ordernextsequence(){
	    	cartDao.updatesequence();
	    	return cartDao.selectsequence();
	    }
	    public void order(cartDto vo){
	    	cartDao.order(vo);
	    }
	    public void orderlist(int val,String userid,int allsum,String address,String tele){
	    	cartDao.empty(userid);
	    	cartDao.orderlist(val,userid,allsum,address,tele);
	    }
	    public int getListCount(String id){
			  return cartDao.getListCount(id);
		  }
	    public List<orderDto> list(String id,int startrow,int endrow) {
	        return cartDao.list(id,startrow,endrow);
	    }
	    public orderDto detailorder(int num){
	    	return cartDao.detailorder(num);
	    }
	    public List<cartDto> detail(int num){
	    	return cartDao.detail(num);
	    }
	    public deliveryDto delivery(int num){
	    	return cartDao.delivery(num);
	    }
}
