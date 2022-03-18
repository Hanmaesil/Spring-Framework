package kr.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class MemberVO {
	
	private String id; //아이디
	private String pw; //비밀번호
	private String nick; //닉네임
	private String tel; //전화번호
	
	
	
}
