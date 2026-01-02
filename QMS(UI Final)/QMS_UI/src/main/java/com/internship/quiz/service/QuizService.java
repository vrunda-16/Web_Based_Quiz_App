package com.internship.quiz.service;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.internship.quiz.dao.QuestionDao;
import com.internship.quiz.dao.QuizDao;
import com.internship.quiz.model.Question;
import com.internship.quiz.model.Quiz;
import com.internship.quiz.util.QuestionFileParser;

public class QuizService {

	public void createQuiz(Scanner sc,int adminId) {
		System.out.println("Enter quiz title:");
		String title=sc.next();
		
		System.out.println("Enter question file path :");
		String path=sc.next();
		File file=new File(path);
		
		Quiz quiz=new Quiz();
		quiz.title=title;
		quiz.creatorId=adminId;
		
		try(QuizDao quizDao=new QuizDao()){
			
			List<Question> list=QuestionFileParser.parse(file);
			try(QuestionDao questionDao=new QuestionDao()){
				int quizId=quizDao.insertQuiz(quiz);
				for(Question q:list) {
					q.quizId=quizId;
					questionDao.insertQuestion(q);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void showQuizzes(){
		System.out.println("---------QUIZZES--------");
		List<Quiz> quiz=new ArrayList<>();
		try(QuizDao quizDao=new QuizDao()){
			quiz=quizDao.displayQuizzes();
			for(Quiz q:quiz) {
				System.out.println("* "+q.getTitle());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void removeQuiz(Scanner sc) {
		System.out.println("Enter Quizid to delete:");
		int quizId=sc.nextInt();
		try(QuizDao quizDao=new QuizDao()){
			int f=quizDao.deleteQuiz(quizId);
			if(f==1)
				System.out.println("Quiz "+quizId+" deleted successfully!");
			else {
				System.out.println("Quiz not found!!");
			}
		} catch (Exception e) {

			e.printStackTrace();
		} 
	}
}
