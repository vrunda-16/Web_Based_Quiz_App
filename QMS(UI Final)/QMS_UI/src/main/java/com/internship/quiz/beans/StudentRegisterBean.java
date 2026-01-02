package com.internship.quiz.beans;

import java.sql.SQLException;

import com.internship.quiz.dao.UserDao;
import com.internship.quiz.model.User;

public class StudentRegisterBean {
	String name;
	String email;
	String passwd;
	User user;
	int status=0;
	public StudentRegisterBean() {
		// TODO Auto-generated constructor stub
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public void setPasswd(String password) {
		this.passwd = password;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public void registerStudent() {
		user=new User();
		try(UserDao userDao=new UserDao()){
			user.setName(this.name);
			user.setEmail(this.email);
			user.setPassword(this.passwd);
			userDao.register(user);
			status=1;
		}  catch (Exception e) {
			e.printStackTrace();
		}
	}
}
