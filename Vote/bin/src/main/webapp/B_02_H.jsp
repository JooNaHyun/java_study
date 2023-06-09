<%@page import="kr.ac.kopo.ctc.kopo31.dao.VoteDaoImpl"%>
<%@page import="kr.ac.kopo.ctc.kopo31.dao.VoteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<title>투표 B_02_H.jsp</title>
</head>
<%
try {
	request.setCharacterEncoding("UTF-8"); // 요청의 문자 인코딩을 UTF-8로 설정
	int kiho = Integer.parseInt(request.getParameter("kiho")); // kiho 파라미터 가져오기
	int age = Integer.parseInt(request.getParameter("age")); // age 파라미터 가져오기
	VoteDao voteDao = new VoteDaoImpl(); // VoteDao 객체 생성
	voteDao.insertIntoTupyo(kiho, age); // 투표 정보를 데이터베이스에 저장

} catch (Exception e) {
	out.println(e); // 예외 발생 시 예외 정보 출력
}
%>
<body>
	<table cellspacing="0" cellpadding="1" width=100% border=1 align=center>
		<tr>
			<td width=100><a href="A_01_H.jsp">후보등록</a></td>
			<!-- 후보등록 페이지로 이동하는 링크 -->
			<td width=100 bgcolor="#00FFFF"><a href="B_01_H.jsp">투표</a></td>
			<!-- 현재 페이지(투표 페이지) -->
			<td width=100><a href="C_01_H.jsp">개표결과</a></td>
			<!-- 개표결과 페이지로 이동하는 링크 -->
		</tr>
	</table>
	<h1>투표 결과</h1>
	<!-- 페이지 제목 -->
	<br>
	<h1>투표되었습니다.</h1>
	<!-- 투표 완료 메시지 -->
</body>

</html>