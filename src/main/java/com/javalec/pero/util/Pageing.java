package com.javalec.pero.util;

public class Pageing {
	int page;
	int listcount;
	int rowsize;
	int limit; 
	 int maxpage;
	 int startpage;
	 int endpage; 
	


	public Pageing(int page,int listcount,int rowsize){
			this.page=page;
			this.listcount=listcount;
			this.rowsize=rowsize;	
			this.limit=10;
	}

	public int getMaxpage() {
		return (int)Math.ceil(listcount/(double)rowsize);
	}



	public void setMaxpage(int maxpage) {
		this.maxpage = maxpage;
	}



	public int getListcount() {
		return listcount;
	}

	public void setListcount(int listcount) {
		this.listcount = listcount;
	}

	public int getStartpage() {
		return ((page-1)/limit*limit)+1;
	}



	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}



	public int getEndpage() {
		if(((page-1)/limit*limit)+limit>getMaxpage()){return getMaxpage(); }
		else{ return ((page-1)/limit*limit)+limit; }
	}



	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}




	
}
