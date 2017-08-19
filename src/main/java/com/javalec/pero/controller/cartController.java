package com.javalec.pero.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.javalec.pero.dto.cartDto;
import com.javalec.pero.service.cartservice;



@Controller
@RequestMapping("/cart/*")
public class cartController {
	
	  @Autowired
	  private cartservice service;
	  
	   @RequestMapping("/insert.do")
	    public String insert(@ModelAttribute cartDto vo, HttpSession session){
	        String userId = (String) session.getAttribute("id");
	        vo.setUserId(userId);
	        // 장바구니에 기존 상품이 있는지 검사
	        int count = service.countCart(vo.getProductId(), userId);
	        if(count == 0){
	            // 없으면 insert
	            service.insert(vo);
	        } else {
	            // 있으면 update
	            service.updateCart(vo);
	        }
	        return "redirect:/cart/list.do";
	    }
	   @RequestMapping("/list.do")
	    public ModelAndView list(HttpSession session, ModelAndView mav){
	        String userId = (String) session.getAttribute("id"); // session에 저장된 userId
	        Map<String, Object> map = new HashMap<String, Object>();
	        List<cartDto> list = service.listCart(userId); // 장바구니 정보 
	        int sumMoney = service.sumMoney(userId); // 장바구니 전체 금액 호출
	        // 장바구니 전체 긍액에 따라 배송비 구분
	        // 배송료(10만원이상 => 무료, 미만 => 2500원)
	        int fee = sumMoney >= 100000 ? 0 : 2500;
	        map.put("list", list);                // 장바구니 정보를 map에 저장
	        map.put("count", list.size());        // 장바구니 상품의 유무
	        map.put("sumMoney", sumMoney);        // 장바구니 전체 금액
	        map.put("fee", fee);                 // 배송금액
	        map.put("allSum", sumMoney+fee);    // 주문 상품 전체 금액
	        mav.setViewName("cart/cartList");    // view(jsp)의 이름 저장
	        mav.addObject("map", map);            // map 변수 저장
	        return mav;
	    }
	    @RequestMapping("/delete.do")
	    public String delete(@RequestParam int cartId){
	        service.delete(cartId);
	        return "redirect:/cart/list.do";
	    }
	    @RequestMapping("/order.do")
	    public String order(){
	      
	        return "cart/order";
	    }
	    @RequestMapping("update.do")
	    public String update(@RequestParam int[] amount, @RequestParam int[] productId, HttpSession session) {
	        // session의 id
	        String userId = (String) session.getAttribute("id");
	        // 레코드의 갯수 만큼 반복문 실행
	        for(int i=0; i<productId.length; i++){
	            cartDto vo = new cartDto();
	            vo.setUserId(userId);
	            vo.setAmount(amount[i]);
	            vo.setProductId(productId[i]);
	            service.modifyCart(vo);
	        }

	        return "redirect:/cart/list.do";
	    }
	    
	    @RequestMapping("order/insert.do")
	    public String order(@RequestParam String address,@RequestParam String tele,@RequestParam int[] productId,@RequestParam int[] amount, @RequestParam String[] productName, @RequestParam int[] money, @RequestParam int allsum,HttpSession session) {
	        // session의 id
	        String userId = (String) session.getAttribute("id");
	        int val=service.ordernextsequence();
	        // 레코드의 갯수 만큼 반복문 실행
	        for(int i=0; i<productId.length; i++){
	            cartDto vo = new cartDto();
	            vo.setCartId(val);
	            vo.setUserId(userId);
	            vo.setAmount(amount[i]);
	            vo.setProductName(productName[i]);
	            
	            vo.setMoney(money[i]);
	            service.order(vo);
	        }
	        service.orderlist(val,userId,allsum,address,tele);
	        return "redirect:/cart/order/list.do?page=1";
	    }
	    @RequestMapping("order/list.do")
	    public  ModelAndView list2(HttpSession session,ModelAndView mav,@RequestParam int page){
	    	  mav.setViewName("cart/orderlist");
	    	  String userId = (String) session.getAttribute("id");
	    	  int limit=10; 
		      int startrow=(page-1)*limit+1;
		      int endrow=startrow+limit-1;
		      int listcount = service.getListCount(userId);
		      int maxpage=(int)((double)listcount/limit+0.95); //0.95를 더해서 올림 처리. 
		         //현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...) 
		         int startpage = (((int) ((double)page / limit + 0.9)) - 1) * limit + 1; 
		         //현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...) 
		         int endpage = maxpage; 
		         if (endpage<startpage+limit-1) endpage=maxpage; 

				 mav.setViewName("cart/orderlist"); 
				 mav.addObject("page",page);
				 mav.addObject("maxapage",maxpage);
				 mav.addObject("startpage", startpage);
				 mav.addObject("endpage",endpage);
				 mav.addObject("list",service.list(userId,startrow-1,endrow-startrow+1));
	    	  return mav;
	    }
	    @RequestMapping("/detail.do")
	    public  ModelAndView detail(ModelAndView mav,@RequestParam int num){
	    	int sumMoney = service.sumMoney2(num); // 장바구니 전체 금액 호출
	        int fee = sumMoney >= 100000 ? 0 : 2500;
	    	mav.addObject("order",service.detailorder(num));
	    	mav.addObject("list",service.detail(num));
	    	mav.addObject("deli", service.delivery(num));
	    	mav.addObject("fee", fee);
	    	mav.addObject("allsum", sumMoney+fee);
	    	mav.setViewName("cart/detail");
	    
			return mav;
	    }
	    @RequestMapping("admin/detail.do")
	    public  ModelAndView detail2(ModelAndView mav,@RequestParam int num){
	    	int sumMoney = service.sumMoney2(num); // 장바구니 전체 금액 호출
	        int fee = sumMoney >= 100000 ? 0 : 2500;
	    	mav.addObject("order",service.detailorder(num));
	    	mav.addObject("list",service.detail(num));
	    	mav.addObject("deli", service.delivery(num));
	    	mav.addObject("fee", fee);
	    	mav.addObject("allsum", sumMoney+fee);
	    	mav.setViewName("admin/detail");
	    
			return mav;
	    
	    }
}
