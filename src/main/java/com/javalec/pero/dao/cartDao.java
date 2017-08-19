package com.javalec.pero.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javalec.pero.dto.cartDto;
import com.javalec.pero.dto.deliveryDto;
import com.javalec.pero.dto.orderDto;
import com.javalec.pero.dto.productDto;

@Repository
public interface cartDao {
	 public List<cartDto> listCart(String userId);
	 public int sumMoney(String userId);
	 public int sumMoney2(int num);
	 public int countCart(int productId, String userId);
	 public void insert(cartDto vo);
	 public void updateCart(cartDto vo);
	 public void delete(int cartId);
	 public void modifyCart(cartDto vo);
	 public void updatesequence();
	 public int selectsequence();
	 public void order(cartDto vo);
	 public void empty(String id);
	 public void orderlist(int val,String userid,int allsum,String address,String tele);
	 public deliveryDto delivery(int num);
	 public int getListCount(String id);
	 public List<orderDto> list(String id,int startrow,int endrow);
	 public orderDto detailorder(int num);
	 public List<cartDto> detail(int num);
}

