package controller.user.challenge;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Challenge;
import service.user.challenge.face.UserChallengeService;
import service.user.challenge.impl.UserChallengeServiceImpl;
import util.Paging;

/**
 * Servlet implementation class UserChallengeListController
 */
@WebServlet("/user/challenge/list")
public class UserChallengeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserChallengeService userChallengeService = new UserChallengeServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Challenge challenge = userChallengeService.getCategory(req);
		String title = userChallengeService.getTitle(req);
		String category = userChallengeService.getCategory(challenge);
		
		
		Paging paging =null;
		List<Challenge> challengeList = null;
		
		HttpSession session = req.getSession();		
		
		//요청파라미터를 전달하여 Paging객체 생성하기
		if(challenge.getCaNo()==0) { //category값이 없을 경우
			if(title==null) { //카테고리를 포함하지 않고  제목 검색이 없는 경우
				//System.out.println("카테고리 - 제목 -");
				paging = userChallengeService.getPaging(req);
				challengeList = userChallengeService.getList(paging);
				session.removeAttribute("ch_user_title");
				
			}else { //카테고리를 포함하지 않고 제목 검색이 있는 경우
				//System.out.println("카테고리 - 제목 +");
				paging = userChallengeService.getPaging(req, title);
				challengeList = userChallengeService.getList(paging, title);
				session.setAttribute("ch_user_title", title);
			}
			session.removeAttribute("category");
			
		}else { //카테고리가 있는 경우
			if(title==null) {//카테고리를 포함하고 제목 검색이 없는 경우
			//	System.out.println("카테고리 + 제목-");
				paging = userChallengeService.getPaging(req, challenge);
				challengeList = userChallengeService.getList(paging,challenge);
				session.removeAttribute("ch_user_title");
				
			}else {//카테고리를 포함하고 제목 검색이 있는 경우
				//System.out.println("카테고리 + 제목 +");
				paging = userChallengeService.getPaging(req, challenge,title);
				challengeList = userChallengeService.getList(paging,challenge,title);
				session.setAttribute("ch_user_title", title);
			}
			session.setAttribute("category", challenge.getCaNo());
		}
		
		//페이징 객체를 MODEL값으로 전달
		req.setAttribute("paging", paging);
		
		//조회결과 MODEL값 전달
		req.setAttribute("ch_category", category);
		
		req.setAttribute("challengeList", challengeList);
		req.getRequestDispatcher("/WEB-INF/views/userChallenge/list.jsp")
			.forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
