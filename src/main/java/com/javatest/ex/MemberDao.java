package com.javatest.ex;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberDao {
	
	private static MemberDao instance = new MemberDao(); // 싱글턴 패턴
	private MemberDao() {	}
	
	public static MemberDao getInstance() {
		return instance;
	}
	public int insertMember(MemberDto dto) {
		
		String m_id = dto.getId();
		String m_pw = dto.getPw();
		String m_name = dto.getName();
		String m_eMail = dto.geteMail();
		String m_address = dto.getAddress();
		
		
		int flag = 0;
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/memberdb";
		String user = "root";
		String password = "1234";
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "insert into members(id,pw,name,email,address) values ('"+m_id+"', '"+m_pw+"', '"+m_name+"', '"+m_eMail+"', '"+m_address+"')";
		
		try {
			Class.forName(driverName);
			connection = DriverManager.getConnection(url, user, password);
			pstmt = connection.prepareStatement(query); // query를 실행시켜주는 객체 생성(statement)
			//pstmt.setString(1,m_id);
			//pstmt.setString(2,m_pw);
			//pstmt.setString(3,m_name);
			//pstmt.setString(4,m_eMail);
			//pstmt.setString(5,m_address);
			
			flag = pstmt.executeUpdate(query); // sql문이 성공적으로 실행되면 flag에 1을 반환
		
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(connection != null) {
					connection.close();
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return flag;
	} 

}
