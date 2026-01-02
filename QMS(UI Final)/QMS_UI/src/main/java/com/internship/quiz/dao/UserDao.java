package com.internship.quiz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.internship.quiz.model.User;
import com.internship.quiz.util.DbUtil;

public class UserDao implements AutoCloseable{
	
	Connection connection=null;
	
	public UserDao() throws SQLException {
		connection=DbUtil.getConnection();
	}
	//StudentRegistration dao
	public void register(User user) throws SQLException {
		
		String sql="insert into users (name,email,password_hash,role) values(?,?,?,?)";
		try(PreparedStatement insertStatement=connection.prepareStatement(sql)){
			insertStatement.setString(1, user.getName());
			insertStatement.setString(2, user.getEmail());
			insertStatement.setString(3, user.getPassword());
			insertStatement.setString(4, "student");
			insertStatement.executeUpdate();
			
		}
	}
	
	//StudentLogin Dao
//	public User loginStudent(String email,String password) {
//
//		String sql="select * from users where email=? and password_hash =? and role=? ";
//		try(PreparedStatement selectStatement=connection.prepareStatement(sql)){
//			selectStatement.setString(1,email);
//			selectStatement.setString(2,password);
//			selectStatement.setString(3,"student");
//			ResultSet rs=selectStatement.executeQuery();
//			if(rs.next()) {
//				int id=rs.getInt(1);
//				String name=rs.getString(2);
//				String e=rs.getString(3);
//				String pass=rs.getString(4);
//				String role=rs.getString(5);
//				User user=new User(id,name,e,pass,role);
//				return user;
//			}			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return null;
//	}
	
	//AdminLogin Dao
	public User login(String email,String password) {
		
		String sql="select * from users where email=? and password_hash =?";
		try(PreparedStatement selectStatement=connection.prepareStatement(sql)){
			selectStatement.setString(1,email);
			selectStatement.setString(2,password);
			ResultSet rs=selectStatement.executeQuery();
			if(rs.next()) {
				int id=rs.getInt(1);
				String name=rs.getString(2);
				String e=rs.getString(3);
				String pass=rs.getString(4);
				String role=rs.getString(5);
				User user=new User(id,name,e,pass,role);
				return user;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
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
