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
		request.setCharacterEncoding("UTF-8");
		int kiho = Integer.parseInt(request.getParameter("kiho"));

		VoteDao voteDao = new VoteDaoImpl();
		voteDao.deleteHubo(kiho);

	} catch (Exception e) {
		out.println(e);
	}
	%>

	<table cellspacing=3 width=600 border=1>
		<tr>
			<td width=100 bgcolor="#00FFFF"><a href="A_01_H.jsp">후보등록</a></td>
			<td width=100><a href="B_01_H.jsp">투표</a></td>
			<td width=100><a href="C_01_H.jsp">개표결과</a></td>
		</tr>
	</table>
	<h1>후보등록 삭제</h1>
	<br>
	<h1>후보등록 삭제 완료</h1>
</body>
</html>