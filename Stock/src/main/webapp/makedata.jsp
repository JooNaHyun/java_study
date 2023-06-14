<%@page import="dao.StockDaoImpl"%>
<%@page import="dao.StockDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Make table</h1>
	<%
	StockDao StockDao = new StockDaoImpl(); // StockDaoImpl 객체를 생성합니다.
	int create = StockDao.makeData(); // makeData() 메서드를 호출하여 테이블을 생성합니다.
	out.println(create); // 생성 결과를 출력합니다.
	%>

</body>
</html>
