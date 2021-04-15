package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter{
	
	//인코딩 설정값 변수
	private String charset = null;
	
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("EncodingFilter - init()");
		//web.xml에 설정한 초기화파라미터 얻어오기
		charset = filterConfig.getInitParameter("enc");
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		//System.out.println("---컨트롤러 동작 전 ---");
		request.setCharacterEncoding(charset);
		
		//요청정보를 컨트롤러로 전달한다
		chain.doFilter(request, response);
		
		//System.out.println("---컨트롤러 동작 후 ---");
	}
}
