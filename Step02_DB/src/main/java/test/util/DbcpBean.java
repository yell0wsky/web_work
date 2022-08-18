package test.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
/*
 * 	[Data Base Connection Pool Bean]
 * 
 * - 최초 Connection 이 필요한 시점에 미리 Connection 여러개를 얻어내서 Connection Pool에
 * 	넣어놓고 필요할 때 가져다 쓰고 다 쓴 다음ㅇ 반납하는 구조로 사용한다.
 * 
 * - Connection Pool 에서 Connection 한개를 가져오는 방법
 *	Connection conn=new DbcpBean().getConn();
 * 
 * - 다 사용한 다음 반납하는 방법
 * 	conn.close(); // close() 메소드를 호출하면 자동으로 pool에 반납된다.
 * 
 */
public class DbcpBean {
	// 필드
	private Connection conn;

	// 생성자
	public DbcpBean() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
			// 리턴되는 Connection 객체 필드에 저장하기
			conn = ds.getConnection();
			System.out.println("Connection 얻어오기 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 메소드
	public Connection getConn() {
		return conn;
	}
}