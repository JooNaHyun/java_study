<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.ctc.kopo31.domain.Vote"%>
<%@page import="kr.ac.kopo.ctc.kopo31.dao.VoteDaoImpl"%>
<%@page import="kr.ac.kopo.ctc.kopo31.dao.VoteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<title>후보등록 A_01_H.jsp</title>
</head>
<body>
	<script>
		function confirmDelete() {//confirmDelete함수 생성
			return confirm("삭제하시겠습니까?"); // 삭제 여부를 사용자에게 확인하는 대화상자를 표시하고 사용자의 선택 결과를 반환
		}

		function submit1() {//submit1()함수 생성
			const form = document.getElementById('insert');
			const name = form.elements.name.value; // 이름 필드 값 가져오기
			const pattern1 = /^([a-zA-Z]|[가-힣])+$/; // 한글 또는 영어만 입력 가능한 패턴1
			//const pattern1 = /^([a-zA-Z가-힣]+|[a-zA-Z0-9가-힣]+)$/; // 한글 또는 영어만 입력 가능한 패턴1, 한글, 영어, 숫자 조합도 입력 가능
			const pattern2 = /^(?:100|[1-9]?[0-9])$/; // 0부터 100 사이의 정수만 입력 가능한 패턴2

			if (name.trim() === '') { // 입력 창이 비어있으면
				alert("이름을 입력해주세요."); // 해당 메세지 출력
				return; // 함수 실행 종료
			}

			if (!pattern1.test(name)) { // 이름에 유효한 한글 또는 영어가 입력되지 않으면
				alert("이름은 한글 또는 영어로만 입력 가능합니다."); // 해당 메세지 출력
				return; // 함수 실행 종료
			}

			if (name.length > 20) { // 이름이 20자 이상이면
				alert("이름은 20자 이하만 입력 가능합니다."); // 해당 메세지 출력
				return; // 함수 실행 종료
			}

			form.action = "A_03_H.jsp";//form의 action을 A_03_H.jsp으로 변경
			form.submit();//제출

		}
	</script>
	<!-- 첫 번째 테이블 -->
	<table cellspacing="0" cellpadding="1" width="100%" border="1"
		align="center">
		<tr>
			<td width="100" bgcolor="pink"><a href="A_01_H.jsp">후보등록</a></td>
			<!-- 후보등록 링크 -->
			<td width="100"><a href="B_01_H.jsp">투표</a></td>
			<!-- 투표 링크 -->
			<td width="100"><a href="C_01_H.jsp">개표결과</a></td>
			<!-- 개표결과 링크 -->
		</tr>
	</table>

	<h1>후보등록</h1>
	<!-- 헤딩 제목 -->

	<!-- 두 번째 테이블 -->
	<table cellspacing="0" cellpadding="1" width="100%" border="1"
		align="center">
		<tr>
			<td><p align="center">후보명 입력</p></td>
			<!-- 텍스트를 중앙 정렬하여 표시 -->
		</tr>
		<%
		VoteDao voteDao = new VoteDaoImpl(); // VoteDaoImpl 객체 생성
		Vote vote = new Vote(); // Vote 객체 생성
		List<Vote> votes = voteDao.selectAll(); // 모든 투표 정보 조회
		int newKiho = voteDao.calNumber(); // 새로운 투표 기호 생성

		for (int i = 0; i < votes.size(); i++) {
			Vote vote1 = votes.get(i); // 리스트에서 투표 정보 가져오기

			out.println("<tr>"); // 행 시작
			out.println("<td>"); // 셀 시작
			out.println("<form method='post' action='A_02_H.jsp' onsubmit='return confirmDelete()'>"); // 삭제 폼 시작
			out.println("기호:<input type='text' name='kiho' value=" + vote1.getKiho() + "  readonly>"); // 기호 입력란
			out.println("이름 : <input type='text' name='name' value='" + vote1.getName() + "' readonly>"); // 이름 입력란
			out.println("<input type='submit' value='삭제'>"); // 삭제 버튼
			out.println("</form>"); // 삭제 폼 종료
			out.println("</td>"); // 셀 종료
			out.println("</tr>"); // 행 종료
		}

		out.println("<tr>"); // 행 시작
		out.println("<td>"); // 셀 시작
		out.println("<form method='post' id='insert'>"); // 추가 폼 시작
		out.println("기호:<input type='text' name='kiho' value=" + newKiho + " readonly>"); // 새로운 기호 입력란
		out.println("이름 : <input type='text' name='name' value=''>"); // 이름 입력란
		out.println("<input type='button' value='추가' onclick='submit1()'>"); // 추가 버튼
		out.println("</form>"); // 추가 폼 종료
		out.println("</td>"); // 셀 종료
		out.println("</tr>"); // 행 종료
		%>
	</table>
</body>
</html>