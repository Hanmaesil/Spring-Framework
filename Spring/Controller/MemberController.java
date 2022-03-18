package kr.smhrd.web;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.model.MemberMapper;
import kr.smhrd.model.MemberVO;

@Controller
public class MemberController {

	@Inject
	private MemberMapper mapper;
	
	
	//로그인 페이지로 이동
	
	@RequestMapping("/login.do")
	public void login() {
		//메소드 이름과 리턴하는 이름이 같다면 리턴 안적어도 된다!
	}
	
	//회원가입 페이지로 이동
	@RequestMapping("/join.do")
	public void join() {
		
	}
	
	//회원가입
	@RequestMapping("/joinInsert.do")
	public String joinInsert(MemberVO vo) {
		
		mapper.joinInsert(vo);
		
		
		
		return "redirect:/boardList.do";
	}
	
	//로그인
	@RequestMapping("/loginSelect.do")
	public String loginSelect(MemberVO vo, HttpSession session) {
		System.out.println("넘어옴");
		
		MemberVO info = mapper.loginSelect(vo);
		//session.setAttribute("info", mapper.loginSelect(vo)); >> 이런식으로 하면 object타입으로 메소드가 생성됨
		
		//로그인 성공시에만 세션에 넣기
		if(info != null) {
			session.setAttribute("info", info);	//if문을 사용안하면 로그인 실패시에도 info라는 공간이 생성되기 때문에 불필요한 메모리 낭비를 막기위해 if문을 사용한다
		}
		
		
		return "redirect:/boardList.do";
	}
	
	//로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("info"); //remove를 사용하는것이 좀 더 나음!(다른 세션들도 있을수 있으니까!) 
		//session.invalidate();
		 
		 return "redirect:/boardList.do";
	}
	
	/*
	 * //멤버정보 불러오기(ajax)
	 * 
	 * @RequestMapping("/memberList.do") public @ResponseBody List<MemberVO>
	 * memberList() { //@ResponseBody로 명시해주면 알아서 json형태로 바뀐다
	 * System.out.println("회원정보 보기 기능 동작 성공!");
	 * 
	 * 
	 * // ArrayList<MemberVO> list = mapper.memberList(); List<MemberVO>list =
	 * mapper.memberList(); // 확장성을 위해 List로 만드는게 좋다! for(int i = 0; i <
	 * list.size(); i++) { System.out.println("아이디 > " + list.get(i).getId());
	 * System.out.println("비밀번호 > " + list.get(i).getPw());
	 * System.out.println("닉네임 > " + list.get(i).getNick());
	 * System.out.println("전화번호 > " + list.get(i).getTel());
	 * System.out.println(list.get(i).toString()); } //스프링에서는 gson객체를 만들필요가 없다!
	 * 
	 * return list; // 이렇게 바로 리턴해주면 됨! }
	 * 
	 * //아이디 중복 확인
	 * 
	 * @RequestMapping("/idCheck.do") public @ResponseBody MemberVO idCheck(String
	 * id) {
	 * 
	 * System.out.println(id);
	 * 
	 * MemberVO vo = mapper.idCheck(id); System.out.println(vo);
	 * 
	 * if(vo == null) { vo = new MemberVO(); //null일 때 에러방지를 위해 아무것도 없는 MemberVO를
	 * 넣어준다 }
	 * 
	 * 
	 * return vo; }
	 */
	
	
	
}
