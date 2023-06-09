<%@page import="kr.ac.kopo.ctc.kopo31.domain.Vote"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.ctc.kopo31.dao.VoteDaoImpl"%>
<%@page import="kr.ac.kopo.ctc.kopo31.dao.VoteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>개표결과 C_02_H.jsp</title>
<!-- 웹 페이지의 제목을 설정합니다. -->
</head>
<table cellspacing="0" cellpadding="1" width=100% border=1 align=center>
	<!-- 테이블 태그를 출력하고 속성을 설정합니다. -->
	<tr>
		<td width=100><a href="A_01_H.jsp">후보등록</a></td>
		<!-- 첫 번째 열에 후보 등록 페이지로 이동하는 링크를 출력합니다. -->
		<td width=100><a href="B_01_H.jsp">투표</a></td>
		<!--두 번째 열에 투표 페이지로 이동하는 링크를 출력합니다.  -->
		<td width=100 bgcolor="#00FFFF"><a href="C_01_H.jsp">개표결과</a></td>
		<!--세 번째 열에 현재 페이지인 개표결과 페이지를 강조하여 출력합니다. -->
	</tr>
</table>

<%
String name = request.getParameter("name"); // name 파라미터 값을 가져와 변수에 저장합니다.
String ckey = request.getParameter("key"); // key 파라미터 값을 가져와 변수에 저장합니다.
%>

<h1>
	[<%=ckey%>번
	<%=name%>] 후보 득표 성향
</h1>
<!-- 제목을 출력하는 부분입니다. ckey와 name 변수를 사용하여 후보 번호와 이름을 출력합니다. -->
<table cellspacing="0" cellpadding="1" width=100% border=1 align=center>
	<!-- 테이블 태그를 출력하고 속성을 설정합니다. -->
	<tr>
		<!-- 첫 번째 행을 시작합니다. -->
		<td width=75><p align=center>연령대</p></td>
		<!-- 첫 번째 열에 "연령대"를 표시하는 셀을 출력합니다. -->
		<td width=500><p align=center>인기도</p></td>
		<!-- 두 번째 열에 "인기도"를 표시하는 셀을 출력합니다. -->
	</tr>
	<!-- 첫 번째 행을 마칩니다. -->

	<%
	int kiho = Integer.parseInt(ckey); // ckey 변수를 정수형으로 변환하여 kiho 변수에 저장합니다.

	VoteDao voteDao = new VoteDaoImpl(); // VoteDao 인터페이스를 구현한 VoteDaoImpl 객체를 생성합니다.

	List<Vote> votes = voteDao.selectOne(kiho); // kiho 값을 기준으로 해당 후보의 득표 정보를 가져와 votes 리스트에 저장합니다.

	int kihoCount = voteDao.countVotes(kiho); // kiho 값을 기준으로 해당 후보의 총 득표수를 가져와 kihoCount 변수에 저장합니다.

	for (int age = 1; age <= 9; age++) { // 연령대를 1부터 9까지 반복합니다.
		int ageCount = 0; // 각 연령대의 득표수를 저장할 ageCount 변수를 초기화합니다.
		for (int i = 0; i < votes.size(); i++) { // 해당 후보의 득표 정보를 하나씩 확인합니다.
			Vote vote1 = votes.get(i); // 현재 확인 중인 득표 정보를 가져옵니다.
			if (vote1.getAge() == age) { // 득표 정보의 연령대가 현재 확인 중인 연령대와 일치하면
		ageCount = vote1.getCount(); // 해당 연령대의 득표수를 ageCount 변수에 저장하고
		break; // 반복문을 종료합니다.
			}
		}

		int voteRate = kihoCount > 0 ? (int) ((double) ageCount / kihoCount * 100) : 0; // 해당 연령대의 득표율을 계산하여 voteRate 변수에 저장합니다.

		int barLength = (int) (voteRate * 6); // 득표율에 따라 막대 그래프의 길이를 계산하여 barLength 변수에 저장합니다.

		out.println("<tr>"); // 새로운 행을 시작합니다.
		out.println("<td width=75><p align=center>" + (age * 10) + "대" + "</p></td>"); // 연령대를 표시하는 셀을 출력합니다.
		out.println("<td width=500><p align=center>"); // 득표율을 표시하는 셀을 출력합니다.
		out.println("<div>"); // 득표율과 막대 그래프를 감싸는 div 태그를 출력합니다.
		out.println("<span><img src='bar.jpg' style='width: " + barLength
		+ "px; height: 20px; display: inline-block;'></span>"); // 막대 그래프를 출력합니다.
		out.println("<span>" + ageCount + "명 (" + voteRate + "%)</span>"); // 득표수와 득표율을 출력합니다.
		out.println("</div>"); // div 태그를 닫습니다.
		out.println("</td>"); // 셀을 닫습니다.
		out.println("</tr>"); // 행을 마칩니다.
	}
	%>

</table>
</body>
</html>