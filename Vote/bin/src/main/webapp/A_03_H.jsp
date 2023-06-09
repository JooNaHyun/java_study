<%@page import="kr.ac.kopo.ctc.kopo31.dao.VoteDaoImpl"%>
<%@page import="kr.ac.kopo.ctc.kopo31.dao.VoteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
<head>
<title>후보등록 A_03_H.jsp</title>
</head>
<body>
	<%
	try {
		request.setCharacterEncoding("UTF-8"); // 요청의 인코딩을 UTF-8로 설정
		String name = request.getParameter("name"); // 요청 매개변수에서 "name" 값을 가져옴

		VoteDao voteDao = new VoteDaoImpl(); // VoteDaoImpl 객체 생성

		int a = voteDao.insertIntoHubo(name); // 후보 등록을 위해 VoteDao의 insertIntoHubo 메서드 호출

	} catch (Exception e) {
		out.println(e); // 예외 발생 시 예외 메시지 출력
	}
	%>

	<table cellspacing="0" cellpadding="1" width=100% border=1 align=center>
		<!-- 테이블 속성 설정 -->
		<tr>
			<!-- 행 시작 -->
			<td width=100 bgcolor="#00FFFF"><a href="A_01_H.jsp">후보등록</a></td>
			<!-- 첫 번째 셀 -->
			<td width=100><a href="B_01_H.jsp">투표</a></td>
			<!-- 두 번째 셀 -->
			<td width=100><a href="C_01_H.jsp">개표결과</a></td>
			<!-- 세 번째 셀 -->
		</tr>
		<!-- 행 종료 -->
	</table>

	<h1>후보등록 추가</h1>
	<!-- 제목 출력 -->

	<br>
	<!-- 줄바꿈 -->

	<h1>후보등록 추가 완료되었습니다.</h1>
	<!-- 메시지 출력 -->

</body>
</html>