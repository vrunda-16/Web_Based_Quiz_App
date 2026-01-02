package com.internship.quiz.beans;
import com.internship.quiz.dao.QuizDao;
import com.internship.quiz.model.Quiz;

public class FindQuizBean {
	int quizid;
	Quiz quiz;
	public FindQuizBean() {
	
	}
	public int getQuizid() {
		return quizid;
	}
	public void setQuizid(int quizid) {
		this.quizid = quizid;
	}
	public Quiz getQuiz() {
		return quiz;
	}
	public void setQuiz(Quiz quiz) {
		this.quiz = quiz;
	}
	public void find() {
		try(QuizDao quizDao=new QuizDao()) {
			this.quiz=quizDao.findQuizById(this.quizid);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
