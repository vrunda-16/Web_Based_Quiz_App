package com.internship.quiz.beans;
import com.internship.quiz.dao.QuizDao;

public class DeleteQuizBean {
	int quizid;
	int status=0;
	public DeleteQuizBean() {

	}

	public int getQuizid() {
		return quizid;
	}

	public void setQuizid(int quizid) {
		this.quizid = quizid;
	}
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public void delete() {
		try(QuizDao quizDao=new QuizDao()){
			this.status=quizDao.deleteQuiz(this.quizid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
