<%@page import="kr.ac.kopo.ctc.kopo31.domain.Vote"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.ctc.kopo31.dao.VoteDaoImpl"%>
<%@page import="kr.ac.kopo.ctc.kopo31.dao.VoteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>개표결과 C_01_H.jsp</title>
</head>
<table cellspacing="0" cellpadding="1" width=100% border=1 align=center>
	<tr>
		<td width=100><a href="A_01_H.jsp">후보등록</a></td>
		<!-- 후보등록 페이지로 이동하는 링크 -->
		<td width=100><a href="B_01_H.jsp">투표</a></td>
		<!-- 투표 페이지로 이동하는 링크 -->
		<td width=100 bgcolor="pink"><a href="C_01_H.jsp">개표결과</a></td>
		<!-- 현재 페이지(개표결과 페이지) -->
	<tr>
</table>

<%
VoteDao voteDao = new VoteDaoImpl(); // VoteDaoImpl 클래스의 인스턴스를 생성합니다. VoteDao 인터페이스를 구현한 클래스입니다.
List<Vote> votes = voteDao.selectAll(); // VoteDaoImpl 인스턴스를 사용하여 데이터베이스에서 모든 투표를 가져와 리스트에 저장합니다.

if (votes.size() == 0) { // 투표 리스트의 크기가 0인지 확인합니다.
	out.println("<h1>개표결과가 없습니다.</h1>"); // 만약 투표가 없다면, 결과가 없음을 나타내는 메시지를 출력합니다.
} else {
%>
<h1>후보별 득표 결과</h1>
<!--후보별 득표 결과를 나타내는 제목을 출력합니다. -->
<table cellspacing="0" cellpadding="1" width=100% border=1 align=center>
	<!--테이블 태그를 출력하고 속성을 설정 -->
	<tr>
		<td width=75><p align=center>이름</p></td>
		<!--이름을 표시하는 셀을 출력 -->
		<td width=500><p align=center>인기도</p></td>
		<!--인기도를 표시하는 셀을 출력 -->
	</tr>
	<%
	int totalCount = voteDao.countAll(); // 모든 투표의 총 개수를 가져옵니다.

	for (int i = 0; i < votes.size(); i++) { // 투표 리스트의 각 항목에 대해 반복합니다.
		Vote vote1 = votes.get(i); // 현재 순번의 투표를 가져옵니다.

		int kihoCount = voteDao.countVotes(vote1.getKiho()); // 해당 후보의 득표 수를 가져옵니다.
		int voteRate = (int) ((double) kihoCount / totalCount * 100); // 해당 후보의 득표율을 계산합니다.

		int barLength = (int) (voteRate * 6); // 득표율에 맞는 막대 길이를 계산합니다.

		out.println("<tr>"); // 행을 시작합니다.
		out.println("<td width=75><a href='C_02_H.jsp?key=" + vote1.getKiho() + "&name=" + vote1.getName()
		+ "'><p align=center>" + vote1.getKiho() + "번 " + vote1.getName() + "</p></a></td>"); // 후보의 번호와 이름에 링크를 추가하여 출력합니다.
		out.println("<td width=500>"); // 인기도 셀을 시작합니다.
		out.println("<div>"); // div 태그를 시작합니다.
		out.println("<span><img src='bar.jpg' style='width: " + barLength
		+ "px; height: 20px; display: inline-block;'></span>"); // 득표율에 맞는 막대를 출력합니다.
		out.println("<span>" + kihoCount + "명 (" + voteRate + "%)</span>"); // 득표수와 득표율을 출력합니다.
		out.println("</div>"); // div 태그를 마칩니다.
		out.println("</td>"); // 인기도 셀을 마칩니다.
		out.println("</tr>"); // 행을 마칩니다.
	}
	%>
</table>
<%
}
%>
</body>
</html>
