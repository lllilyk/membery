package com.example.demo.domain;

import java.util.Date;

import com.example.demo.controller.FeedTime;

import lombok.Data;

@Data
public class Alarm {

	private String userId; //알림 받는 회원
	private String causesMemberId; //알림 발생시킨 회원
	private Integer feedId; //좋아요 또는 댓글 받은 피드id
	private String content; //댓글 내용
	private String notiType; //comment 또는 like
	//private Boolean isChecked;  //확인 여부
	private String inserted;
	
	private String nickName;
	
	public void setInserted(Date date) {
		this.inserted = FeedTime.calculateTime(date); // 기존의 getter, setter에서 변경된 부분
	}
}
