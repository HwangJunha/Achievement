package controller.admin.challenge;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Challenge;
import service.admin.challenge.face.AdminChallengeService;
import service.admin.challenge.impl.AdminChallengeServiceImpl;

/**
 * Servlet implementation class ChallengeViewController
 */
@WebServlet("/admin/challenge/view")
public class AdminChallengeViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private AdminChallengeService challengeService = new AdminChallengeServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//전달파라미터 얻기 - boardno
		Challenge challenge = challengeService.getChallengeno(req);

		//상세보기 결과 조회
		challenge = challengeService.view(challenge);
		
		//개설자와 인증주기 조회
		Map<String, String> result = challengeService.getNameTitle(challenge);
		
		//조회결과 MODEL값 전달
		req.setAttribute("challenge", challenge);
		req.setAttribute("result", result);
		
		
		
		
		req.getRequestDispatcher("/WEB-INF/views/adminChallenge/view.jsp").forward(req, resp);
		
	}
}
