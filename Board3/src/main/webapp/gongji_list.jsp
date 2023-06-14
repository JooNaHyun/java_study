<%@page import="service.GongjiServiceImpl"%>
<%@page import="service.GongjiService"%>
<%@page import="dto.pagination"%>
<%@page import="domain.Gongji"%>
<%@page import="java.util.List"%>
<%@page import="dao.GongjiDaoImpl"%>
<%@page import="dao.GongjiDao"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<html>
<head>
<head>
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

</head>
<body>
	<%


			int pagenum = 1; // from값(table의 첫번째 값)선언 및 초기화
			int countperpage = 10; // cnt값(table의 나와야할 데이터 개수)선언 및 초기화

			try {
		pagenum = Integer.parseInt(request.getParameter("page"));
		// 전달받은 파라미터 값을 "from"에 할당
		if (pagenum <= 0) {//만약 전달받은 값이 0이거나 0보다 작으면
			pagenum = 1;//from에 1할당
		}
			} catch (Exception e) {
			}
			try {
		countperpage = Integer.parseInt(request.getParameter("countperpage"));
		// 전달받은 파라미터 값을 "cnt"에 할당  
		if (countperpage <= 0) {//만약 전달받은 값이 0이거나 0보다 작으면
			countperpage = 10;//cnt에 10할당
		}
			} catch (Exception e) {
			}
			GongjiService gongjiservice = new GongjiServiceImpl();
			pagination pagination = gongjiservice.getPagination(pagenum, countperpage);
			// 지정한 페이지 번호와 페이지당 개수를 기준으로 페이지네이션 정보를 생성한다.

			int c = pagination.getC();
			// 현재 페이지 번호를 가져온다.
			int s = pagination.getS();
			// 시작 페이지 번호를 가져온다.
			int e = pagination.getE();
			// 끝 페이지 번호를 가져온다.
			int p = pagination.getP();
			// 이전 페이지 번호를 가져온다.
			int pp = pagination.getPp();
			// 이전 블록의 시작 페이지 번호를 가져온다.
			int n = pagination.getN();
			// 다음 페이지 번호를 가져온다.
			int nn = pagination.getNn();
			// 다음 블록의 시작 페이지 번호를 가져온

			request.setCharacterEncoding("UTF-8"); // 요청 데이터의 인코딩을 UTF-8로 설정
			response.setCharacterEncoding("UTF-8"); // 응답 데이터의 인코딩을 UTF-8로 설정

			GongjiDao gongjiDao = new GongjiDaoImpl(); // GongjiDao 인터페이스를 구현한 GongjiDaoImpl 객체 생성
			List<Gongji> gongjiList = gongjiDao.selectAllGongji(pagenum, countperpage); // 모든 공지 정보 조회

			if (gongjiList != null && !gongjiList.isEmpty()) {
	%>
	<!-- 공지 정보가 존재하는 경우 -->

	<table cellspacing="1" width="600" border="1">
		<tr>
			<td width="50"><p align="center">번호</p></td>
			<!-- 번호 열 -->
			<td width="500"><p align="center">제목</p></td>
			<!-- 제목 열 -->
			<td width="100"><p align="center">등록일</p></td>
			<!-- 등록일 열 -->
		</tr>
		<%
		for (Gongji gongji : gongjiList) {
			//for 반복문을 사용하여 gongjiList의 각 요소에 대해 반복
		%>
		<tr>
			<!-- 행 시작 -->
			<td width="50"><p align="center"><%=gongji.getId()%></p></td>
			<!-- 번호 셀 -->
			<td width="500"><p align="left">
					<a href="gongji_view.jsp?key=<%=gongji.getId()%>"><%=gongji.getTitle().replaceAll("<", "&lt;").replaceAll(">", "&gt;")%></a>
				</p></td>
			<!-- 제목 셀 -->
			<td width="100"><p align="center"><%=gongji.getDate()%></p></td>
			<!-- 등록일 셀 -->
		</tr>
		<!-- 행 종료 -->
		<%
		}
		%>

		<table width="650">
			<!-- 테이블의 너비를 650으로 설정 -->
			<tr>
				<!-- 테이블 행 시작 -->
				<td style="text-align: right;">
					<!-- 셀의 오른쪽 정렬 스타일 지정 --> <input type="button" value="신규"
					onclick="window.location='gongji_insert.jsp'"> <!-- "신규" 버튼 생성 및 클릭 시 'gongji_insert.jsp'로 이동하는 이벤트 처리 -->
				</td>
			</tr>
			<!-- 테이블 행 종료 -->
		</table>
		<%
		} else {
		// 공지 정보가 없는 경우 처리
		}
		%>
		<div style="text-align: center; font-weight: bold; font-size: 20pt;">
			<%
			if (10 < c) {
			%>
			<!-- 만약 현재 페이지 번호(c)가 10보다 큰 경우 -->
			<a href="gongji_list.jsp?page=<%=pp%>" style="color: black"><<</a>
			<!-- 이전 페이지 블록으로 이동하는 링크 (<<) -->
			<a href="gongji_list.jsp?page=<%=p%>" style="color: black"><</a>
			<!-- 이전 페이지로 이동하는 링크 (<) -->
			<%
			}
			%>

			<%
			for (int i = s; i <= e; i++) {
			%>
			<!-- 페이지 번호 반복문 -->
			<%
			if (i == c) {
			%>
			<!-- 만약 현재 반복 중인 페이지 번호(i)와 현재 페이지 번호(c)가 일치하는 경우 -->
			<a style="color: red;" href="gongji_list.jsp?page=<%=i%>"
				style="color:black"><%=i%></a>
			<!-- 현재 페이지 번호 (빨간색) -->
			<%
			} else {
			%>
			<!-- 그렇지 않은 경우 -->
			<a href="gongji_list.jsp?page=<%=i%>" style="color: blue;"><%=i%></a>
			<!-- 페이지 번호 (파란색) -->
			<%
			}
			%>
			<%
			}
			%>

			<%
			if (nn != -1) {
			%>
			<!-- 만약 nn 값이 -1이 아닌 경우 -->
			<a href="gongji_list.jsp?page=<%=n%>" style="color: black">></a>
			<!-- 다음 페이지로 이동하는 링크 (>) -->
			<a href="gongji_list.jsp?page=<%=nn%>" style="color: black">>></a>
			<!-- 다음 페이지로 이동하는 링크 (>>) -->
			<%
			}
			%>
		</div>
</body>
</html>
