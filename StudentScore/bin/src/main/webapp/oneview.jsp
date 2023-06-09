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
</head>
<body>
	<%
	try {
		// 요청과 응답의 문자 인코딩을 UTF-8로 설정합니다.
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// StudentScoreDao 인터페이스를 구현한 StudentScoreDaoImpl 객체를 생성합니다.
		StudentScoreDao studentScoreDao = new StudentScoreDaoImpl();

		// 요청에서 "key" 매개변수의 값을 가져와서 ckey 변수에 저장합니다.
		String ckey = request.getParameter("key");

		// ckey 변수의 값을 정수로 변환하여 key 변수에 저장합니다.
		int key = Integer.parseInt(ckey);

		// studentScoreDao를 사용하여 key에 해당하는 학생의 성적 정보를 조회하여 studentScore 변수에 저장합니다.
		StudentScore studentScore = studentScoreDao.selectOne(key);
	%>
	<h2>
		[<%=studentScore.getName()%>] 조회 결과
	</h2>
	<!-- studentScore 객체의 getName() 메소드를 사용하여 이름을 출력합니다. -->

	<form method='post' action='AllviewDB.jsp'>
		<!-- 폼을 POST 방식으로 전송하며, action 속성에는 'inputForm1.html' 페이지로 이동하도록 설정함 -->

		<div>
			<p align=left>
				<button onclick="location.href = './AllviewDB.jsp'">뒤로가기</button>
				<!-- '뒤로가기'라는 버튼 -->
			</p>
		</div>
		<!-- '뒤로가기'라는 버튼 -->
		<table cellspacing="0" cellpadding="1" width=100% border=1
			align=center>
				<!-- 테이블 속성 설정: 셀과 셀 사이의 간격은 0, 셀의 여백은 1, 테이블의 너비는 100%, 테두리는 1, 가운데 정렬 -->

				<tr>
					<td align=center>순번</td>
					<td align=center>이름</td>
					<td align=center>학번</td>
					<td align=center>국어</td>
					<td align=center>영어</td>
					<td align=center>수학</td>
					<td align=center>합계</td>
					<td align=center>평균</td>
					<td align=center>순위</td>
				</tr>
				<!-- 테이블 헤더: 순번, 이름, 학번, 국어, 영어, 수학, 합계, 평균, 순위 -->

				<tr>
					<td align=center><%=studentScore.getId()%></td>
					<td align=center><%=studentScore.getName()%></td>
					<td align=center><%=studentScore.getStudentid()%></td>
					<td align=center><%=studentScore.getKor()%></td>
					<td align=center><%=studentScore.getEng()%></td>
					<td align=center><%=studentScore.getMat()%></td>
					<td align=center><%=studentScore.getSum()%></td>
					<td align=center><%=studentScore.getAvg()%></td>
					<td align=center><%=studentScore.getRanking()%></td>
				</tr>
				<!-- 테이블 데이터: 학생의 순번, 이름, 학번, 국어 점수, 영어 점수, 수학 점수, 합계, 평균, 순위 -->
			</table>

			<%
			} catch (Exception e) {
			e.printStackTrace();//오류 출력
			}
			%>
		
</body>
</html>
