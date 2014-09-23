package com.bank;
import java.sql.*;

public class DBM {
	public static Connection getConn() {
		Connection conn = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "CC5356532.");
			System.out.println("success");
		
		}
		catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return conn;
	}
	
	public static Statement getState(Connection conn){
		Statement state = null;
		try{
			state = conn.createStatement();	
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		
		return state;
	}
	
	public static ResultSet executeQuery(Statement state, String sql){
		ResultSet rs = null;
		try{
			rs = state.executeQuery(sql);	
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	
	public static int executeUpdate(Statement state, String sql){
		int res = 0;
		try {
			res = state.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
		
	}
	
	public static PreparedStatement getPreState(Connection conn, String sql){
		PreparedStatement PreState = null;
		try {
			PreState = conn.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return PreState;
	}
	public static PreparedStatement getPreState(Connection conn, String sql,int autoGenerateKeys){
		PreparedStatement PreState = null;
		try {
			PreState = conn.prepareStatement(sql,autoGenerateKeys);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return PreState;
	}
	public static void close(Connection conn)  {
		if(conn != null){
		try{
			conn.close();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		}
		conn = null;
	}
	
	public static void close(Statement state) {
		if(state != null){
		try{
			state.close();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
			
		}
		state = null;
	}
	public static void close(ResultSet rs)  {
		if(rs != null){
		try{
			rs.close();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		}
		rs = null;
	}
	
//	public static void main(String args[]){
//		DBM.getConn();
//	}
}
