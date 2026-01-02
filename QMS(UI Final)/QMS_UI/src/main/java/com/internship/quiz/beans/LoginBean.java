package com.internship.quiz.beans;

import java.sql.SQLException;

import com.internship.quiz.dao.UserDao;
import com.internship.quiz.model.User;

public class LoginBean {
	private String role;
	private String email;
	private String passwd;
	private User user;
	public LoginBean() {
		
	}
	
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void login() {
		try(UserDao userDao=new UserDao()){
			User dbuser=userDao.login(email, passwd);
						
			if(dbuser!=null ) {
				this.user=dbuser;
			}else {
				this.user=null;
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
	}
	
	
}
