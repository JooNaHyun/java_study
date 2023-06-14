<%@page import="domain.Gongji2"%>
<%@page import="dto.pagination"%>
<%@page import="service.GongjiServiceImpl"%>
<%@page import="service.GongjiService"%>
<%@page import="dao.GongjiDaoImpl2"%>
<%@page import="dao.GongjiDao2"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<!--구동에 필요한 라이브러리 임포트-->
<%@page import="java.time.LocalDate"%>
<!--구동에 필요한 라이브러리 임포트-->

<%@page import="java.util.List"%>
<!--구동에 필요한 라이브러리 임포트-->

<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!--컨텐츠 타입 및 캐릭터셋, 언어 지정-->

<html>
<!--html 작성 시작-->
<head>
<!--머릿말 작성 시작-->
<style>
body {
	font-family: Arial, sans-serif; /* 본문의 글꼴과 대체 글꼴을 지정합니다. */
	background-color: #F1F8FF; /* 배경 색상을 지정합니다. */
	margin: 0; /* 전체 페이지의 바깥 여백을 0으로 설정합니다. */
	padding: 20px; /* 전체 페이지의 안쪽 여백을 지정합니다. */
}

h1 {
	color: #0366d6; /* 제목의 글자 색상을 지정합니다. */
	margin-bottom: 20px; /* 제목 아래 여백을 지정합니다. */
}

table {
	border-collapse: collapse; /* 테이블 셀의 경계선을 합칩니다. */
	width: 100%; /* 테이블의 너비를 100%로 설정합니다. */
	background-color: #fff; /* 테이블의 배경 색상을 지정합니다. */
	border: 1px solid #ddd; /* 테이블의 테두리를 지정합니다. */
}

th, td {
	padding: 10px; /* 셀의 안쪽 여백을 지정합니다. */
	text-align: left; /* 셀 내용의 정렬을 왼쪽으로 설정합니다. */
	border-bottom: 1px solid #ddd; /* 셀의 아래 테두리를 지정합니다. */
}

th {
	background-color: #0366d6; /* 테이블 헤더의 배경 색상을 지정합니다. */
	color: #fff; /* 테이블 헤더의 글자 색상을 지정합니다. */
}

a {
	color: #0366d6; /* 링크의 글자 색상을 지정합니다. */
	text-decoration: none; /* 링크의 밑줄을 제거합니다. */
}

a:hover {
	text-decoration: underline; /* 링크에 마우스를 올리면 밑줄을 표시합니다. */
}

input[type="button"], input[type="submit"] {
	background-color: #0366d6; /* 버튼의 배경 색상을 지정합니다. */
	color: #fff; /* 버튼의 글자 색상을 지정합니다. */
	border: none; /* 버튼의 테두리를 제거합니다. */
	padding: 10px 20px; /* 버튼의 안쪽 여백을 지정합니다. */
	cursor: pointer; /* 커서를 손가락 모양으로 변경합니다. */
	font-size: 14px; /* 버튼의 글꼴 크기를 지정합니다. */
	border-radius: 4px; /* 버튼의 테두리를 둥글게 설정합니다. */
}

