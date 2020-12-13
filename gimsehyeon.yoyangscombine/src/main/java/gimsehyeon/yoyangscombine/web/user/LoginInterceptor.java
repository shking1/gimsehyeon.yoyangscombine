package gimsehyeon.yoyangscombine.web.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		boolean isLogged = false;
		Object userId = (String)request.getSession().getAttribute("userId");
		
		if(userId != null) {
			isLogged = true;
			if(!userId.equals("admin")) {
				response.sendRedirect(request.getContextPath() + "/");
			}
		}
		else response.sendRedirect(request.getContextPath() + "/user/login");
		
		return isLogged;
	}
}