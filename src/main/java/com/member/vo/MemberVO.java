package com.member.vo;

import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String userId;
	private String userPass;
	private String userName;
	private String phone;
	private String email;
	private String newPass;
	private String confirmPass;
	// private String profileImg;

	private List<CollectionReviewVO> collectionRevs;
	private List<BoardVO> posts;
	private List<ReplyVO> comments;

}