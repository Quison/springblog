package com.moguichun.blog.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 
 * @ClassName: LoginInterceptor
 * @Description: 登录拦截器
 * @author: MoGuichun
 * @date: 2016年4月14日 上午10:51:09
 *
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if (request.getSession().getAttribute("user") != null) {
			return true;
		}
		
		response.sendRedirect("/manager/login");
		
		return false;
	}

}
