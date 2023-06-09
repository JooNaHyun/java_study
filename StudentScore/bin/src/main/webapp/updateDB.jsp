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
	<h1>레코드 수정</h1>
	<!-- 웹 페이지의 제목을 나타내는 제목 태그 -->

	<%
	String name = ""; // 문자열 변수 선언 및 초기화
	int studentid = 0; // 문자열 변수 선언 및 초기화
	int kor = 0; // 문자열 변수 선언 및 초기화
	int eng = 0; // 문자열 변수 선언 및 초기화
	int mat = 0; // 문자열 변수 선언 및 초기화

	try {
		request.setCharacterEncoding("UTF-8");
		// 요청의 문자 인코딩을 UTF-8로 설정

		name = request.getParameter("name");
		// "name" 파라미터의 값을 name 변수에 저장

		studentid = Integer.parseInt(request.getParameter("studentid"));
		// "studentid" 파라미터의 값을 정수로 변환하여 studentid 변수에 저장

		kor = Integer.parseInt(request.getParameter("korean"));
		// "korean" 파라미터의 값을 정수로 변환하여 kor 변수에 저장

		eng = Integer.parseInt(request.getParameter("english"));
		// "english" 파라미터의 값을 정수로 변환하여 eng 변수에 저장

		mat = Integer.parseInt(request.getParameter("mathmatic"));
		// "mathmatic" 파라미터의 값을 정수로 변환하여 mat 변수에 저장
	} catch (Exception e) {
		out.println(e);
		// 예외가 발생한 경우, 예외 메시지를 출력
	}

	StudentScoreDao studentScoreDao = new StudentScoreDaoImpl();
	// StudentScoreDao 인터페이스를 구현한 StudentScoreDaoImpl 객체 생성
	StudentScore studentScore = new StudentScore();
	// StudentScore 객체 생성

	studentScore.setName(name);
	// studentScore 객체의 이름을 name 변수의 값으로 설정

	studentScore.setStudentid(studentid);
	// studentScore 객체의 학번을 studentid 변수의 값으로 설정

	studentScore.setKor(kor);
	// studentScore 객체의 국어 점수를 kor 변수의 값으로 설정

	studentScore.setEng(eng);
	// studentScore 객체의 영어 점수를 eng 변수의 값으로 설정

	studentScore.setMat(mat);
	// studentScore 객체의 수학 점수를 mat 변수의 값으로 설정

	studentScoreDao.update(studentid, studentScore);
	// studentid와 studentScore 객체를 사용하여 studentScoreDao의 update 메서드를 호출하여 업데이트 수행

	int pagenum = 1;
	// 페이지 번호를 1로 초기화

	int countperpage = 10;
	// 페이지당 데이터 개수를 10으로 초기화

	try {
		pagenum = Integer.parseInt(request.getParameter("page"));
		// "page" 파라미터의 값을 정수로 변환하여 pagenum 변수에 저장

		if (pagenum <= 0) {
			// 만약 pagenum이 0 이하인 경우
			pagenum = 1;
			// pagenum에 1을 할당
		}
	} catch (Exception e) {
	}

	try {
		countperpage = Integer.parseInt(request.getParameter("countperpage"));
		// "countperpage" 파라미터의 값을 정수로 변환하여 countperpage 변수에 저장

		if (countperpage <= 0) {
			// 만약 countperpage가 0 이하인 경우
			countperpage = 10;
			// countperpage에 10을 할당
		}
	} catch (Exception e) {
	}

	StudentScoreService studentScoreService = new StudentScoreServiceImpl();
	// StudentScoreService 인터페이스를 구현한 StudentScoreServiceImpl 객체 생성

	pagination pagination = studentScoreService.getPagination(pagenum, countperpage);
	// studentScoreService의 getPagination 메서드를 호출하여 페이지네이션 정보를 가져옴
	// pagenum과 countperpage를 인자로 전달하여 페이지네이션 객체를 생성

	int c = pagination.getC();
	// 페이지네이션 객체의 getC 메서드를 호출하여 전체 데이터 개수를 가져와 c 변수에 저장

	int s = pagination.getS();
	// 페이지네이션 객체의 getS 메서드를 호출하여 현재 페이지 시작 인덱스를 가져와 s 변수에 저장

	int e = pagination.getE();
	// 페이지네이션 객체의 getE 메서드를 호출하여 현재 페이지 끝 인덱스를 가져와 e 변수에 저장

	int p = pagination.getP();
	// 페이지네이션 객체의 getP 메서드를 호출하여 현재 페이지 번호를 가져와 p 변수에 저장

	int pp = pagination.getPp();
	// 페이지네이션 객체의 getPp 메서드를 호출하여 이전 페이지 번호를 가져와 pp 변수에 저장

	int n = pagination.getN();
	// 페이지네이션 객체의 getN 메서드를 호출하여 다음 페이지 번호를 가져와 n 변수에 저장

	int nn = pagination.getNn();
	// 페이지네이션 객체의 getNn 메서드를 호출하여 마지막 페이지 번호를 가져와 nn 변수에 저장
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
		StudentScoreDao studentScoreDao1 = new StudentScoreDaoImpl();
		// StudentScoreDao 인터페이스를 구현한 StudentScoreDaoImpl 객체 생성

		int currentPage = studentScoreDao1.getCurrentPage(studentid, countperpage);
		// studentScoreDao1의 getCurrentPage 메서드를 호출하여 현재 페이지 번호를 가져옴
		// studentid와 countperpage를 인자로 전달하여 현재 페이지 번호를 계산

		List<StudentScore> studentScores2 = studentScoreDao1.selectAll(currentPage, countperpage);
		// studentScoreDao1의 selectAll 메서드를 호출하여 현재 페이지에 해당하는 학생 점수 리스트를 가져옴
		// currentPage와 countperpage를 인자로 전달하여 해당 페이지의 데이터를 조회

		for (int i = 0; i < studentScores2.size(); i++) {
			StudentScore studentScore1 = studentScores2.get(i);
			// 학생 점수 리스트에서 현재 반복 중인 학생 점수를 가져옴

			if (studentScore1.getStudentid() == studentid) {
				out.println("<tr bgcolor='#ffff00'>");
				// 현재 반복 중인 학생의 학번이 사용자가 선택한 학번과 일치하는 경우
				// 배경색을 노란색으로 설정하여 강조합니다.
				out.println("<td align=center>" + studentScore1.getId() + "</td>");
				// 학생 점수의 ID를 출력합니다.

				out.println("<td align=center>" + studentScore1.getName() + "</td>");
				// 학생 점수의 이름을 출력합니다.

				out.println("<td align=center><a href='oneview.jsp?key=" + studentScore1.getStudentid() + "'>"
				+ studentScore1.getStudentid() + "</a></p></td>");
				// 학생 점수의 학번을 링크로 출력합니다. 링크를 클릭하면 oneview.jsp로 이동합니다.

				out.println("<td align=center>" + studentScore1.getKor() + "</td>");
				// 학생 점수의 국어 점수를 출력합니다.

				out.println("<td align=center>" + studentScore1.getEng() + "</td>");
				// 학생 점수의 영어 점수를 출력합니다.

				out.println("<td align=center>" + studentScore1.getMat() + "</td>");
				// 학생 점수의 수학 점수를 출력합니다.

				out.println("<td align=center>" + studentScore1.getSum() + "</td>");
				// 학생 점수의 총점을 출력합니다.

				out.println("<td align=center>" + studentScore1.getAvg() + "</td>");
				// 학생 점수의 평균을 출력합니다.

				out.println("<td align=center>" + studentScore1.getRanking() + "</td>");
				// 학생 점수의 순위를 출력합니다.

				out.println("</tr>");
				// 행을 닫습니다.

			} else {
				out.println("<tr>");
				// 그 외의 경우 일반적인 행을 출력합니다.
			}

			out.println("<td align=center>" + studentScore1.getId() + "</td>");
			// 학생 점수의 ID 값을 출력합니다.

			out.println("<td align=center>" + studentScore1.getName() + "</td>");
			// 학생 점수의 이름을 출력합니다.

			out.println("<td align=center><a href='oneview.jsp?key=" + studentScore1.getStudentid() + "'>"
			+ studentScore1.getStudentid() + "</a></p></td>");
			// 학생 점수의 학번을 링크로 출력합니다. 링크를 클릭하면 oneview.jsp로 이동합니다.

			out.println("<td align=center>" + studentScore1.getKor() + "</td>");
			// 학생 점수의 국어 점수를 출력합니다.

			out.println("<td align=center>" + studentScore1.getEng() + "</td>");
			// 학생 점수의 영어 점수를 출력합니다.

			out.println("<td align=center>" + studentScore1.getMat() + "</td>");
			// 학생 점수의 수학 점수를 출력합니다.

			out.println("<td align=center>" + studentScore1.getSum() + "</td>");
			// 학생 점수의 총점을 출력합니다.

			out.println("<td align=center>" + studentScore1.getAvg() + "</td>");
			// 학생 점수의 평균을 출력합니다.

			out.println("<td align=center>" + studentScore1.getRanking() + "</td>");
			// 학생 점수의 순위를 출력합니다.

			out.println("</tr>");
			// 행을 닫습니다.
		}

		out.println("</table>");
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
