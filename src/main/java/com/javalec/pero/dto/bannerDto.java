package com.javalec.pero.dto;

import org.springframework.web.multipart.MultipartFile;

public class bannerDto {
	private int banner_num;
	private String banner_desc;
	private String banner_url;
	private int product_id;
	private MultipartFile bannerPhoto;
	public MultipartFile getBannerPhoto() {
		return bannerPhoto;
	}
	public void setBannerPhoto(MultipartFile bannerPhoto) {
		this.bannerPhoto = bannerPhoto;
	}
	public int getBanner_num() {
		return banner_num;
	}
	public void setBanner_num(int banner_num) {
		this.banner_num = banner_num;
	}
	public String getBanner_desc() {
		return banner_desc;
	}
	public void setBanner_desc(String banner_desc) {
		this.banner_desc = banner_desc;
	}
	public String getBanner_url() {
		return banner_url;
	}
	public void setBanner_url(String banner_url) {
		this.banner_url = banner_url;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
}
