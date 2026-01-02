package com.internship.quiz.menu;

import java.util.Scanner;

import com.internship.quiz.service.AttemptService;
import com.internship.quiz.service.QuizService;

public class AdminMenu {
	private static QuizService quizService=new QuizService();
	private static AttemptService attemptService=new AttemptService();
	
	private static int adminMenuOptions(Scanner sc) {
		System.out.println("--------------Admin Menu--------------");
		System.out.println("1.Create Quiz");
		System.out.println("2.List Quizes");
		System.out.println("3.View Results");
		System.out.println("4.Delete Quiz");
		System.out.println("5.Logout");

		return sc.nextInt();
	}
	public static void adminMenu(Scanner sc ,int id) {
		int choice;
		while((choice=adminMenuOptions(sc))!=5) {
			switch(choice) {
			case 1:
				quizService.createQuiz(sc,id);
				break;
			case 2:
				quizService.showQuizzes();
				break;
			case 3:
				attemptService.showScoreToAdmin(sc);
				break;
			case 4:
				quizService.removeQuiz(sc);
				break;
			}
		}
	}
}
