package kr.ac.kopo.kor.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.ac.kopo.kor.model.Member;

public class UserIntercepter extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//사용자인지 아닌지 확인하려함
		HttpSession session = request.getSession();
		
		if(session != null) {
			Member member =  (Member)session.getAttribute("member");
			
			if(member != null) {
				return true;
			}
		}
		
		response.sendRedirect("/login"); // /kopo/는 지워버릴거임
		return false; //false를 리턴하면 전달되지 않아서 처리가 안됨
	}

}
