package kr.smhrd.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.model.BoardVO;

@Controller //@를 통해서 콘트롤러라는 것을 명시하는 작업(자동완성으로 임포트 해야 한다)(@ 는 어노테이션 이라고 읽는다)
public class BoardController {
	
	//게시판 목록보기 기능
	@RequestMapping("/boardList.do") // ()안에 있는 문자가 들어모면 아래 메소드가 실행된다., / 가 있어야 web/~~~ 타고 들어간다
	public String boardList(HttpSession session) { //사용하고자하는 저장공간을 매개변수에 넣어주면 된다(request도 서블릿에 있지만 이렇게 사용이 가능하다!)
		System.out.println("게시판 목록보기 기능 동작 성공!");
		//번호, 제목, 내용, 조회수, 작성자, 작성일
		
		BoardVO vo1 = new BoardVO(1, "안녕하세요~~","앞으로 잘부탁드려요~", 10,"한국인","2022.03.07");
		BoardVO vo2 = new BoardVO(2, "월요일 싫어...","하하하하하하", 2,"피곤피곤","2022.03.01");
		BoardVO vo3 = new BoardVO(3, "저녁추천받아요!","추천해주세요!!", 3,"저녁먹자","2022.03.03");
		BoardVO vo4 = new BoardVO(4, "선거날은 휴일!","꿀잠자야지", 23,"한국사람","2022.03.05");
		BoardVO vo5 = new BoardVO(5, "잠와..","zzzz", 15,"한국인맞다고","2022.03.02");
		
		//실무에선 arraylist 보다 List를 사용한다(더 상위클래스여서 확장성이 좋다)
		List<BoardVO> list = new ArrayList<BoardVO>(); //List로 만들면 어레이리스트가 아니라 다른 거여도 사용이 가능하다
		list.add(vo1);
		list.add(vo2);
		list.add(vo3);
		list.add(vo4);
		list.add(vo5);
		
		session.setAttribute("list", list);
		//객체를 어딘가의 메모리에 담아놓고 다른 페이지나 다른곳으로 이동하는것 > 객체 바인딩, 동적 바인딩 이라고 한다.
		
		return "boardList";
		
	}
	
	
	
	
	
	
}
