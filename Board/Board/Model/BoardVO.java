package kr.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data //getter/setter 생성
@AllArgsConstructor //생성자
@NoArgsConstructor //기본생성자

public class BoardVO {
	//BoaardDTO == BoardVO
	
	private int idx; //번호
	@NonNull // 하나만 넣어서 생성자를 만들때 사용하고자 하는 변수 위에 어노테이션을 달아두면 된다.
	private String title; //제목
	private String contents; //내용
	private int count; //조회수
	private String writer; //작성자
	private String indate; // 작성일
	
	
	
	
}
