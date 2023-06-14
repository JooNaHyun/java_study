
<%@page import="dao.GongjiDaoImpl2"%>
<%@page import="dao.GongjiDao2"%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!--컨텐츠 타입 및 캐릭터셋, 언어 지정-->
<%@ page import="java.sql.*"%>
<!--구동에 필요한 라이브러리 임포트-->

<html>
<!--html 작성 시작-->
<body>
	<!--본문 작성 시작-->
	<h1>테이블 생성 및 데이터 입력</h1>
	<!--페이지 제목 출력-->
	<br>
	<!--줄바꿈-->
	<%
	GongjiDao2 gongjiProgramDao = new GongjiDaoImpl2();
	// GongjiDaoImpl 객체를 생성합니다.
	int create = gongjiProgramDao.makeData();
	// 데이터베이스에서 테이블을 생성하는 makeData() 메서드를 호출하여 결과를 create 변수에 저장합니다.
	out.println(create);
	// create 변수의 값을 출력합니다.
	%>
	
</body>
<!--본문 작성 끝-->
</html>
<!--html 작성 끝-->