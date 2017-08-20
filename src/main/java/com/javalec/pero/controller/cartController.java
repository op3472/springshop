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
import com.javalec.pero.dto.feeDto;
import com.javalec.pero.service.cartservice;
import com.javalec.pero.util.Pageing;



@Controller
@RequestMapping("/cart/*")
public class cartController {
	
	  @Autowired
	  private cartservice service;

		private Pageing pageing;
	   @RequestMapping("/insert.do")
	    public String insert(@ModelAttribute cartDto vo, HttpSession session){
	        String userId = (String) session.getAttribute("id");
	        vo.setUserId(userId);
	        // ��ٱ��Ͽ� ���� ��ǰ�� �ִ��� �˻�
	        int count = service.countCart(vo.getProductId(), userId);
	        if(count == 0){
	            // ������ insert
	            service.insert(vo);
	        } else {
	            // ������ update
	            service.updateCart(vo);
	        }
	        return "redirect:/cart/list.do";
	    }
	   @RequestMapping("/list.do")
	    public ModelAndView list(HttpSession session, ModelAndView mav){
	        String userId = (String) session.getAttribute("id"); // session�� ����� userId
	        Map<String, Object> map = new HashMap<String, Object>();
	        List<cartDto> list = service.listCart(userId); // ��ٱ��� ���� 
	        feeDto fee = new feeDto();
	        fee.setSumMoney(service.sumMoney(userId));
	     
	        map.put("list", list);                // ��ٱ��� ������ map�� ����
	        map.put("count", list.size());        // ��ٱ��� ��ǰ�� ����
	        map.put("sumMoney",fee.getSumMoney());        // ��ٱ��� ��ü �ݾ�
	        map.put("fee", fee.getFee());                 // ��۱ݾ�
	        map.put("allSum", fee.getAllsum());    // �ֹ� ��ǰ ��ü �ݾ�
	        mav.setViewName("cart/cartList");    // view(jsp)�� �̸� ����
	        mav.addObject("map", map);            // map ���� ����
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
	        // session�� id
	        String userId = (String) session.getAttribute("id");
	        // ���ڵ��� ���� ��ŭ �ݺ��� ����
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
	        // session�� id
	        String userId = (String) session.getAttribute("id");
	        int val=service.ordernextsequence();
	        // ���ڵ��� ���� ��ŭ �ݺ��� ����
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
	    	  String userId = (String) session.getAttribute("id");
	    	  int rowsize=10;
	    	  Pageing pageing =new Pageing(page,service.getListCount(userId),rowsize);
		      int startrow=(page-1)*rowsize+1;
		      int endrow=startrow+rowsize-1;
				 mav.setViewName("cart/orderlist"); 
				 mav.addObject("page",page);
				 mav.addObject("maxapage",pageing.getMaxpage());
				 mav.addObject("startpage",pageing.getStartpage());
				 mav.addObject("endpage",pageing.getEndpage());
				 mav.addObject("list",service.list(userId,startrow-1,endrow-startrow+1));
	    	  return mav;
	    }
	    @RequestMapping("/detail.do")
	    public  ModelAndView detail(ModelAndView mav,@RequestParam int num){
	    	 // ��ٱ��� ��ü �ݾ� ȣ��
	    	 feeDto fee = new feeDto();
		     fee.setSumMoney(service.sumMoney2(num));
		         
	    	mav.addObject("order",service.detailorder(num));
	    	mav.addObject("list",service.detail(num));
	    	mav.addObject("deli", service.delivery(num));
	        mav.addObject("sumMoney",fee.getSumMoney());        // ��ٱ��� ��ü �ݾ�
		    mav.addObject("fee", fee.getFee());                 // ��۱ݾ�
		    mav.addObject("allSum", fee.getAllsum()); 
		    mav.setViewName("cart/detail");
	    
			return mav;
	    }
	    @RequestMapping("admin/detail.do")
	    public  ModelAndView detail2(ModelAndView mav,@RequestParam int num){
	    	feeDto fee = new feeDto();
		     fee.setSumMoney(service.sumMoney2(num));
	    	mav.addObject("order",service.detailorder(num));
	    	mav.addObject("list",service.detail(num));
	    	mav.addObject("deli", service.delivery(num));
	        mav.addObject("fee", fee.getFee());                 // ��۱ݾ�
			mav.addObject("allSum", fee.getAllsum()); 
	    	mav.setViewName("admin/detail");
	    
			return mav;
	    
	    }
}
