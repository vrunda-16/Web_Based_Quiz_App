package com.internship.quiz.service;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.internship.quiz.dao.AttemptDao;
import com.internship.quiz.model.Question;
import com.internship.quiz.model.Quiz;

public class AttemptService {

	public void showStudentQuizzes(int student_id) {
		List<Quiz> quiz=new ArrayList<>();
		System.out.println("Available Quizzes:");
		try(AttemptDao attemptDao=new AttemptDao()){
			quiz=attemptDao.displayStudentQuiz(student_id);
			for(Quiz q:quiz) {
				System.out.println("* "+q.getTitle());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void attemptQuiz(Scanner sc,int student_id) {
		List<Question> question=new ArrayList<>();
		System.out.println("Enter quiz title to start quiz:");
		int id=sc.nextInt();
		char ans=0;
		int final_score=0,quiz_id=0,total_questions=0;
		try(AttemptDao attemptDao=new AttemptDao()){
			question=attemptDao.takeQuiz(id);
			for(Question q:question) {
			
				System.out.println("Q."+q.getText());
				System.out.println("A)"+q.getA());
				System.out.println("B)"+q.getB());
				System.out.println("C)"+q.getC());
				System.out.println("D)"+q.getD());
				quiz_id=q.getQuizId();
				System.out.println("Enter Answer:");
				ans=sc.next().charAt(0);
			
				if(Character.compare(Character.toLowerCase(ans),Character.toLowerCase(q.getCorrect()))==0) {
					
					final_score=final_score+1;
				}
				total_questions=total_questions+1;
			}
			attemptDao.insertQuizAttempts(quiz_id,student_id,final_score,total_questions);
			System.out.println("-----QUIZ END----");
		}catch (Exception e) {
	
			e.printStackTrace();
		}
	}
	
	public void showScoreToStudent(Scanner sc,int student_id) {
		List<Object[]> arr=new ArrayList<>();
		try(AttemptDao attemptDao=new AttemptDao()){
			arr=attemptDao.displayScoreToStudent(student_id);
			
			for(Object[] obj:arr) {
				System.out.println("----QuizName:"+obj[0]+"----");
				System.out.println("Score:"+obj[1]);
				System.out.println("Total Questions:"+obj[2]);
			}
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void showScoreToAdmin(Scanner sc) {
		List<Object[]> arr=new ArrayList<>();
		try(AttemptDao attemptDao=new AttemptDao()){
			arr=attemptDao.displayScoreToAdmin();
			
			for(Object[] obj:arr) {
				System.out.println("QuizName:"+obj[0]+" "+"StudentId:"+obj[1]+" "+"Score:"+obj[2]);	
			}
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