input[type="button"]:hover, input[type="submit"]:hover {
	background-color: #0056b3; /* 버튼에 마우스를 올리면 배경 색상을 변경합니다. */
}
</style>
</head>
<!--머릿말 작성 끝-->
<body>
	<!--본문 작성 시작-->

	<%
	GongjiDao2 gongjiProgramDao = new GongjiDaoImpl2(); // DAO 객체 생성

	String pageValue = request.getParameter("page"); // from이라는 파라미터에서 값을 가져와 새 변수에 지정
	String countValue = request.getParameter("count"); // cnt라는 파라미터에서 값을 가져와 새 변수에 지정
	String keyValue = request.getParameter("key"); // key라는 파라미터에서 값을 가져와 새 변수에 지정

	int pageNum = 1; // 페이지수 담을 변수 생성
	int countPerPage = 10; // 페이지당 항목 개수 담을 변수 생성

	if (pageValue != null && countValue != null) { // 파라미터에서 받아온 값들 둘 다 null이 아닐 경우
		pageNum = Integer.parseInt(pageValue); // 파라미터에서 받은 값을 page 번호 변수에 지정
		countPerPage = Integer.parseInt(countValue); // 파라미터에서 받은 값을 countPerPage 변수에 지정
	} else if (pageValue != null) { // keyValue가 존재할 경우
		pageNum = Integer.parseInt(pageValue); // id값으로 keyValue를 설정
	}

	if (keyValue != null && pageValue == null) { // keyValue만 존재할 경우
		int id = Integer.parseInt(keyValue); // id값으로 keyValue를 설정
		pageNum = gongjiProgramDao.getPageById(id, countPerPage); // 받은 정보들을 통해 페이지수 계산
	}

	GongjiService gongjiWebService = new GongjiServiceImpl(); // GongjiWebService 객체 생성

	pagination pagination = gongjiWebService.getPagination(pageNum, countPerPage); // 설정된 pageNum, countPerPage를 기반으로 페이지 번호들 계산

	pageNum = pagination.getC(); // 현재 페이지 불러와 변수에 지정

	List<Gongji2> selectAll = gongjiProgramDao.selectAll(pageNum, countPerPage); // 페이지에 띄울 학생들의 정보를 리스트로 가져옴

	if (selectAll == null) { // 리스트가 비었을 경우
	%>
	<h3>조회할 데이터가 없습니다.</h3>
	<!--데이터가 없다는 안내문 출력-->
	<table cellspacing=1 width=600 border=1>
		<!--테이블 생성-->
		<thead>
			<!--thead 태그 열기-->
			<tr>
				<!--tr 태그 열기-->
				<th width=50><p align=center>번호</p></th>
				<!--번호 인덱스-->
				<th width=500><p align=center>제목</p></th>
				<!--제목 인덱스-->
				<th width=100><p align=center>조회수</p></th>
				<!--조회수 인덱스-->
				<th width=100><p align=center>등록일</p></th>
				<!--등록일 인덱스-->
			</tr>
			<!--tr 태그 닫기-->
		</thead>
		<!--thead 태그 닫기-->
	</table>
	<!--테이블 작성 끝-->
	<table width=600>
		<!--테이블 생성-->
		<tr>
			<!--tr 태그 열기-->
			<td width=500></td>
			<!--td 태그 열고 닫기, 버튼 생성-->
			<td><input type=button class="button btnPush btnOrange"
				value="신규" onclick="window.location='gongji_insert.jsp'"></td>
	</table>
	<!--테이블 작성 끝-->
	<%
	} else {
	%>
	<!--리스트에 값이 존재할 경우-->
	<table cellspacing=1 width=600 border=1>
		<!--테이블 생성-->
		<thead>
			<!--thead 태그 열기-->
			<tr>
				<!--tr 태그 열기-->
				<th width=50><p align=center>번호</p></th>
				<!--번호 인덱스-->
				<th width=500><p align=center>제목</p></th>
				<!--제목 인덱스-->
				<th width=100><p align=center>조회수</p></th>
				<!--조회수 인덱스-->
				<th width=100><p align=center>등록일</p></th>
				<!--등록일 인덱스-->
			</tr>
			<!--tr 태그 닫기-->
		</thead>
		<!--thead 태그 닫기-->
		<%
		LocalDate now = LocalDate.now(); // 현재 날짜 구하기

		// 포맷 정의
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		// 포맷 적용
		String formatedNow = now.format(formatter);

		for (int i = 0; i < selectAll.size(); i++) { // 리스트 사이즈만큼 루프
			Gongji2 gongji = selectAll.get(i); // 리스트의 i번째 값을 가져옴
			String str = ""; // str 변수 생성
			if (gongji.getDate().equals(formatedNow))
				str = " [NEW]"; // 새 게시물이면 new
			out.println("<tr>"); // tr 태그 열기
			out.println("<td width=50><p align=center>" + gongji.getId() + "</p></td>");
			if (gongji.getRelevel() == 0) { // relevel이 0이면
				String title = gongji.getTitle().replaceAll("&", "&amp;"); // &를 &amp로 변경
				String title2 = title.replaceAll("<", "&lt;").replaceAll(">", "&gt;"); // <와 >를 각각 &lt, &gt로 변경
				// 제목 가져와서 출력 및 하이퍼링크 설정
				out.println("<td width=50><p align=left><a class=\"a\" href='gongji_view.jsp?key=" + gongji.getId() + "&page="
				+ pageNum + "'>" + title2 + str + "</p></td>");
			} else { // 그 외에는
				// 제목 가져와서 출력 및 하이퍼링크 설정
				out.println("<td width=50><p align=left><a class=\"a\" href='gongji_view.jsp?key=" + gongji.getId() + "&page="
				+ pageNum + "'>");

				for (int j = 0; j < gongji.getRelevel(); j++) { // relevel만큼 화살표 출력
			out.print("↳ ");
				}
				out.print("[RE]"); // RE 붙이기

				String title = gongji.getTitle().replaceAll("&", "&amp;"); // &를 &amp로 변경
				String title2 = title.replaceAll("<", "&lt;").replaceAll(">", "&gt;"); // <와 >를 각각 &lt, &gt로 변경

				out.println(title2 + "" + str); // 댓글 출력
				out.println("</p></td>"); // td 닫기
			}
			out.println("<td width=50><p align=center>" + gongji.getViewcnt() + "</p></td>"); // 조회수 출력
			out.println("<td width=50><p align=center>" + gongji.getDate() + "</p></td>"); // 날짜 출력
			out.println("</tr>"); // tr 닫기

		}
		out.println("</table>"); // 테이블 닫기
		%>
		<table width=600>
			<!--테이블 생성-->
			<tr>
				<!--tr 태그 열기-->
				<td width=500></td>
				<!--td 태그 열고 닫기-->
				<!--새로 글 올리는 버튼 생성-->
				<td><input type=button
					value="신규" onclick="window.location='gongji_insert.jsp'"></td>
		</table>
		<!--테이블 작성 끝-->
		<br>
		<br>
		<%--줄바꿈--%>
		<!-- 여기부터 버튼 -->
		<div style="text-align: center; font-weight: bold; font-size: 20pt;">
			<%--div 크기 및 텍스트 정렬 설정--%>
			<%
			int s = pagination.getS(); // 현재 뜨는 페이지 번호 중 첫 번호
			int e = pagination.getE(); // 현재 뜨는 페이지 번호 중 마지막 번호
			int p = pagination.getP(); // -10으로 가는 페이지 번호
			int pp = pagination.getPp(); // 맨 첫 페이지 번호
			int n = pagination.getN(); // +10으로 가는 페이지 번호
			int nn = pagination.getNn(); // 맨 마지막 페이지 번호

			if (p != -1) { // p의 값이 -1이 아니라면
				// p에 해당하는 하이퍼링크 생성
				out.println("<a href=\"gongji_list.jsp?page=" + pp + "&count=" + countPerPage + "\"><</a>");
			}
			if (pp != -1) { // pp의 값이 -1이 아니라면
				// pp에 해당하는 하이퍼링크 생성
				out.println("<a href=\"gongji_list.jsp?page=" + p + "&count=" + countPerPage + "\"><<</a>");
			}

			for (int i = s; i <= e; i++) { // s에서 e까지 루프 진행
				if (i != -1) { // i가 -1이 아니라면
					if (i == pageNum) { // i가 현재 페이지 번호라면
				// 밑줄이 그어진 하이퍼링크 생성하여 페이지 번호 표시
				out.println("<a href=\"gongji_list.jsp?page=" + i + "&count=" + countPerPage + "\">" + i + "</a> ");
					} else { // 그 외에는
				// 평범한 하이퍼링크 생성하여 페이지 번호 표시
				out.println("<a href=\"gongji_list.jsp?page=" + i + "&count=" + countPerPage + "\">" + i + "</a> ");
					}
				}
			}

			if (n != -1) { // n이 -1이 아니라면
				// n에 해당하는 하이퍼링크 생성
				out.println("<a href=\"gongji_list.jsp?page=" + n + "&count=" + countPerPage + "\">>></a>"); // cnt와 from 값에 맞는 url 설정하여 하이퍼링크 생성    	
			}
			if (nn != -1) { // nn이 -1이 아니라면
				// nn에 해당하는 하이퍼링크 생성
				out.println("<a href=\"gongji_list.jsp?page=" + nn + "&count=" + countPerPage + "\">></a>"); // cnt와 from 값에 맞는 url 설정하여 하이퍼링크 생성
			}
			}
			%>
		</div>
		<%--div 작성 끝--%>
</body>
<!--본문 작성 끝-->
</html>
<!--html 작성 끝-->