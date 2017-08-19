package com.javalec.pero.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javalec.pero.dto.bannerDto;
import com.javalec.pero.dto.deliveryDto;
import com.javalec.pero.dto.orderDto;
import com.javalec.pero.dto.productDto;

@Repository
public interface productDao {
	public List<productDto> listproduct(int startrow,int endrow);
	public productDto detailProduct(int productId);
	public int getListCount(int num);
	 public List<productDto> listProductnum(int num,int startrow,int endrow);
	 public void insertProduct(productDto vo);
	 public void updateProduct(productDto vo);
	 public void deleteProduct(int productId);
	 public String fileInfo(int productId);
	 public void deleteCart(int productId);
	 public int getListCount2();
	 public List<orderDto> list2(int startrow,int endrow);
	 public void updateorderlist(int num);
	 public void deliinsert(deliveryDto vo);
	 public void complete(int num);
	 public List<bannerDto> listbannernum(int startrow,int endrow);
	 public int getbannerCount();
	 public List<bannerDto> listbanner();
	 public void bannerinsert(bannerDto vo);
	 public bannerDto detailbanner(int num);
	 public void updatebanner(bannerDto vo);
	 public String bannerfileInfo(int num);
	  public void deletebanner(int num);
}
