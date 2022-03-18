package kr.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	
	
	//회원가입
	public void joinInsert(MemberVO vo);
	//로그인
	//public Object loginSelect(MemberVO vo);

	public MemberVO loginSelect(MemberVO vo);
	
	//회원정보 불러오기
	public List<MemberVO> memberList();
	
	//아이디 중복확인
	public MemberVO idCheck(String id);
	
	


}
