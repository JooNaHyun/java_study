<%@page import="service.GongjiServiceImpl"%>
<%@page import="service.GongjiService"%>
<%@page import="domain.Gongji"%>
<%@page import="dao.GongjiDaoImpl"%>
<%@page import="dao.GongjiDao"%>
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
			request.setCharacterEncoding("UTF-8");
			// 요청의 문자 인코딩을 UTF-8로 설정합니다.
			String ckey = request.getParameter("id");
			// request 객체에서 "id" 파라미터 값을 가져옵니다.
			int id = Integer.parseInt(ckey);
			// 가져온 "id" 값을 정수형으로 변환합니다.
			GongjiDao gongjiDao = new GongjiDaoImpl();
			// GongjiDao 인터페이스를 구현한 GongjiDaoImpl 객체를 생성합니다.

			
			int c = gongjiDao.getCurrentPage(id, 10);
			// 주어진 id에 해당하는 레코드의 페이지 번호를 가져옵니다. (페이지당 10개의 항목)
			
			int delete = gongjiDao.deleteOneGongji(id);
			// 주어진 id에 해당하는 레코드를 삭제합니다.

			if (delete == 1) {
		// delete가 1이라면
		response.sendRedirect("gongji_list.jsp?page=" + c);
		// 삭제 후 현재 페이지 번호를 기준으로 gongji_list.jsp 페이지로 리다이렉트합니다.
			} else {
		out.println("Failed to delete the record.");
		// 레코드 삭제 실패 메시지를 출력합니다.
			}
	%>
</body>
</html>
