<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
// JDBC 드라이버 로드
Class.forName("com.mysql.cj.jdbc.Driver");

// 데이터베이스 연결
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:33060/kopo31", "root", "kopo31");

// SQL 문 실행을 위한 Statement 객체 생성
Statement stmt = conn.createStatement();

// SQL 쿼리 실행하여 결과를 받아옴
ResultSet rset = stmt.executeQuery("select * from examtable");

// XML 형식으로 데이터 출력 시작
out.println("<datas>");

// ResultSet에서 데이터를 한 줄씩 가져와서 XML 형식으로 출력
while (rset.next()) {
	out.println("<data>");
	out.println("<name>" + rset.getString(1) + "</name>");
	out.println("<studentid>" + rset.getString(2) + "</studentid>");
	out.println("<kor>" + rset.getString(3) + "</kor>");
	out.println("<eng>" + rset.getString(4) + "</eng>");
	out.println("<mat>" + rset.getString(5) + "</mat>");
	out.println("</data>");
}

// XML 형식으로 데이터 출력 종료
out.println("</datas>");

// 사용한 자원들을 해제
rset.close();
stmt.close();
conn.close();
%>
