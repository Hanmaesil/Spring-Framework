package kr.smhrd.web;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.model.BoardMapper;
import kr.smhrd.model.BoardVO;

@Controller //@를 통해서 콘트롤러라는 것을 명시하는 작업(자동완성으로 임포트 해야 한다)(@ 는 어노테이션 이라고 읽는다)
public class BoardController {
	
	@Inject //autowired 보다 보안성이 좋다
	private BoardMapper mapper; //의존성주입(DI)!
	
	
	
	//게시판 목록보기 기능
	@RequestMapping("/boardList.do") // ()안에 있는 문자가 들어모면 아래 메소드가 실행된다., / 가 있어야 web/~~~ 타고 들어간다
	public void boardList(Model model) { //사용하고자하는 저장공간을 매개변수에 넣어주면 된다(request도 서블릿에 있지만 이렇게 사용이 가능하다!)
		System.out.println("게시판 목록보기 기능 동작 성공!");
		//번호, 제목, 내용, 조회수, 작성자, 작성일
		//mybatis  : java(class)와 sql(xml)을 연결해주는 프레임워크(dao를 안만들어 된다)
		//실습에서는 컨트롤러(boardContorller)를 실행하면 클래스파일인 boardMapper로 갔다가 BoardMapper.xml로 간다
		
		List<BoardVO> list = mapper.boardList();
		
		model.addAttribute("list", list);//스프링에서는 모델을 주로 사용한다.
		
		//객체를 어딘가의 메모리에 담아놓고 다른 페이지나 다른곳으로 이동하는것 > 객체 바인딩, 동적 바인딩 이라고 한다.(포워딩 방식이다!!!)
		
		//return "boardList"; // 스프링에서는 메소드 이름과 리턴하는 이름이 같을 때 void로 메소드를 만들면 알아서 리턴해준다!
	}
	
	//게시판글쓰기 이동 기능
	@RequestMapping("/boardInsertForm.do")
	public void boardInsertForm() {
		System.out.println("게시판 글쓰기 이동기능 동작 성공!");
		
		
		
	}
	
	
	//게시판 글쓰기 입력 기능
	@RequestMapping("/boardInsert.do") //get방식이든 post방식이든 둘다 넘어온다
	//@RequestMapping("/boardInsert.do", method = "post") 메소드를 적어주면 그 방식으로만 받는다!
	//@GetMapping >> get방식으로만 받고싶을 때
	//@PostMapping >> post방식으로만 받고싶을 때
	public String boardInsert(BoardVO vo) { //1. vo에있는 변수이름과 form에 있는 name값이 같아야 한다 2. 기본생성자가 있어야 한다 >>>> 두 조건을 충족하면 알아서 vo에 저장된다. >>>>리플렉션이라고 한다
		
		System.out.println("게시판 글쓰기 입력 기능 동작 성공!!");
		System.out.println(vo.getTitle());
		System.out.println(vo.getWriter());
		System.out.println(vo.getContents()); //web.xml에 post방식일때 필요한 인코딩을 하면 한글이 나온다
		
		mapper.boardInsert(vo); //BoardVO로 저장되기 때문에 vo를 넣는다
		
		return "redirect:/boardList.do"; //boareList.do를 거쳐야 디비에서 목록을 가져온다(바로jsp로 가면 목록을 안가져오기 때문이다) >> 포워딩 방식이 아닌 리다이렉트 방식을 써야한다!
	}
	
	//게시판 글 확인 기능
	@RequestMapping("/boardContent.do")
	public void boardContents(int idx, Model model) { //get방식 하나만 받을 때! >> 받고자 하는 데이터 타입을 적어주면 끝!(거즘 vo타입으로 받기는 한다) 
		//@RequestParam int idx >> 이런식으로 리퀘스트에 저장된 쿼리스트링을 가져올수도 있다
		System.out.println("게시판 글 확인 기능 동작 성공!");
		//조회수
		mapper.count(idx);
		BoardVO vo =  mapper.boardContent(idx);
		model.addAttribute("vo", vo);
		System.out.println(idx);
		
	}
	
	//게시글 수정하기
	@RequestMapping("/boardUpdate.do")
	public String boardUpdate(BoardVO vo) {
		System.out.println("게시글 수정 확인 기능 동작 성공");
		mapper.boardUpdate(vo);
		return "redirect:/boardList.do";
	}
	
	//게시글 삭제하기
	@RequestMapping("/boardDelete.do")
	public String boardDelete(int idx) {
		System.out.println("게시글 삭제 기능 동작 성공");
		mapper.boardDelete(idx);
		return "redirect:/boardList.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
