<%@page import="java.util.List"%>
<%@page import="dto.pagination"%>
<%@page import="kr.ac.kopo.ctc.kopo31.service.StudentScoreServiceImpl"%>
<%@page import="kr.ac.kopo.ctc.kopo31.service.StudentScoreService"%>
<%@page import="kr.ac.kopo.ctc.kopo31.domain.StudentScore"%>
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
</head>
<body>
	<h1>레코드 삭제</h1>

	<%
	String name = ""; // 이름을 저장할 문자열 변수를 선언하고 초기값으로 빈 문자열을 할당합니다.
	int studentid = 0; // 학생 ID를 저장할 정수 변수를 선언하고 초기값으로 0을 할당합니다.
	int kor = 0; // 국어 점수를 저장할 정수 변수를 선언하고 초기값으로 0을 할당합니다.
	int eng = 0; // 영어 점수를 저장할 정수 변수를 선언하고 초기값으로 0을 할당합니다.
	int mat = 0; // 수학 점수를 저장할 정수 변수를 선언하고 초기값으로 0을 할당합니다.

	try {
		request.setCharacterEncoding("UTF-8");
		// POST 방식으로 전달된 데이터의 인코딩을 UTF-8로 설정합니다.
		// 이는 한글이나 특수 문자와 같은 유니코드 문자를 올바르게 처리하기 위한 설정입니다.
		name = request.getParameter("name");
		// request 객체에서 "name" 파라미터 값을 가져와 name 변수에 할당합니다.
		studentid = Integer.parseInt(request.getParameter("studentid"));
		// request 객체에서 "studentid" 파라미터 값을 가져와 정수로 변환한 후 studentid 변수에 할당합니다.
		kor = Integer.parseInt(request.getParameter("korean"));
		// request 객체에서 "korean" 파라미터 값을 가져와 정수로 변환한 후 kor 변수에 할당합니다.
		eng = Integer.parseInt(request.getParameter("english"));
		// request 객체에서 "english" 파라미터 값을 가져와 정수로 변환한 후 eng 변수에 할당합니다.
		mat = Integer.parseInt(request.getParameter("mathmatic"));
		// request 객체에서 "mathmatic" 파라미터 값을 가져와 정수로 변환한 후 mat 변수에 할당합니다.
	} catch (Exception e) {
		out.println(e);
		// 예외가 발생한 경우 해당 예외를 출력합니다.
	}

	StudentScoreDao studentScoreDao = new StudentScoreDaoImpl();
	// StudentScoreDao 인터페이스를 구현한 StudentScoreDaoImpl 객체를 생성합니다.

	StudentScore studentScore = new StudentScore();
	// StudentScore 객체를 생성합니다.

	int pagenum = 1; // 페이지 번호를 저장할 변수를 선언하고 초기값으로 1을 할당합니다.
	int countperpage = 10; // 페이지당 데이터 개수를 저장할 변수를 선언하고 초기값으로 10을 할당합니다.

	try {
		pagenum = Integer.parseInt(request.getParameter("page"));
		// request 객체에서 "page" 파라미터 값을 가져와 정수로 변환한 후 pagenum 변수에 할당합니다.
		// 페이지 번호를 설정하는 파라미터입니다.
		if (pagenum <= 0) {
			// 전달받은 페이지 번호가 0 이하인 경우
			pagenum = 1; // pagenum 변수에 1을 할당하여 유효한 값으로 설정합니다.
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
	%>
	<table cellspacing="0" cellpadding="1" width=100% border=1 align=center>
		<!-- 테이블 속성 설정 -->
		<tr>
			<!-- 첫 번째 행 -->
			<td align=center>번호</td>
			<td align=center>이름</td>
			<!-- 첫 번째 열: 이름 -->
			<td align=center>학번</td>
			<!-- 두 번째 열: 학번 -->
			<td align=center>국어</td>
			<!-- 세 번째 열: 국어 -->
			<td align=center>영어</td>
			<!-- 네 번째 열: 영어 -->
			<td align=center>수학</td>
			<!-- 다섯 번째 열: 수학 -->
			<td align=center>합계</td>
			<!--'합계' 열 제목-->
			<td align=center>평균</td>
			<!--'평균' 열 제목-->
			<td align=center>순위</td>
			<!--'순위' 열 제목-->
		</tr>
		<!-- 첫 번째 행 종료 -->
		<%
		pagenum = studentScoreDao.getCurrentPage(studentid, countperpage);
		// 현재 페이지 번호를 학생 ID와 페이지당 데이터 개수를 기반으로 가져옵니다.

		studentScoreDao.deleteByStudentId(studentid);
		// 주어진 학생 ID에 해당하는 학생 데이터를 삭제합니다.

		List<StudentScore> studentScores = studentScoreDao.selectAll(pagenum, countperpage);
		// 현재 페이지에 해당하는 학생 데이터를 가져옵니다.

		StudentScoreService studentScoreService = new StudentScoreServiceImpl();
		// StudentScoreService 인터페이스를 구현한 StudentScoreServiceImpl 객체를 생성합니다.

		pagination pagination = studentScoreService.getPagination(pagenum, countperpage);
		// 페이지 번호와 페이지당 데이터 개수를 기반으로 페이지네이션 정보를 가져옵니다.

		int c = pagination.getC();
		// 현재 페이지 번호를 가져옵니다.

		int s = pagination.getS();
		// 시작 페이지 번호를 가져옵니다.

		int e = pagination.getE();
		// 종료 페이지 번호를 가져옵니다.

		int p = pagination.getP();
		// 이전 페이지 번호를 가져옵니다.

		int pp = pagination.getPp();
		// 이전 페이지 블록의 마지막 페이지 번호를 가져옵니다.

		int n = pagination.getN();
		// 다음 페이지 번호를 가져옵니다.

		int nn = pagination.getNn();
		// 다음 페이지 블록의 첫 페이지 번호를 가져옵니다.

		for (int i = 0; i < studentScores.size(); i++) {
			StudentScore studentScore1 = studentScores.get(i);
			// 현재 반복 중인 학생의 데이터를 가져옵니다.

			out.println("<tr>");
			// 테이블의 새로운 행을 시작합니다.

			// 학생 데이터를 각 열에 출력합니다.
			// 현재 반복 중인 학생의 학번이 사용자가 선택한 학번과 일치하는 경우 배경색을 노란색으로 설정하여 강조합니다.
			out.println("<td align=center>" + studentScore1.getId() + "</td>");
			out.println("<td align=center>" + studentScore1.getName() + "</td>");
			out.println("<td align=center><a href='oneview.jsp?key=" + studentScore1.getStudentid() + "'>"
			+ studentScore1.getStudentid() + "</a></p></td>");
			out.println("<td align=center>" + studentScore1.getKor() + "</td>");
			out.println("<td align=center>" + studentScore1.getEng() + "</td>");
			out.println("<td align=center>" + studentScore1.getMat() + "</td>");
			out.println("<td align=center>" + studentScore1.getSum() + "</td>");
			out.println("<td align=center>" + studentScore1.getAvg() + "</td>");
			out.println("<td align=center>" + studentScore1.getRanking() + "</td>");
			out.println("</tr>");
		}

		out.println("</table>");
		// 테이블의 모든 행과 열을 출력한 후 닫는 태그를 추가합니다.
		%>
		<div style="text-align: center; font-weight: bold; font-size: 20pt;">
			<%
			// 스타일을 설정한 div 태그를 시작합니다.
			%>
			<%
			if (10 < c) {
			%>
			<a href="AllviewDB.jsp?page=<%=pp%>" style="color: black"><<</a> <a
				href="AllviewDB.jsp?page=<%=p%>" style="color: black"><</a>
			<%
			// 현재 페이지 번호가 10보다 큰 경우, 이전 페이지 블록으로 이동하는 링크를 출력합니다.
			%>
			<%
			}
			%>

			<%
			for (int i = s; i <= e; i++) {
			%>
			<%
			if (i == c) {
			%>
			<a style="color: red" href="AllviewDB.jsp?page=<%=i%>"><%=i%></a>
			<%
			// 현재 페이지 번호와 같은 경우, 강조 효과를 주고 링크를 출력합니다.
			%>
			<%
			} else {
			%>
			<a href="AllviewDB.jsp?page=<%=i%>" style="color: blue"><%=i%></a>
			<%
			// 현재 페이지 번호와 다른 경우, 일반 링크를 출력합니다.
			%>
			<%
			}
			%>
			<%
			}
			%>

			<%
			if (nn != -1) {
			%>
			<a href="AllviewDB.jsp?page=<%=n%>" style="color: black">></a> <a
				href="AllviewDB.jsp?page=<%=nn%>" style="color: black">>></a>
			<%
			// 다음 페이지 블록으로 이동하는 링크를 출력합니다.
			%>
			<%
			}
			%>
		</div>
</body>
</html>