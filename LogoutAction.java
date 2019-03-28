package com.internousdev.mars.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.mars.dao.UserInfoDAO;
import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;

	public String execute() {
		String result = ERROR;
		UserInfoDAO userInfoDao = new UserInfoDAO();
		String userId = String.valueOf(session.get("userId"));
		boolean savedUserId = Boolean.valueOf(String.valueOf(session.get("savedUserId")));
		int count = userInfoDao.logout(userId);
		if (count > 0) {
			session.clear();
			if (savedUserId) {
				session.put("savedUserId", savedUserId);
				session.put("userId", userId);
				result = SUCCESS;
			}
		}
		return result;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}