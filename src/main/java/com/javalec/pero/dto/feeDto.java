package com.javalec.pero.dto;

public class feeDto {
	private int fee;
	private int sumMoney;
	public int getFee() {
		return getSumMoney() >= 100000 ? 0 : 2500;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	public int getSumMoney() {
		return sumMoney;
	}
	public void setSumMoney(int sumMoney) {
		this.sumMoney = sumMoney;
	}
	public int getAllsum(){
		return getSumMoney()+getFee();
	}
}
