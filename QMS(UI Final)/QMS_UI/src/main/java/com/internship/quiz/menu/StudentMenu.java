package com.internship.quiz.menu;

import java.util.Scanner;

import com.internship.quiz.service.AttemptService;

public class StudentMenu {
	private  static AttemptService attemptService=new AttemptService(); 
	private static int studentMenuOptions(Scanner sc) {
		System.out.println("-----------Student Menu------------");
		System.out.println("1.View Quizes");
		System.out.println("2.Take Quiz");
		System.out.println("3.Veiw score");
		System.out.println("4.Logout");
		return sc.nextInt();
	}
	public static void studentMenu(Scanner sc,int id) {
		int choice;
		while((choice=studentMenuOptions(sc))!=4) {
			switch((choice)) {
			case 1:
				attemptService.showStudentQuizzes(id);
				break;
			case 2:
				attemptService.attemptQuiz(sc,id);
				break;
			case 3:
				attemptService.showScoreToStudent(sc, id);
				break;
			default:
					
			}
		}
	}
}
