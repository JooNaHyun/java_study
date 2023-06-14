
<%@page import="dao.StockDaoImpl"%>
<%@page import="dao.StockDao"%>
<%@page import="java.util.List"%>
<%@page import="dto.pagination"%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- 문자 인코딩을 UTF-8로 설정한다. -->
<%@ page contentType="text/html; charset=utf-8"%>
<!-- 페이지의 콘텐츠 유형을 HTML이며, 문자 인코딩을 UTF-8로 설정한다. -->
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<!-- Java의 SQL, JDBC, I/O 라이브러리를 가져온다. -->
<html>
<head>

</head>
<body>
	<h1>레코드 삭제</h1>

	<%
	
	request.setCharacterEncoding("UTF-8"); // 요청의 인코딩을 UTF-8로 설정합니다.
	String id = request.getParameter("key"); // key 매개변수에서 id 값을 가져옵니다.
	StockDao stockDao = new StockDaoImpl(); // StockDaoImpl 객체를 생성합니다.

	int c = stockDao.getCurrentPage(id, 20); // id와 20을 매개변수로하여 현재 페이지를 가져옵니다.

	int delete = stockDao.deleteOneStock(id); // 주어진 id에 해당하는 재고 데이터를 삭제합니다.

	if (delete == 1) {
		//delete를 성공하면
		response.sendRedirect("Stock_list.jsp?page=" + c);
		// 삭제 후 현재 페이지 번호를 포함하여 Stock_list.jsp 페이지로 리다이렉트합니다.
	} else {
		out.println("Failed to delete the record."); // 레코드 삭제 실패 메시지를 출력합니다.
	}
%>

</body>
</html>
