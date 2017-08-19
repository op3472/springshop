package com.javalec.pero.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.javalec.pero.dto.bannerDto;
import com.javalec.pero.dto.deliveryDto;
import com.javalec.pero.dto.productDto;
import com.javalec.pero.service.productservice;

@Controller
public class productController {
	@Autowired
	private productservice service;
	
	
	 @RequestMapping("/product/detail/{productId}")
	    public ModelAndView detail(@PathVariable("productId") int productId, ModelAndView mav){
	        mav.setViewName("/product/productDetail");
	        mav.addObject("vo", service.detailProduct(productId));
	        return mav;
	    }
	 @RequestMapping("/list.do")
	 public ModelAndView list(@RequestParam int num,@RequestParam int page,ModelAndView mav){ 
		 int rowsize=16;   
		 int limit=10; 
	     int startrow=(page-1)*rowsize+1;
	        int endrow=startrow+rowsize-1;
			int listcount = service.getListCount(num);
		 int maxpage=(int)Math.ceil(listcount/(double)rowsize); //0.95를 더해서 올림 처리. 
      //현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...) 
      int startpage = ((page-1)/limit*limit)+1;
      //현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...) 
      int endpage = ((page-1)/limit*limit)+limit; 
      if (endpage>maxpage) endpage=maxpage; 

		 mav.setViewName("/product/product"); 
		 mav.addObject("page",page);
		 mav.addObject("num",num);
		 mav.addObject("maxapage",maxpage);
		 mav.addObject("startpage", startpage);
		 mav.addObject("endpage",endpage);
		 mav.addObject("list",service.listProductnum(num,startrow-1,endrow-startrow+1));
		 return mav;
	}	
	 @RequestMapping("/admin/product.do")
	 public String product(){
		 return "/admin/product";
	}
	 @RequestMapping("/admin/list.do")
	 public ModelAndView adminlist(@RequestParam int num,@RequestParam int page,ModelAndView mav){ 
		 int rowsize=30;   
		 int limit=10; 
	     int startrow=(page-1)*rowsize+1;
	        int endrow=startrow+rowsize-1;
			int listcount = service.getListCount(num);
		 int maxpage=(int)Math.ceil(listcount/(double)rowsize); //0.95를 더해서 올림 처리. 
      //현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...) 
      int startpage = ((page-1)/limit*limit)+1;
      //현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...) 
      int endpage = ((page-1)/limit*limit)+limit; 
      if (endpage>maxpage) endpage=maxpage; 

		 mav.setViewName("/admin/productlist"); 
		 mav.addObject("page",page);
		 mav.addObject("num",num);
		 mav.addObject("maxapage",maxpage);
		 mav.addObject("startpage", startpage);
		 mav.addObject("endpage",endpage);
		 mav.addObject("list",service.listProductnum(num,startrow-1,endrow-startrow+1));
		 return mav;
	}	
	 @RequestMapping("/admin/write.do")
	 public ModelAndView write(@RequestParam int num,ModelAndView mav){
		 mav.setViewName("/admin/write");
		 mav.addObject("num",num);
		 return mav;
	}
	 @RequestMapping("/admin/insert.do")
	 public String insert(productDto vo){
		 String filename = "";
	        // 첨부파일(상품사진)이 있으면
	        if(!vo.getProductPhoto().isEmpty()){
	            filename = vo.getProductPhoto().getOriginalFilename();
	            // 개발디렉토리 - 파일 업로드 경로
	            //String path = "C:\\Users\\doubles\\Desktop\\workspace\\gitSpring\\"
	            //                + "spring02\\src\\main\\webapp\\WEB-INF\\views\\images";
	            // 배포디렉토리 - 파일 업로드 경로
	            String path = "C:\\Users\\user\\workspace\\springshop\\src\\"
	                            + "main\\webapp\\resources\\"
	                            + "shopimages\\";
	            try {
	                new File(path).mkdirs(); // 디렉토리 생성
	                // 임시디렉토리(서버)에 저장된 파일을 지정된 디렉토리로 전송
	                vo.getProductPhoto().transferTo(new File(path+filename));
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	            vo.setProductUrl(filename);
	          service.insertProduct(vo);  
	        }
		 return "redirect:/admin/list.do?num="+vo.getProductNum()+"&page=1";
	} 
	 @RequestMapping("/admin/edit/{productId}")
	    public ModelAndView edit(@PathVariable("productId") int productId, ModelAndView mav){
	        mav.setViewName("/admin/productEdit");
	        mav.addObject("vo", service.detailProduct(productId));
	        return mav;
	    }
	    @RequestMapping("/admin/update.do")
	    public String update(productDto vo){
	        String filename = "";
	        // 첨부파일(상품사진)이 변경되면
	        if(!vo.getProductPhoto().isEmpty()){
	            filename = vo.getProductPhoto().getOriginalFilename();
	            String filename2 = service.fileInfo(vo.getProductId());
	            String path = "C:\\Users\\user\\workspace\\springshop\\src\\"
                        + "main\\webapp\\resources\\"
                        + "shopimages\\";
	            if(filename2 != null){
		            File file2 = new File(path+filename2);
		            // 파일이 존재하면
		            if (file2.exists()){ 
		                file2.delete(); // 파일 삭제
		            }
		        }
	            // 개발디렉토리 - 파일 업로드 경로
	            //String path = "C:\\Users\\doubles\\Desktop\\workspace\\gitSpring\\"
	            //                + "spring02\\src\\main\\webapp\\WEB-INF\\views\\images";
	            // 배포디렉토리 - 파일 업로드 경로
	          
	            try {
	                new File(path).mkdirs(); // 디렉토리 생성
	                // 임시디렉토리(서버)에 저장된 파일을 지정된 디렉토리로 전송
	                vo.getProductPhoto().transferTo(new File(path+filename));
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	            vo.setProductUrl(filename);
	        // 첨부파일이 변경되지 않으면
	        } else {
	            // 기존의 파일명
	            productDto vo2 = service.detailProduct(vo.getProductId());
	            vo.setProductUrl(vo2.getProductUrl());
	        }
	        service.updateProduct(vo);
	        return "redirect:/admin/list.do?num="+vo.getProductNum()+"&page=1";
	    }
	    @RequestMapping("/admin/delete.do")
	    public String delete(@RequestParam int productId,@RequestParam int num){
	        // 상품 이미지 정보
	        String filename = service.fileInfo(productId);
	        String path = "C:\\Users\\user\\workspace\\springshop\\src\\"
                    + "main\\webapp\\resources\\"
                    + "shopimages\\";
	        // 상품 이미지 삭제
	        if(filename != null){
	            File file = new File(path+filename);
	            // 파일이 존재하면
	            if (file.exists()){ 
	                file.delete(); // 파일 삭제
	            }
	        }
	        // 레코드 삭제
	        service.deleteCart(productId);
	        service.deleteProduct(productId);
	        return "redirect:/admin/list.do?num="+num+"&page=1";
	    }
	    
	    @RequestMapping("/admin/delivery.do")
	    public ModelAndView delivery( ModelAndView mav,@RequestParam int page){
	    	mav.setViewName("");
	    	  int limit=10; 
		      int startrow=(page-1)*limit+1;
		      int endrow=startrow+limit-1;
		      int listcount = service.getListCount2();
		      int maxpage=(int)((double)listcount/limit+0.95); //0.95를 더해서 올림 처리. 
		         //현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...) 
		         int startpage = (((int) ((double)page / limit + 0.9)) - 1) * limit + 1; 
		         //현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...) 
		         int endpage = maxpage; 
		         if (endpage<startpage+limit-1) endpage=maxpage; 

				 mav.setViewName("admin/delivery"); 
				 mav.addObject("page",page);
				 mav.addObject("maxapage",maxpage);
				 mav.addObject("startpage", startpage);
				 mav.addObject("endpage",endpage);
				 mav.addObject("list",service.list2(startrow-1,endrow-startrow+1));
	       
	        return mav;
	    }
	    @RequestMapping("/admin/address.do")
	    public ModelAndView address(ModelAndView mav,@RequestParam int num){
	
				 mav.setViewName("admin/address"); 
				 mav.addObject("num",num);
				
	        return mav;
	    }
	    @RequestMapping("/admin/deliinsert.do")
	    public String deliinsert(deliveryDto vo){
			service.deliinsert(vo);
	    	return "redirect:/cart/admin/detail.do?num="+vo.getNum();
	    	
	    }
	    @RequestMapping("/admin/complete.do")
	    public String complete(@RequestParam int num){
			service.complete(num);
	    	return "redirect:/cart/admin/detail.do?num="+num;
	    	
	    }
	    @RequestMapping("/admin/banner.do")
	    public ModelAndView banner(ModelAndView mav,@RequestParam int page){
	    	int limit2=12;
			 int limit=10; 
		        int startrow=(page-1)*limit2+1;
		        int endrow=startrow+limit2-1;
			 int listcount = service.getbannerCount();
			 int maxpage=(int)((double)listcount/limit+0.95); //0.95를 더해서 올림 처리. 
	         //현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...) 
	         int startpage = (((int) ((double)page / limit + 0.9)) - 1) * limit + 1; 
	         //현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...) 
	         int endpage = maxpage; 
	         if (endpage<startpage+limit-1) endpage=maxpage; 

			 mav.addObject("page",page);
			 mav.addObject("maxapage",maxpage);
			 mav.addObject("startpage", startpage);
			 mav.addObject("endpage",endpage);
			 mav.addObject("list",service.listbannernum(startrow-1,endrow-startrow+1));
			 mav.setViewName("admin/banner"); 
			 
		return mav;
   }
	    @RequestMapping("/admin/bannerwrite.do")
		 public ModelAndView bannerwrite(ModelAndView mav){
			 mav.setViewName("/admin/bannerwrite");
			 return mav;
		}
	    @RequestMapping("/admin/bannerinsert.do")
		 public String bannerinsert(bannerDto vo){
			 String filename = "";
		        // 첨부파일(상품사진)이 있으면
		        if(!vo.getBannerPhoto().isEmpty()){
		            filename = vo.getBannerPhoto().getOriginalFilename();
		            // 개발디렉토리 - 파일 업로드 경로
		            //String path = "C:\\Users\\doubles\\Desktop\\workspace\\gitSpring\\"
		            //                + "spring02\\src\\main\\webapp\\WEB-INF\\views\\images";
		            // 배포디렉토리 - 파일 업로드 경로
		            String path = "C:\\Users\\user\\workspace\\springshop\\src\\"
		                            + "main\\webapp\\resources\\"
		                            + "bannerimage\\";
		            try {
		                new File(path).mkdirs(); // 디렉토리 생성
		                // 임시디렉토리(서버)에 저장된 파일을 지정된 디렉토리로 전송
		                vo.getBannerPhoto().transferTo(new File(path+filename));
		            } catch (Exception e) {
		                e.printStackTrace();
		            }
		            vo.setBanner_url(filename);
		          service.bannerinsert(vo);  
		        }
			 return "redirect:/admin/banner.do?page=1";
		} 
	    	
	    @RequestMapping("/admin/banneredit/{banner_num}")
	    public ModelAndView banneredit(@PathVariable("banner_num") int num, ModelAndView mav){
	        mav.setViewName("/admin/bannerEdit");
	        mav.addObject("vo", service.detailbanner(num));
	        return mav;
	    }
	    @RequestMapping("/admin/bannerupdate.do")
	    public String update(bannerDto vo){
	        String filename = "";
	        // 첨부파일(상품사진)이 변경되면
	        if(!vo.getBannerPhoto().isEmpty()){
	            filename = vo.getBannerPhoto().getOriginalFilename();
	            String filename2 = service.bannerfileInfo(vo.getBanner_num());
	            String path = "C:\\Users\\user\\workspace\\springshop\\src\\"
                        + "main\\webapp\\resources\\"
                        + "bannerimage\\";
	            if(filename2 != null){
		            File file2 = new File(path+filename2);
		            // 파일이 존재하면
		            if (file2.exists()){ 
		                file2.delete(); // 파일 삭제
		            }
		        }
	            // 개발디렉토리 - 파일 업로드 경로
	            //String path = "C:\\Users\\doubles\\Desktop\\workspace\\gitSpring\\"
	            //                + "spring02\\src\\main\\webapp\\WEB-INF\\views\\images";
	            // 배포디렉토리 - 파일 업로드 경로
	          
	            try {
	                new File(path).mkdirs(); // 디렉토리 생성
	                // 임시디렉토리(서버)에 저장된 파일을 지정된 디렉토리로 전송
	                vo.getBannerPhoto().transferTo(new File(path+filename));
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	            vo.setBanner_url(filename);
	        // 첨부파일이 변경되지 않으면
	        } else {
	            // 기존의 파일명
	            bannerDto vo2 = service.detailbanner(vo.getBanner_num());
	            vo.setBanner_url(vo2.getBanner_url());
	        }
	        service.updatebanner(vo);
	        return "redirect:/admin/banner.do?page=1";
	    }
	    @RequestMapping("/admin/bannerdelete.do")
	    public String bannerdelete(@RequestParam int num){
	        // 상품 이미지 정보
	        String filename = service.bannerfileInfo(num);
	        String path = "C:\\Users\\user\\workspace\\springshop\\src\\"
                    + "main\\webapp\\resources\\"
                    + "bannerimage\\";
	        // 상품 이미지 삭제
	        if(filename != null){
	            File file = new File(path+filename);
	            // 파일이 존재하면
	            if (file.exists()){ 
	                file.delete(); // 파일 삭제
	            }
	        }
	        service.deletebanner(num);
	        return "redirect:/admin/banner.do?page=1";
	    }
	    @RequestMapping("/admin/bannerdetail/{num}")
	    public ModelAndView bannerdetail(@PathVariable("num") int num, ModelAndView mav){
	        mav.setViewName("/admin/bannerDetail");
	        mav.addObject("vo", service.detailbanner(num));
	        return mav;
	    }

}
