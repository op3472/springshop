package com.javalec.pero.dao;

import org.springframework.stereotype.Repository;

import com.javalec.pero.dto.memberDto;

@Repository
public interface memberDao {
	public int duplicateIdCheck(String id);
	public void MemberInsert(memberDto dto);
	public memberDto Memberlogin(memberDto dto);
	public memberDto info(String id);
	public void Memberupdate(memberDto dto);
	public int Memberdelete(String id,String pass);
	public void membercart(String id);
	public void memberorders(String id);
	public void memberorderlist(String id);
	public int Memberselect(String id,String pass);
}
