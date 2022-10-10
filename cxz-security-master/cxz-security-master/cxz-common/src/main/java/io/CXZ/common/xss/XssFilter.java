/**
 * Copyright (c) 2018 cxz开源 All rights reserved.
 *
 * https://www.cxz.io
 *
 * 版权所有，侵权必究！
 */

package io.cxz.common.xss;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * XSS过滤
 * @author
 */
public class XssFilter implements Filter {

	@Override
	public void init(FilterConfig config) {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
		XssHttpServletRequestWrapper xssRequest = new XssHttpServletRequestWrapper(
				(HttpServletRequest) request);
		chain.doFilter(xssRequest, response);
	}

	@Override
	public void destroy() {
	}

}