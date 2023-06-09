<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.ctc.kopo31.domain.Vote"%>
<%@page import="kr.ac.kopo.ctc.kopo31.dao.VoteDaoImpl"%>
<%@page import="kr.ac.kopo.ctc.kopo31.dao.VoteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<title>투표 B_01_H.jsp</title>
</head>
<body>
	<table cellspacing="0" cellpadding="1" width=100% border=1 align=center>
		<!-- 테이블 속성 설정 -->
		<tr>
			<!-- 첫 번째 행 시작 -->
			<td width=100><a href="A_01_H.jsp">후보등록</a></td>
			<!-- 첫 번째 셀 -->
			<td width=100 bgcolor="pink"><a href="B_01_H.jsp">투표</a></td>
			<!-- 두 번째 셀 -->
			<td width=100><a href="C_01_H.jsp">후보등록</a></td>
			<!-- 세 번째 셀 -->
		</tr>
		<!-- 첫 번째 행 종료 -->
	</table>


	<%
	VoteDao voteDao = new VoteDaoImpl(); // VoteDao 객체 생성
	Vote vote = new Vote(); // Vote 객체 생성
	List<Vote> votes = voteDao.selectAll(); // 모든 후보 조회
	if (votes.size() == 0) { // 후보가 없을 경우
		out.println("<h1>후보가 없습니다.</h1>"); // "후보가 없습니다." 메시지 출력
	} else {
	%>
	<h1>투표하기</h1>
	<!-- 투표하기 제목 -->
	<table cellspacing="0" cellpadding="1" width=100% border=1 align=center>
		<!-- 테이블 속성 설정 -->
		<tr>
			<!-- 첫 번째 행 시작 -->
			<form method="post" action="B_02_H.jsp">
				<!-- 폼 시작 -->
				<td width=200><p align=center>
						<select name="kiho" style="height: 20px; width: 100px;">
							<!-- 후보 선택 셀 -->
							<%
							for (int i = 0; i < votes.size(); i++) { // 모든 후보에 대해 반복
								Vote vote1 = votes.get(i); // 현재 후보
								out.println("<option value=" + vote1.getKiho() + ">" + vote1.getKiho() + "번 " + vote1.getName() + "</option>");
								// 학번과 이름을 옵션으로 표시
							}
							%>
						</select>
					</p></td>

				<td width=200><p align=center>
						<select name="age" style="height: 20px; width: 50px;">
							<!-- 나이 선택 셀 -->
							<option value="1">10대</option>
							<!-- 10대 옵션 -->
							<option value="2">20대</option>
							<!-- 20대 옵션 -->
							<option value="3">30대</option>
							<!-- 30대 옵션 -->
							<option value="4">40대</option>
							<!-- 40대 옵션 -->
							<option value="5">50대</option>
							<!-- 50대 옵션 -->
							<option value="6">60대</option>
							<!-- 60대 옵션 -->
							<option value="7">70대</option>
							<!-- 70대 옵션 -->
							<option value="8">80대</option>
							<!-- 80대 옵션 -->
							<option value="9">90대</option>
							<!-- 90대 옵션 -->
						</select>
					</p></td>


				<td><p align=center>
						<input type=submit value="투표하기"></td>
				<!-- 투표 버튼 -->
			</form>
			<!-- 폼 종료 -->
		</tr>
		<!-- 첫 번째 행 종료 -->
	</table>
	<!-- 테이블 종료 -->

	<%
	}
	%>

</body>
</html>