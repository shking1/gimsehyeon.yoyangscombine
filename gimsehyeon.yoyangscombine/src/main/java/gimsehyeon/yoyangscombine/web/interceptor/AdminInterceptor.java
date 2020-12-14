package gimsehyeon.yoyangscombine.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		boolean isLogged = false;
		Object userId = (String)request.getSession().getAttribute("userId");
		
		if(userId == null) response.sendRedirect(request.getContextPath() + "/user/login");
		else if(!userId.equals("admin")) {
			response.sendRedirect(request.getContextPath() + "/");
		}
		
		return isLogged;
	}
}