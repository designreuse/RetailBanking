package com.bank;
import java.util.*;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
	int userID;
	String userName;
	String emailAddress;
	String adress;
	int phoneNumber;
	int ssn;
	Date birthday;
	
	public int getUserID() {
		return userID;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getAddress() {
		return adress;
	}
	public void setAddress(String adress) {
		this.adress = adress;
	}
	public int getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(int phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public int getSsn() {
		return ssn;
	}
	public void setSsn(int ssn) {
		this.ssn = ssn;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	
	public void initFromRs(ResultSet rs){
	try{
		setUserName(rs.getString("username"));
		setEmailAddress(rs.getString("email"));
		setAddress(rs.getString("address"));
		setPhoneNumber(rs.getInt("phone"));
		setSsn(rs.getInt("ssn"));
		setBirthday(rs.getDate("birthday"));
	}
	catch(SQLException e){
		e.printStackTrace();
	}
		
	}

	
}

