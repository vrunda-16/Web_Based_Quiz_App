package com.internship.quiz.menu;

import java.util.Scanner;

import com.internship.quiz.service.UserService;

public class MainMenu {
	private static UserService userService =new UserService();
	
	private static int mainMenuOptions(Scanner sc) {
		
		System.out.println("-----------MainMenu-----------");
		System.out.println("1.Admin Login");
		System.out.println("2.Student Register");
		System.out.println("3.Student Login");
		System.out.println("4.Exit");
		
		return sc.nextInt();
	}
	public static void mainMenu(Scanner sc) {
		int choice;
		while((choice=mainMenuOptions(sc))!=4) {
			switch(choice) {
			case 1:
				userService.userLogin(sc);
				break;
			case 2:
				userService.studentRegistration(sc);
				break;
			case 3:
				userService.userLogin(sc);
				break;
			}
		}
	}
}
