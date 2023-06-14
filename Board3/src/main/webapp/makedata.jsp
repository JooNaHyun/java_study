<%@page import="dao.GongjiDaoImpl"%>
<%@page import="dao.GongjiDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<h1>Make table</h1>
	<!--"Make table" 제목을 출력합니다. -->
	<%


			GongjiDao GongjiDao = new GongjiDaoImpl();
			// GongjiDaoImpl 객체를 생성합니다.
			int create = GongjiDao.makeData();
			// 데이터베이스에서 테이블을 생성하는 makeData() 메서드를 호출하여 결과를 create 변수에 저장합니다.
			out.println(create);
			// create 변수의 값을 출력합니다.
	%>
</body>
</html>
