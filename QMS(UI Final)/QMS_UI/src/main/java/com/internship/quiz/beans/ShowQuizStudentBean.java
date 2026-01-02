package com.internship.quiz.beans;

import java.sql.SQLException;
import java.util.List;

import com.internship.quiz.dao.AttemptDao;
import com.internship.quiz.model.Quiz;

public class ShowQuizStudentBean {
	private List<Quiz> list;
	int studentId;
	int status=0;
	public List<Quiz> getList() {
		return list;
	}

	public void setList(List<Quiz> list) {
		this.list = list;
	}
	
	
	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public void show() {
		try(AttemptDao attemptDao=new AttemptDao()){
			this.list=attemptDao.displayStudentQuiz(studentId);
			status=1;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
