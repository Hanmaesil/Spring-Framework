package kr.smhrd.web;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.smhrd.model.MemberMapper;
import kr.smhrd.model.MemberVO;

@RestController //비동기통신 전용 콘트롤러
public class AjaxMemberController {
	
	@Inject
	private MemberMapper mapper;
	
	//멤버정보 불러오기(ajax)
		@RequestMapping("/memberList.do")
		public List<MemberVO> memberList() { //@ResponseBody로 명시해주면 알아서 json형태로 바뀐다 ->> 비동기 콘트롤러에서는 필요 없음! ->> 동기는 안됨!
			System.out.println("회원정보 보기 기능 동작 성공!");
			
			 
//			ArrayList<MemberVO> list = mapper.memberList(); 
			List<MemberVO>list = mapper.memberList(); // 확장성을 위해 List로 만드는게 좋다!
			for(int i = 0; i < list.size(); i++) {
				System.out.println("아이디 > " + list.get(i).getId());
				System.out.println("비밀번호 > " + list.get(i).getPw());
				System.out.println("닉네임 > " + list.get(i).getNick());
				System.out.println("전화번호 > " + list.get(i).getTel());
				System.out.println(list.get(i).toString());
			}
			//스프링에서는 gson객체를 만들필요가 없다!
			
			return list; // 이렇게 바로 리턴해주면 됨!
		}
		
		//아이디 중복 확인
		@RequestMapping("/idCheck.do")
		public MemberVO idCheck(String id) {
			
			System.out.println(id);
			
			MemberVO vo = mapper.idCheck(id);
			System.out.println(vo);
			
			if(vo == null) {
				vo = new MemberVO(); //null일 때 에러방지를 위해 아무것도 없는 MemberVO를 넣어준다
			}
			
			
			return vo;
		}
	
	
	
}
