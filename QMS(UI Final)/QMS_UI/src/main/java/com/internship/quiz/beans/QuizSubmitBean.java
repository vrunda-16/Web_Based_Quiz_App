package com.internship.quiz.beans;

import java.net.http.HttpRequest;
import java.sql.SQLException;
import java.util.List;

import com.internship.quiz.dao.AttemptDao;
import com.internship.quiz.model.Question;

import jakarta.servlet.http.HttpServletRequest;


public class QuizSubmitBean {
//	char ans;
	int quizid;
	int studentId;
	int final_score=0;
	int total_questions=0;
	int status=0;
	List<Question> question;
	public QuizSubmitBean() {
	
	}
//	public char getAns() {
//		return ans;
//	}
//	public void setAns(char ans) {
//		this.ans = ans;
//	}
	public int getQuizid() {
		return quizid;
	}
	public void setQuizid(int quizid) {
		this.quizid = quizid;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public int getFinal_score() {
		return final_score;
	}
	public void setFinal_score(int final_score) {
		this.final_score = final_score;
	}
	public int getTotal_questions() {
		return total_questions;
	}
	public void setTotal_questions(int total_questions) {
		this.total_questions = total_questions;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public List<Question> getQuestion() {
		return question;
	}
	public void setQuestion(List<Question> question) {
		this.question = question;
	}
	
	public void calResult(HttpServletRequest req) {
		
		try(AttemptDao attemptDao=new AttemptDao()){
			this.question=attemptDao.takeQuiz(this.quizid);
			for (Question q : question) {
	            String userAns = req.getParameter("ans" + q.getId());

	            if (userAns != null && userAns.charAt(0) == q.getCorrect()) {
	                final_score++;
	            }
	            total_questions=total_questions+1;
	            status=1;
	        }
			 attemptDao.insertQuizAttempts(quizid, studentId, final_score, total_questions);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
