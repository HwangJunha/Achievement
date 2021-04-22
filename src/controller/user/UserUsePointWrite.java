package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Refunds;
import service.user.face.UserService;
import service.user.impl.UserServiceImpl;

/**
 * Servlet implementation class UserUsePointWrite
 */
@WebServlet("/user/use/point/write")
public class UserUsePointWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserServiceImpl();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//포인트 사용을 포함한 refunds 객체 호출
		Refunds refunds = userService.getRefunds(req);
		//사용 포인트
		int curPoint = userService.getCurPoint(req);
		int uNo = userService.getuNo(req);
		//값이 0미만으로 떨어질경우 또는 사용 포인트가 현재 포인트보다 많을경우
		if(refunds.getRefundableAmount()<0 || curPoint < refunds.getRePoint()) {
			resp.sendRedirect("/");
		}
		//환불을 위한 토큰 생성 
		String token=userService.refundsToken();
		
		//최종 환불자
		userService.refunds(refunds, token);
		
		//refunds 업데이트
		userService.refundsUpdate(refunds); 
		//mypage 업데이트
		userService.mypageUpdate(refunds.getRePoint(),uNo);
	}
}
