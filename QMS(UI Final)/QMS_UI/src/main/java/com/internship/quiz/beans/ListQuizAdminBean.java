package com.internship.quiz.beans;

import java.sql.SQLException;
import java.util.List;

import com.internship.quiz.dao.QuizDao;
import com.internship.quiz.model.Quiz;

public class ListQuizAdminBean {
	private List<Quiz> list;
	public ListQuizAdminBean() {
	}
	public List<Quiz> getList() {
		return list;
	}
	public void setList(List<Quiz> list) {
		this.list = list;
	}
	public void fetchQuiz() {
		try(QuizDao quizDao=new QuizDao()){
			this.list=quizDao.displayQuizzes();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
