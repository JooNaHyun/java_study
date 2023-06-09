<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- 문자 인코딩을 UTF-8로 설정한다. -->
<%@ page contentType="text/html; charset=utf-8"%>
<!-- 페이지의 콘텐츠 유형을 HTML이며, 문자 인코딩을 UTF-8로 설정한다. -->
<%@ page import="kr.ac.kopo.ctc.kopo31.dao.StudentScoreDao"%>
<%@ page import="kr.ac.kopo.ctc.kopo31.dao.StudentScoreDaoImpl"%>
<%@ page import="kr.ac.kopo.ctc.kopo31.service.StudentScoreService"%>
<%@ page import="kr.ac.kopo.ctc.kopo31.service.StudentScoreServiceImpl"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<!-- Java의 SQL, JDBC, I/O 라이브러리를 가져온다. -->
<html>
<head>
</head>
<body>
	<%
	StudentScoreDao studentScoreDao = new StudentScoreDaoImpl(); // StudentScoreDao 인터페이스를 구현한 StudentScoreDaoImpl 객체를 생성합니다.
	String create = studentScoreDao.maketable(); // studentScoreDao 객체의 maketable() 메소드를 호출하여 테이블 생성 SQL문을 반환받습니다.
	out.println(create); // 반환된 SQL문을 출력합니다.
	%>
</body>
</html>
