package test.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DbcpBean {
	//필드
	private Connection conn;
	
	//생성자
	public DbcpBean() {
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			//리턴되는 Connection 객체를 필드에 저장하기 
			conn = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//Connection 객체를 리턴하는 메소드
	public Connection getConn() {
		return conn;
	}
	
}








