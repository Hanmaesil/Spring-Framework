package kr.smhrd.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface BoardMapper { //추상메소드를 사용하기 때문에 클래스 대신 인터페이스를 사용한다
	
	//DBCP를 사용하여 db와 연결한다
	//커넥션 풀 : 커넥션의 개수를 지정해준다(무분별한 커넥트를 막기위해! -> 무분별하게 사용시 대규모 프로젝트에서는 db가 다운된다)(히카리cp사용!)
	//히카리 cp : db와의 커넥션을 관리한다
	//히카리 cp 연결 참고 사이트 : https://velog.io/@secho/%EC%8A%A4%ED%94%84%EB%A7%81-04-MyBatis-%EC%8A%A4%ED%94%84%EB%A7%81-%EC%97%B0%EB%8F%99-%EC%BB%A4%EB%84%A5%EC%85%98-%ED%92%80-%ED%9E%88%EC%B9%B4%EB%A6%ACCP
	//Hikari cp(커넥션풀) 사용 : 1. 메이븐에 추가 2. root-context.xml에 히카리 cp 설정 3. 드라이버 설치를 위한 메이븐 추가 4. root-context에 mybatis 객체생성  5. api를 위해 메이븐 추가
	//6. context에 스키마로케이션 추가 7. 마이바티스 객체가 모델을 찾아가게 context에 코드 추가
	
	//db연결 과정(요청 과정) : 스프링 -> mybatis -> 히카리cp -> jdbc -> 데이터베이스
	
	
	public List<BoardVO> boardList(); //실행될 sql의 id와 이름이 같아야 한다!!!!!!!!! 

	public void boardInsert(BoardVO vo);

	public BoardVO boardContent(int idx);

	public void boardUpdate(BoardVO vo);

	public void boardDelete(int idx);
	
	//조회수
	@Update("update tboard set count = count + 1 where idx = #{idx}") //이렇게 할 수 있지만 유지보수 측면에서 좋지 않기 때문에 권장하지는 않는다!
	public void count(int idx);

	
	
}
