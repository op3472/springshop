package com.javalec.pero.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javalec.pero.dto.boardDto;

@Repository
public interface boardDao {
	public int getListboardCount();
    public List<boardDto> listboard(int startrow,int endrow);
    public void boardinsert(boardDto vo);
    public int maxnum();
    public boardDto detailboard(int num);
    public void boardmodify(boardDto vo);
    public void boarddelete(int num);
    public void boardreadcount(int num);
    public int getListqaboardCount();
    public List<boardDto> listqaboard(int startrow,int endrow);
    public void qaboardinsert(boardDto vo);
    public int qamaxnum();
    public boardDto detailqaboard(int num);
    public void qaboardmodify(boardDto vo);
    public void qaboarddelete(int num);
    public void qaboardreadcount(int num);
    public void updateqa(int ref,int seq);
    public void insertreply(boardDto vo);
    public List<Integer> qatree(int num);
}

