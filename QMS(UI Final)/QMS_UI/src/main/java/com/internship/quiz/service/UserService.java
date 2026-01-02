package com.internship.quiz.service;

import java.sql.SQLException;
import java.util.Scanner;

import com.internship.quiz.dao.UserDao;
import com.internship.quiz.menu.AdminMenu;
import com.internship.quiz.menu.StudentMenu;
import com.internship.quiz.model.User;

public class UserService {
	//STUDENT REGISTRATION SERVICE
	public void studentRegistration(Scanner sc){
		
		User user=new User();
		
		System.out.println("Enter name:");
		user.setName(sc.next());
		System.out.println("Enter email:");
		user.setEmail(sc.next());
		System.out.println("Enter password:");
		user.setPassword(sc.next());
		
		try (UserDao userDao = new UserDao()) {
			userDao.register(user);
			System.out.println("Student registered successfully...");		
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	//STUDENT LOGIN SERVICE
//	public void studentLogin(Scanner sc) {
//		
//		System.out.println("------STUDENT LOGIN------");
//		System.out.println("Enter email:");
//		String email=sc.next();
//		System.out.println("Enter password:");
//		String password=sc.next();
//		
//		try(UserDao userDao=new UserDao()){
//			User user=userDao.loginStudent(email, password);
//			if(user==null) {
//				System.out.println("Login failed!!");
//			}else {
//				System.out.println("Login Successfull!");
//				StudentMenu.studentMenu(sc,user.getId());
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} 
//		
//	}
	//ADMIN LOGIN SERVICE
	public void userLogin(Scanner sc) {
		System.out.println("-----ADMIN LOGIN------");
		System.out.println("Enter email:");
		String email=sc.next();
		System.out.println("Enter password:");
		String password=sc.next();
		
		try(UserDao userDao=new UserDao()){
			User user=userDao.login(email, password);
			if(user==null) {
				System.out.println("Login failed!!");
			}else {
				
				System.out.println("Login Successfull!");
				AdminMenu.adminMenu(sc,user.getId());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
	}
}
