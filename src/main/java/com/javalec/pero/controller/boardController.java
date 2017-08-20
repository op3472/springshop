package com.javalec.pero.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.javalec.pero.dto.boardDto;
import com.javalec.pero.service.boardservice;
import com.javalec.pero.util.Pageing;

@Controller
public class boardController {
	 @Autowired
	  private boardservice service;
	 private Pageing pageing;
	 private final int rowsize=15;
	 @RequestMapping("/boardlist.do")
	 public ModelAndView list(@RequestParam int page,ModelAndView mav,HttpSession session){ 
		 String id= (String)session.getAttribute("id");
		 Pageing pageing =new Pageing(page,service.getListboardCount(),rowsize);
	    int startrow=(page-1)*rowsize+1;
	    int endrow=startrow+rowsize-1;
	
		 mav.setViewName("/board/list"); 
		 mav.addObject("id",id);
		 mav.addObject("listcount",pageing.getListcount());
		 mav.addObject("page",page);
		 mav.addObject("maxapage",pageing.getMaxpage());
		 mav.addObject("startpage",pageing.getStartpage());
		 mav.addObject("endpage",pageing.getEndpage());
		 mav.addObject("list",service.listboard(startrow-1,endrow-startrow+1));
		 return mav;
	}	
	 @RequestMapping("/boardwrite.do")
	 public ModelAndView write(ModelAndView mav,HttpSession session){ 
		 String id= (String)session.getAttribute("id");

		 mav.setViewName("/board/write"); 
		 mav.addObject("id",id);
		 return mav;
	}	
	 @RequestMapping("/boardinsert.do")
	 public String insert(boardDto vo){ 
		 service.boardinsert(vo);

		 	
		 return "redirect:/boardlist.do?page=1";
	}
	 @RequestMapping("/boardDetail/{num}")
	    public ModelAndView detail(@PathVariable("num") int num, ModelAndView mav){
	        mav.setViewName("/board/detail");
	        mav.addObject("vo", service.detailboard(num));
	        return mav;
	  }
	 @RequestMapping("/boardmodify.do")
	 public ModelAndView modify(@RequestParam int num,ModelAndView mav){
		 mav.addObject("vo",service.detailboard(num));
		 mav.setViewName("/board/modify");
		 return mav;
	 }
	
	 @RequestMapping("/boardmodifygo.do")
	 public String modifygo(boardDto vo){ 
		 service.boardmodify(vo);

		 	
		 return "redirect:/boardlist.do?page=1";
	}
	 @RequestMapping("/boarddelete.do")
	 public String modifygo(@RequestParam int num){ 
		 service.boarddelete(num);

		 	
		 return "redirect:/boardlist.do?page=1";
	}
	 @RequestMapping("/qaboardlist.do")
	 public ModelAndView qalist(@RequestParam int page,ModelAndView mav,HttpSession session){ 
		 String id= (String)session.getAttribute("id");
		 Pageing pageing =new Pageing(page,service.getListqaboardCount(),rowsize);
	     int startrow=(page-1)*rowsize+1;
	     int endrow=startrow+rowsize-1;
	       
		mav.setViewName("/board/list"); 
		mav.addObject("id",id);
		mav.addObject("listcount",pageing.getListcount());
		mav.addObject("page",page);
		mav.addObject("maxapage",pageing.getMaxpage());
		mav.addObject("startpage",pageing.getStartpage());
		mav.addObject("endpage",pageing.getEndpage());
		 mav.addObject("list",service.listqaboard(startrow-1,endrow-startrow+1));
		 return mav;
	}	
	 @RequestMapping("/qaboardwrite.do")
	 public ModelAndView qawrite(ModelAndView mav,HttpSession session){ 
		 String id= (String)session.getAttribute("id");

		 mav.setViewName("/board/qawrite"); 
		 mav.addObject("id",id);
		 return mav;
	}	
	 @RequestMapping("/qaboardinsert.do")
	 public String qainsert(boardDto vo){ 
		 service.qaboardinsert(vo);

		 	
		 return "redirect:/qaboardlist.do?page=1";
	}
	 @RequestMapping("/qaboardDetail/{num}")
	    public ModelAndView qadetail(@PathVariable("num") int num, ModelAndView mav){
	        mav.setViewName("/board/qadetail");
	        mav.addObject("vo", service.detailqaboard(num));
	        return mav;
	  }
	 @RequestMapping("/qaboardmodify.do")
	 public ModelAndView qamodify(@RequestParam int num,ModelAndView mav){
		 mav.addObject("vo",service.detailqaboard(num));
		 mav.setViewName("/board/qamodify");
		 return mav;
	 }
	
	 @RequestMapping("/qaboardmodifygo.do")
	 public String qamodifygo(boardDto vo){ 
		 service.qaboardmodify(vo);

		 	
		 return "redirect:/qaboardlist.do?page=1";
	}
	 @RequestMapping("/qaboarddelete.do")
	 public String qamodifygo(@RequestParam int num){ 
		 service.qaboarddelete(num);

		 	
		 return "redirect:/qaboardlist.do?page=1";
	}
	 @RequestMapping("/qaboardreply.do")
	 public ModelAndView qareply(@RequestParam int num,ModelAndView mav){ 
		 mav.addObject("vo", service.detailqaboard(num));
		 mav.setViewName("/board/qareply");	
		 return mav;
	}
	 @RequestMapping("/qaboardreplygo.do")
	 public String qareplygo(boardDto vo){ 
		 service.qaboardreply(vo);	
		 return "redirect:/qaboardlist.do?page=1";
	}

}
