package com.internship.quiz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.internship.quiz.model.Question;
import com.internship.quiz.model.Quiz;
import com.internship.quiz.util.DbUtil;

public class AttemptDao implements AutoCloseable {
	Connection connection=null;
	
	public AttemptDao() throws SQLException {
		connection=DbUtil.getConnection();
	}
	
	public List<Quiz> displayStudentQuiz(int student_id) throws SQLException{
		List<Quiz> quizList =new ArrayList<>();
		
		String sql="select * from quizzes where quiz_id not in(select q.quiz_id from quizzes q inner join quiz_attempts a on q.quiz_id=a.quiz_id where a.student_id=?)";
		try(PreparedStatement selePreparedStatement=connection.prepareStatement(sql)){
			selePreparedStatement.setInt(1, student_id);
			ResultSet rs=selePreparedStatement.executeQuery();
			while(rs.next()) {
				Quiz q=new Quiz();
				q.setId(rs.getInt(1));
				q.setTitle(rs.getString(2));
				q.setCreatorId(rs.getInt(3));
				q.setDate(rs.getString(4));
				quizList.add(q);
			}
		}
		return quizList;

	}
	
	public List<Question> takeQuiz(int id) throws SQLException{
		List<Question> questionList=new ArrayList<>();
		
		String sql="select * from questions where quiz_id=?";
		try(PreparedStatement selectPreparedStatement=connection.prepareStatement(sql)){
			selectPreparedStatement.setInt(1, id);
			ResultSet rs=selectPreparedStatement.executeQuery();
			while(rs.next()) {
				
				Question q=new Question();
				q.setId(rs.getInt(1));
				q.setQuizId(rs.getInt(2));
				q.setText(rs.getString(3));
				q.setA(rs.getString(4));
				q.setB(rs.getString(5));
				q.setC(rs.getString(6));
				q.setD(rs.getString(7));
				q.setCorrect(rs.getString(8).charAt(0));
				questionList.add(q);
			}
		}
		return questionList;
	}
	
	public void insertQuizAttempts(int quiz_id,int student_id,int final_score,int total_questions) throws SQLException {
		
		String sql="insert into quiz_attempts (quiz_id,student_id,final_score,total_questions) values(?,?,?,?)";
		try(PreparedStatement insertStatement=connection.prepareStatement(sql)){
			insertStatement.setInt(1,quiz_id);
			insertStatement.setInt(2,student_id);
			insertStatement.setInt(3,final_score);
			insertStatement.setInt(4,total_questions);
			insertStatement.executeUpdate();		
		}
		
	}
	
	public List<Object[]> displayScoreToStudent(int student_id) throws SQLException {
		
		List<Object[]> obj=new ArrayList<>();
		String sql="select qz.title,a.final_score,a.total_questions from quizzes qz inner join quiz_attempts a on qz.quiz_id=a.quiz_id where a.student_id=?";
		try(PreparedStatement selectPreparedStatement=connection.prepareStatement(sql)){
			selectPreparedStatement.setInt(1,student_id);
			ResultSet rs =selectPreparedStatement.executeQuery();
			while(rs.next()) {
				String title=rs.getString(1);
				int score=rs.getInt(2);
				int total_q=rs.getInt(3);
				obj.add(new Object[] {title,score,total_q});
			}
		}
		return obj;
	}
	
	public List<Object[]> displayScoreToAdmin() throws SQLException{
		List<Object[]> obj=new ArrayList<>();
		String sql="select qz.title,a.student_id,a.final_score,a.total_questions from quizzes qz inner join quiz_attempts a on qz.quiz_id=a.quiz_id";
		try(PreparedStatement selectStatement=connection.prepareStatement(sql)){
			ResultSet rs=selectStatement.executeQuery();
			
			while(rs.next()) {
				String title=rs.getString(1);
				int stud_id=rs.getInt(2);
				int score=rs.getInt(3);
				int total_questions=rs.getInt(4);
				obj.add(new Object[] {title,stud_id,score,total_questions});
			}
		}
		return obj;
		
	}
	
	@Override
	public void close() throws Exception {
		if(connection!=null) {
			connection.close();
			connection=null;
		}
		
	}

}
