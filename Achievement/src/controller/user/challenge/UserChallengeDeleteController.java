package controller.user.challenge;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.user.challenge.face.UserChallengeService;
import service.user.challenge.impl.UserChallengeServiceImpl;

/**
 * Servlet implementation class UserChallengeDeleteController
 */
@WebServlet("/user/challenge/delete")
public class UserChallengeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserChallengeService userChallengeService = new UserChallengeServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userChallengeService.delete(req);
		resp.sendRedirect("/user/challenge/list");
	}
	
}
