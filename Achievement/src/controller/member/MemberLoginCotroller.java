package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Member;
import service.member.face.MemberService;
import service.member.impl.MemberServiceImpl;

/**
 * Servlet implementation class UserLoginCotroller
 */
@WebServlet("/member/login")
public class MemberLoginCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService memberService = new MemberServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/member/login.jsp")
			.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		//전달파라미터 얻기 - 로그인 정보
		Member mem = memberService.getLoginMember(req);
		String[] check = req.getParameterValues("idRemember");
		boolean login = memberService.login(mem);
		if(login) {
			//로그인 사용자의 정보 얻어오기
			mem = memberService.info(mem);
			
			
			//세션 정보 저장하기
			HttpSession session = req.getSession();		
			session.setAttribute("login", login);
			session.setAttribute("u_id", mem.getUid());
			session.setAttribute("u_grade", mem.getUgrade());
			//아이디 기억하기가 체크 되었을때
			if(check!=null) {
					Cookie idCookie = new Cookie("ID", mem.getUid());
					idCookie.setMaxAge(90*24*60*60); //90일동안 보관
					
					Cookie checkCookie = new Cookie("CHECK", "check");
					checkCookie.setMaxAge(90*24*60*60); //90일동안 보관
					
					Cookie gradeCookie = new Cookie("GRADE", mem.getUgrade());
					gradeCookie.setMaxAge(90*24*60*60); //90일동안 보관
					
					resp.addCookie(idCookie);
					resp.addCookie(checkCookie);
					resp.addCookie(gradeCookie);
					
			}else {
				Cookie[] cookies = req.getCookies();
				for(int i=0; i<cookies.length; i++) {
					cookies[i].setMaxAge(0);
					resp.addCookie(cookies[i]);
				}
			}
			
			if("M".equals(mem.getUgrade())) { //관리자일경우
				resp.sendRedirect("/admin");
				return;
			}
		}
		
		resp.sendRedirect("/");
	}
	
}
