<%@page import="dto.pagination"%>
<%@page import="kr.ac.kopo.ctc.kopo31.service.StudentScoreServiceImpl"%>
<%@page import="kr.ac.kopo.ctc.kopo31.service.StudentScoreService"%>
<%@page import="kr.ac.kopo.ctc.kopo31.domain.StudentScore"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.ctc.kopo31.dao.StudentScoreDaoImpl"%>
<%@page import="kr.ac.kopo.ctc.kopo31.dao.StudentScoreDao"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- 문자 인코딩을 UTF-8로 설정한다. -->
<%@ page contentType="text/html; charset=utf-8"%>
<!-- 페이지의 콘텐츠 유형을 HTML이며, 문자 인코딩을 UTF-8로 설정한다. -->
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<!-- Java의 SQL, JDBC, I/O 라이브러리를 가져온다. -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>

	<%
	//rget 객체를 생성한다.
	try {
		request.setCharacterEncoding("UTF-8");
		// 요청(request)의 문자 인코딩을 UTF-8로 설정한다.

		response.setCharacterEncoding("UTF-8");
		// 응답(response)의 문자 인코딩을 UTF-8로 설정한다.

		out.println("<h1>조회</h1>");
		int pagenum = 1; // from값(table의 첫번째 값)선언 및 초기화
		int countperpage = 10; // cnt값(table의 나와야할 데이터 개수)선언 및 초기화

		try {
			pagenum = Integer.parseInt(request.getParameter("page"));
			// 전달받은 파라미터 값을 "from"에 할당
			if (pagenum <= 0) {//만약 전달받은 값이 0이거나 0보다 작으면
		pagenum = 1;//from에 1할당
			}
		} catch (Exception e) {
		}
		try {
			countperpage = Integer.parseInt(request.getParameter("countperpage"));
			// 전달받은 파라미터 값을 "cnt"에 할당  
			if (countperpage <= 0) {//만약 전달받은 값이 0이거나 0보다 작으면
		countperpage = 10;//cnt에 10할당
			}
		} catch (Exception e) {
		}

		StudentScoreDao studentScoreDao = new StudentScoreDaoImpl();
		// StudentScoreDao 인터페이스를 구현한 StudentScoreDaoImpl 객체를 생성한다.
		int totalcount = studentScoreDao.count();
		// 데이터베이스에서 전체 데이터의 개수를 가져온다.
		List<StudentScore> studentScores = studentScoreDao.selectAll(pagenum, countperpage);
		// 지정한 페이지 번호와 페이지당 개수를 기준으로 데이터베이스에서 데이터를 조회한다.
		StudentScoreService studentScoreService = new StudentScoreServiceImpl();
		// StudentScoreService 인터페이스를 구현한 StudentScoreServiceImpl 객체를 생성한다.
		pagination pagination = studentScoreService.getPagination(pagenum, countperpage);
		// 지정한 페이지 번호와 페이지당 개수를 기준으로 페이지네이션 정보를 생성한다.

		int c = pagination.getC();
		// 현재 페이지 번호를 가져온다.
		int s = pagination.getS();
		// 시작 페이지 번호를 가져온다.
		int e = pagination.getE();
		// 끝 페이지 번호를 가져온다.
		int p = pagination.getP();
		// 이전 페이지 번호를 가져온다.
		int pp = pagination.getPp();
		// 이전 블록의 시작 페이지 번호를 가져온다.
		int n = pagination.getN();
		// 다음 페이지 번호를 가져온다.
		int nn = pagination.getNn();
		// 다음 블록의 시작 페이지 번호를 가져온다.
	%>
	<%
	if (studentScores != null && !studentScores.isEmpty()) {
		// studentScores가 null이 아니고 비어있지 않을 때 실행된다.
		// studentScores에 데이터가 존재하는 경우를 확인한다.
		// 즉, 조회된 학생 데이터가 존재하는 경우를 의미한다.
		// 이 경우에만 아래의 테이블을 출력하는 코드 블록이 실행된다.
		// studentScores가 null이거나 비어있을 경우 테이블을 출력하지 않는다.
		// 데이터가 존재하지 않을 때는 빈 테이블이 출력되지 않도록 한다.
		// 이 조건문을 통해 데이터의 존재 여부를 확인하고, 데이터가 있을 때만 테이블을 출력할 수 있다.
	%>
	<table cellspacing="0" cellpadding="1" width=100% border=1 align=center>
		<!--테이블 생성-->
		<tr>
			<!--테이블 헤더 행-->
			<td align=center>번호</td>
			<td align=center>이름</td>
			<!--'이름' 열 제목-->
			<td align=center>학번</td>
			<!--'학번' 열 제목-->
			<td align=center>국어</td>
			<!--'국어' 열 제목-->
			<td align=center>영어</td>
			<!--'영어' 열 제목-->
			<td align=center>수학</td>
			<!--'수학' 열 제목-->
			<td align=center>합계</td>
			<!--'국어' 열 제목-->
			<td align=center>평균</td>
			<!--'영어' 열 제목-->
			<td align=center>순위</td>
			<!--'순위' 열 제목-->
		</tr>
		<!--테이블 닫기-->
		<%
		}
		%>
		<%
		for (int i = 0; i < studentScores.size(); i++) {
			// studentScores 리스트의 크기만큼 반복하며 학생 데이터를 가져온다.
			StudentScore studentScore = studentScores.get(i);

			out.println("<tr>");
			// 테이블의 한 행을 출력한다.
			out.println("<td align=center>" + studentScore.getId() + "</td>"); // 번호
			out.println("<td align=center>" + studentScore.getName() + "</td>"); // 이름
			out.println("<td align=center><a href='oneview.jsp?key=" + studentScore.getStudentid() + "'>"
			+ studentScore.getStudentid() + "</a></p></td>"); // 학번 (링크 포함)
			out.println("<td align=center>" + studentScore.getKor() + "</td>"); // 국어 점수
			out.println("<td align=center>" + studentScore.getEng() + "</td>"); // 영어 점수
			out.println("<td align=center>" + studentScore.getMat() + "</td>"); // 수학 점수
			out.println("<td align=center>" + studentScore.getSum() + "</td>"); // 합계 점수
			out.println("<td align=center>" + studentScore.getAvg() + "</td>"); // 평균 점수
			out.println("<td align=center>" + studentScore.getRanking() + "</td>"); // 순위
			out.println("</tr>");
		}

		out.println("</table>");
		%>


		<div style="text-align: center; font-weight: bold; font-size: 20pt;">
			<%
			if (10 < c) {
			%>
			<!-- 만약 현재 페이지 번호(c)가 10보다 큰 경우 -->
			<a href="AllviewDB.jsp?page=<%=pp%>" style="color: black"><<</a>
			<!-- 이전 페이지 블록으로 이동하는 링크 (<<) -->
			<a href="AllviewDB.jsp?page=<%=p%>" style="color: black"><</a>
			<!-- 이전 페이지로 이동하는 링크 (<) -->
			<%
			}
			%>

			<%
			for (int i = s; i <= e; i++) {
			%>
			<!-- 페이지 번호 반복문 -->
			<%
			if (i == c) {
			%>
			<!-- 만약 현재 반복 중인 페이지 번호(i)와 현재 페이지 번호(c)가 일치하는 경우 -->
			<a style="color: red;" href="AllviewDB.jsp?page=<%=i%>"
				style="color:black"><%=i%></a>
			<!-- 현재 페이지 번호 (빨간색) -->
			<%
			} else {
			%>
			<!-- 그렇지 않은 경우 -->
			<a href="AllviewDB.jsp?page=<%=i%>" style="color: blue;"><%=i%></a>
			<!-- 페이지 번호 (파란색) -->
			<%
			}
			%>
			<%
			}
			%>

			<%
			if (nn != -1) {
			%>
			<!-- 만약 nn 값이 -1이 아닌 경우 -->
			<a href="AllviewDB.jsp?page=<%=n%>" style="color: black">></a>
			<!-- 다음 페이지로 이동하는 링크 (>) -->
			<a href="AllviewDB.jsp?page=<%=nn%>" style="color: black">>></a>
			<!-- 다음 페이지로 이동하는 링크 (>>) -->
			<%
			}
			%>
		</div>


		<%
		} catch (Exception e) {
		out.println(e); // 에러를 출력합니다.
		}
		%>
	
</body>
</html>
