package com.etc.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet Filter implementation class EncodingFilter
 */
@WebFilter("/LoginFilter")
public class UserLoginFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public UserLoginFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req=(HttpServletRequest)request; 
		response.setContentType("text/html");
		HttpSession session = req.getSession(); 
		Object obj = session.getAttribute("frontUser");
		String url =req.getServletPath(); 
		if(obj!=null) { 
			chain.doFilter(request, response);
		}else { 
			if ("index.jsp".equals(url)) {
				chain.doFilter(request, response);
			}else { 
				response.getWriter().print("<script>alert('请登录!');location.href='index.jsp'</script>");
			}
		}

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
