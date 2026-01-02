package com.internship.quiz.beans;

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import com.internship.quiz.dao.QuestionDao;
import com.internship.quiz.dao.QuizDao;
import com.internship.quiz.model.*;
import com.internship.quiz.util.QuestionFileParser;
public class CreateQuiz {
	
	String path;
	String title;
	Quiz quiz;
	int creatorId;
	int status=0;
	public CreateQuiz() {
		
	}
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Quiz getQuiz() {
		return quiz;
	}
	public void setQuiz(Quiz quiz) {
		this.quiz = quiz;
	}
	public int getCreatorId() {
		return creatorId;
	}
	public void setCreatorId(int creatorId) {
		this.creatorId = creatorId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

	
	public void insertQuiz() {
		File file=new File(path);
		quiz=new Quiz();
		quiz.title=title;
		quiz.creatorId=this.creatorId;
		
		try(QuizDao quizDao=new QuizDao()){
			
			List<Question> list=QuestionFileParser.parse(file);
			try(QuestionDao questionDao=new QuestionDao()){
				int quizId=quizDao.insertQuiz(quiz);
				for(Question q:list) {
					q.quizId=quizId;
					questionDao.insertQuestion(q);
					this.status=1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	 
}
