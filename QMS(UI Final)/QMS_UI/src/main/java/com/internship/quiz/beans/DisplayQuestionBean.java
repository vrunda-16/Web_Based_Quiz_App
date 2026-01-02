package com.internship.quiz.beans;
import java.util.*;

import com.internship.quiz.dao.AttemptDao;
import com.internship.quiz.model.*;
public class DisplayQuestionBean {
	List<Question> question;
	int quizid;
	public DisplayQuestionBean() {

	}

	public List<Question> getQuestion() {
		return question;
	}

	public void setQuestion(List<Question> question) {
		this.question = question;
	}
	
	public int getQuizid() {
		return quizid;
	}

	public void setQuizid(int quizid) {
		this.quizid = quizid;
	}
	public void fetchQuestions() {
		try(AttemptDao attemptDao=new AttemptDao()){
			this.question=attemptDao.takeQuiz(this.quizid);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
