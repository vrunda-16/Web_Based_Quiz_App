package com.internship.quiz.dao;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.internship.quiz.model.Quiz;
import com.internship.quiz.util.DbUtil;
//import com.mysql.cj.ServerPreparedQueryTestcaseGenerator;

public class QuizDao implements AutoCloseable {
	
		Connection connection=null;
		public QuizDao() throws SQLException {
			connection=DbUtil.getConnection();
		}

		public int insertQuiz(Quiz quiz) throws SQLException {
			
			String sql="insert into quizzes (title,creator_id) values(?,?)";
			try(PreparedStatement insertStatement=connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS)){
				insertStatement.setString(1, quiz.title);
				insertStatement.setInt(2, quiz.creatorId);
				insertStatement.executeUpdate();
				
				ResultSet rs=insertStatement.getGeneratedKeys();
				if(rs.next()) {
					return rs.getInt(1);
				}
				
			}
			return 0;
		}

		public List<Quiz> displayQuizzes() throws SQLException{
			
			List<Quiz> quiz=new ArrayList<>();
			String sql="select * from quizzes";
			try(PreparedStatement selectStatement=connection.prepareStatement(sql)){
				ResultSet rs=selectStatement.executeQuery();
				while(rs.next()) {
					Quiz q=new Quiz();
					q.setId(rs.getInt(1));
					q.setTitle(rs.getString(2));
					q.setCreatorId(rs.getInt(3));
					q.setDate(rs.getString(4));
					quiz.add(q);
				}	
			}
			return quiz;
		}
		
		public int deleteQuiz(int quizId) throws SQLException{
			int f=0;
			String sql="delete q from questions q inner join quizzes qz on q.quiz_id=qz.quiz_id where q.quiz_id=?";
			
			try(PreparedStatement deleteStatement=connection.prepareStatement(sql)){
				deleteStatement.setInt(1, quizId);
				deleteStatement.executeUpdate();
				
				String sql1="delete from quizzes where quiz_id=?";
				try(PreparedStatement deleteStatement1=connection.prepareStatement(sql1)){
					deleteStatement1.setInt(1, quizId);
					f=deleteStatement1.executeUpdate();
				}
			}
			return f;
		}
		
		public Quiz findQuizById(int id) throws SQLException {
			
			String sql="select * from quizzes where quiz_id=?";
			Quiz quiz=new Quiz();
			try(PreparedStatement selectStatement=connection.prepareStatement(sql)){
				selectStatement.setInt(1, id);
				ResultSet rs=selectStatement.executeQuery();
				while(rs.next()) {
					quiz.setId(rs.getInt(1));
					quiz.setTitle(rs.getString(2));
					quiz.setCreatorId(rs.getInt(3));
					return quiz;
				}
			}
			return null;
		}
		
		@Override
		public void close() throws Exception {
			if(connection != null) {
				connection.close();
				connection=null;
				}			
		}
}