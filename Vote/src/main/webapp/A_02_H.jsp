<%@page import="kr.ac.kopo.ctc.kopo31.dao.VoteDaoImpl"%>
<%@page import="kr.ac.kopo.ctc.kopo31.dao.VoteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<title>후보등록 A_02_H.jsp</title>
</head>
<body>
	<%
	try {
		request.setCharacterEncoding("UTF-8"); // 요청의 문자 인코딩 설정
		int kiho = Integer.parseInt(request.getParameter("kiho")); // 파라미터에서 'kiho' 값을 가져와 정수로 변환

		VoteDao voteDao = new VoteDaoImpl(); // VoteDaoImpl 객체 생성
		voteDao.deleteHubo(kiho); // 해당 투표 기호에 해당하는 후보 삭제

	} catch (Exception e) {
		out.println(e); // 예외 발생 시 예외 정보 출력
	}
	%>

	<table cellspacing="0" cellpadding="1" width=100% border=1 align=center>
		<tr>
			<td width=100 bgcolor="#00FFFF"><a href="A_01_H.jsp">후보등록</a></td>
			<!-- 후보등록 페이지로 이동하는 링크 -->
			<td width=100><a href="B_01_H.jsp">투표</a></td>
			<!-- 투표 페이지로 이동하는 링크 -->
			<td width=100><a href="C_01_H.jsp">개표결과</a></td>
			<!-- 개표결과 페이지로 이동하는 링크 -->
		</tr>
	</table>
	<h1>후보등록 삭제</h1>
	<br>
	<h1>후보등록 삭제 완료</h1>
	<!-- 후보등록 삭제 완료 메시지 출력 -->

</body>
</html>