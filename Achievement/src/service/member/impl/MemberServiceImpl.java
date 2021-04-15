package service.member.impl;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import dao.member.face.MemberDao;
import dao.member.impl.MemberDaoImpl;
import dto.Member;
import service.member.face.MemberService;

public class MemberServiceImpl implements MemberService{
	
	private MemberDao memberDao = new MemberDaoImpl();
	@Override
	public Member getLoginMember(HttpServletRequest req) {
		Member member = new Member();
		
		member.setUid(req.getParameter("userid"));
		member.setUpassword(req.getParameter("userpwd"));
		
		return member;
	}
	
	@Override
	public boolean login(Member mem) {
		if(memberDao.selectCntMemberByUseridUserpw(JDBCTemplate.getConnection(), mem)>0) {
			return true; //로그인 성공
		}else {
			return false; //로그인 실패
		}
	}
	@Override
	public Member info(Member mem) {
		//조회된  정보
		return memberDao.selectMemberByUserid(JDBCTemplate.getConnection(), mem);
	}
}
