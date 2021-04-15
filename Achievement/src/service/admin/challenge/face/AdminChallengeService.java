package service.admin.challenge.face;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import dto.Challenge;
import util.Paging;


public interface AdminChallengeService {
	/**
	 * 챌린지 전체 조회
	 * 	페이징 처리 추가
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return List<Challenge> - 챌린지 전체 조회 결과 리스트
	 */
	public List<Challenge> getList(Paging paging);
	/**
	 * 챌린지 제목을 통한 전체 조회
	 * 	페이징 처리 추가
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return List<Challenge> - 챌린지 전체 조회 결과 리스트
	 */
	public List<Challenge> getList(Paging paging, String title);
	
	
	/**
	 * 페이징 객체 생성
	 * 
	 * 요청파라미터 curPage를 구한다
	 * challenge 테이블과 curPage 값을 이용하여 Paging객체를 생성한다
	 * 
	 * @param req - curPage정보를 담고 있는 요청정보 객체
	 * @return 페이징 계산이 완료된 Paging 객체
	 */
	public Paging getPaging(HttpServletRequest req);
	
	/**
	 * 페이징 객체 생성
	 * 
	 * 요청파라미터 curPage를 구한다
	 * challenge 테이블과 curPage 값을 이용하여 Paging객체를 생성한다
	 * 
	 * @param req - curPage정보를 담고 있는 요청정보 객체
	 * @param title - 값이 존재할경우 title을 포함해서 조회한다
	 * @return 페이징 계산이 완료된 Paging 객체
	 */
	public Paging getPaging(HttpServletRequest req, String title);
	
	
	/**
	 * title 검색 설정
	 * 
	 * 요청파라미터 title을 구한다
	 * challenge 테이블의 title을 가져온다
	 * 
	 * @param req - title정보를 담고 있는 요청정보 객체
	 */
	public String getTitle(HttpServletRequest req);
	
	
	
	/**
	 * 요청파라미터 얻기
	 * 
	 * @param req - 요청정보객체
	 * @return Challenge - 전달파라미터 ch_no를 포함한 객체
	 */
	public Challenge getChallengeno(HttpServletRequest req);
	
	
	/**
	 * 주어진 ch_no를 이용하여 게시글을 조회한다
	 * 
	 * 
	 * @param challenge - ch_no를 가지고 있는 객체
	 * @return Challenge - 조회된 챌린지
	 */
	public Challenge view(Challenge challenge);
	
	/**
	 *주어진 ch_no을 이용하여 개설자 이름과 인증 주기 제목을 가져온다 
	 * sql의 join을 사용할 경우 map으로 필요한 데이터만 받아온다
	 * 
	 *@param challenge - ch_no을 가지고 있는 객체
	 *@return Map - name과 title을 가지고 있는 객체
	 */
	public Map<String, String> getNameTitle(Challenge challenge);
	
	/**
	 * session의 아이디로 해당 개설자이름을 가져온다 
	 * 
	 * @param u_id 
	 * @return String 개설자 이름을 가져온다
	 */
	public String getName(String u_id);
	
	/**
	 * 카테고리 목록 조회하기
	 * 
	 * @return List<String> 카테고리 목록 가져오기
	 */
	public List<String> getCategory();
	
	/**
	 * 인증주기 목록 불러오기 
	 * @return List<String> 카테고리 목록 가져오기
	 */
	public List<String> getCycle();
	
	/**
	 * 챌린지 삽입 
	 * 입력한 챌린지 DB에 삽입
	 * 첨부파일을 함께 업로드 할 수 있도록 처리
	 * @param - req - 요청정보 객체(챌린지 내용+ 첨부파일)
	 */
	public void write(HttpServletRequest req);
	
	/**
	 * 챌린지 수정 
	 * 입력한 챌린지 DB에서 수정
	 * 첨부파일을 함께 업로드 할 수 있도록 처리
	 * @param - req - 요청정보 객체(챌린지 내용+ 첨부파일)
	 */
	public void update(HttpServletRequest req);

	/**
	 * 챌린지 삭제
	 * 입력한 챌린지 DB에서 삭제
	 * 첨부파일을 함께 삭제 할 수 있도록 처리
	 * @param - req - 요청정보 객체(챌린지 내용+ 첨부파일)
	 */
	public void delete(HttpServletRequest req);
	

	
}
