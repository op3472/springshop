package com.javalec.pero.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.pero.dto.bannerDto;
import com.javalec.pero.dto.deliveryDto;
import com.javalec.pero.dto.orderDto;
import com.javalec.pero.dto.productDto;
import com.javalec.pero.dao.productDao;

@Service
public class productservice {
	  @Autowired
	  private productDao productDao;	
	  
	  public List<productDto> listProduct(int startrow,int endrow) {
	        return productDao.listproduct(startrow,endrow);
	    }
	  public List<productDto> listProductnum(int num,int startrow,int endrow) {
	        return productDao.listProductnum(num,startrow,endrow);
	    }
	  public productDto detailProduct(int productId){
		  return productDao.detailProduct(productId);
	  }
	  public int getListCount(int num){
		  return productDao.getListCount(num);
	  }
	  public int getbannerCount(){
		  return productDao.getbannerCount();
	  }
	  public List<bannerDto> listbannernum(int startrow,int endrow) {
	        return productDao.listbannernum(startrow,endrow);
	    }
	  public List<bannerDto> listbanner() {
	        return productDao.listbanner();
	    }
	  public void insertProduct(productDto vo) {
	        productDao.insertProduct(vo);
	   }
	  public void updateProduct(productDto vo) {
	        productDao.updateProduct(vo);
	    }
	  public void deleteProduct(int productId) {
	      productDao.deleteProduct(productId);
	    }
	  public void deleteCart(int productId) {
	      productDao.deleteCart(productId);
	    }
	    // 06. 상품이미지 삭제를 위한 이미지파일 정보
	  
	  public String fileInfo(int productId) {
	        return productDao.fileInfo(productId);
	    }
	   public int getListCount2(){
			  return productDao.getListCount2();
		  }
	  public List<orderDto> list2(int startrow,int endrow) {
	        return productDao.list2(startrow,endrow);
	   }
	  public void deliinsert(deliveryDto vo){
		  productDao.updateorderlist(vo.getNum());
		  productDao.deliinsert(vo);
	  }
	  public void complete(int num){
		  productDao.complete(num);
	  }
	  public void bannerinsert(bannerDto vo) {
	        productDao.bannerinsert(vo);
	   }
	  public bannerDto detailbanner(int num){
		  return productDao.detailbanner(num);
	  }
	  public void updatebanner(bannerDto vo) {
	        productDao.updatebanner(vo);
	    }
	  public String bannerfileInfo(int num) {
	        return productDao.bannerfileInfo(num);
	    }
	  public void deletebanner(int num) {
	      productDao.deletebanner(num);
	    }
}
