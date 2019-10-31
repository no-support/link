package kr.co.link.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		  if(session.getAttribute("LOGIN_USER") == null) {
			  
			  String returnUrl = request.getRequestURI().replace(request.getContextPath(), "");
			  String queryString =request.getQueryString();
			  
			  session.setAttribute("returnUrl", returnUrl);
			  session.setAttribute("queryString", queryString);
			  
//			  request.getRequestDispatcher("/WEB-INF/views/user/loginform.jsp?result=fail")
//			  		 .forward(request, response);
			  response.sendRedirect("/link/loginform.do?result=fail");
			  return false;  
		  }
		return true;
	}
}
