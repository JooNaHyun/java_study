<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- 문자 인코딩을 UTF-8로 설정한다. -->
<%@ page contentType="text/html; charset=utf-8"%>
<!-- 페이지의 콘텐츠 유형을 HTML이며, 문자 인코딩을 UTF-8로 설정한다. -->
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="kr.ac.kopo.ctc.kopo31.dao.StudentScoreDao"%>
<%@ page import="kr.ac.kopo.ctc.kopo31.dao.StudentScoreDaoImpl"%>
<%@ page import="kr.ac.kopo.ctc.kopo31.service.StudentScoreService"%>
<%@ page import="kr.ac.kopo.ctc.kopo31.service.StudentScoreServiceImpl"%>
<!-- Java의 SQL, JDBC, I/O 라이브러리를 가져온다. -->
<html>
<head>
</head>
<body>
	<%
	StudentScoreDao studentScoreDao = new StudentScoreDaoImpl();
	//StudentScoreDao 인터페이스를 구현한 StudentScoreDaoImpl 객체를 생성합니다.

	String insert = studentScoreDao.insertAll(500);
	//StudentScoreDaoImpl 객체의 insertAll 메서드를 호출하여 500개의 데이터를 삽입합니다.

	out.println(insert);
	//삽입 작업의 결과를 출력합니다.
	%>
</body>
</html>
