<%@page import="dao.GongjiDaoImpl"%>
<%@page import="dao.GongjiDao"%>
<%@page import="domain.Gongji"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<style>
body {
	font-family: Arial, sans-serif; /* 폰트 패밀리 설정 */
	background-color: #F1F8FF; /* 배경색 설정 */
	margin: 0; /* 바깥 여백 설정 */
	padding: 20px; /* 안쪽 여백 설정 */
}

h1 {
	color: #0366d6; /* 글자색 설정 */
	margin-bottom: 20px; /* 아래 여백 설정 */
}

table {
	border-collapse: collapse; /* 테두리 겹치기 설정 */
	width: 100%; /* 너비 설정 */
	background-color: #fff; /* 배경색 설정 */
	border: 1px solid #ddd; /* 테두리 스타일 및 색상 설정 */
	margin-left: auto;
	margin-right: auto;
}

th, td {
	padding: 10px; /* 안쪽 여백 설정 */
	text-align: left; /* 텍스트 정렬 설정 */
	border-bottom: 1px solid #ddd; /* 아래쪽 테두리 설정 */
}

th {
	background-color: #0366d6; /* 배경색 설정 */
	color: #fff; /* 글자색 설정 */
}

a {
	color: #0366d6; /* 링크 색상 설정 */
	text-decoration: none; /* 텍스트에 밑줄 제거 */
}

a:hover {
	text-decoration: underline; /* 마우스 호버 시 밑줄 표시 */
}

input[type="button"], input[type="submit"] {
	background-color: #0366d6; /* 배경색 설정 */
	color: #fff; /* 글자색 설정 */
	border: none; /* 테두리 스타일 제거 */
	padding: 10px 20px; /* 안쪽 여백 설정 */
	cursor: pointer; /* 커서 모양 변경 */
	font-size: 14px; /* 글자 크기 설정 */
	border-radius: 4px; /* 테두리 모서리 둥글게 설정 */
}

input[type="button"]:hover, input[type="submit"]:hover {
	background-color: #0056b3; /* 호버 시 배경색 변경 */
}
</style>

</head>
<%



request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

String ckey = request.getParameter("key");
//out.println(ckey);
// 게시글 업데이트 실행

if (ckey.equals("UPDATE")) {
	// 폼에서 전달된 데이터 받기
	int id = Integer.parseInt(request.getParameter("id"));
	// 폼에서 전달된 id 파라미터 값을 가져와서 정수형으로 변환하여 id 변수에 저장합니다.

	String title = request.getParameter("title");
	// 폼에서 전달된 title 파라미터 값을 가져와서 title 변수에 저장합니다.

	String date = request.getParameter("date");
	// 폼에서 전달된 date 파라미터 값을 가져와서 date 변수에 저장합니다.

	String content = request.getParameter("content");
	// 폼에서 전달된 content 파라미터 값을 가져와서 content 변수에 저장합니다.

	Gongji gongji = new Gongji();
	// Gongji 객체를 생성합니다. 이 객체는 게시글 정보를 담는 엔티티입니다.

	GongjiDao gongjiDao = new GongjiDaoImpl();
	// GongjiDaoImpl 객체를 생성하여 gongjiDao 변수에 저장합니다. 이 객체는 게시글 데이터베이스 조작을 위한 DAO(Data Access Object)입니다.

	int c = gongjiDao.getCurrentPage(id, 10);
	// gongjiDao의 getCurrentPage 메서드를 호출하여 현재 페이지 번호를 가져옵니다. 이때 id와 페이지 크기(10)를 전달합니다.

	// 게시글 객체 업데이트
	gongji.setId(id);
	// gongji 객체의 id 속성에 id 값을 설정합니다.

	gongji.setTitle(title);
	// gongji 객체의 title 속성에 title 값을 설정합니다.

	gongji.setDate(date);
	// gongji 객체의 date 속성에 date 값을 설정합니다.

	gongji.setText(content);
	// gongji 객체의 text 속성에 content 값을 설정합니다.

	int update = gongjiDao.updateGongji(gongji);
	// gongjiDao의 updateGongji 메서드를 호출하여 게시글을 업데이트합니다. 업데이트 결과를 update 변수에 저장합니다.

	if (update == 1) {
		// 게시글 업데이트가 성공한 경우

		response.sendRedirect("gongji_list.jsp?page=" + c);
		// 현재 페이지 번호를 포함하여 gongji_list.jsp로 리다이렉트합니다.
	} else {
		// 게시글 업데이트가 실패한 경우

		out.println("Failed to update the record.");
		// "Failed to update the record."라는 메시지를 출력합니다.
	}
}
%>


<%


if (ckey.equals("INSERT")) {
	// ckey 값이 "INSERT"인 경우

	GongjiDao gongjiDao = new GongjiDaoImpl();
	// GongjiDaoImpl 객체를 생성하여 gongjiDao 변수에 저장합니다. 이 객체는 게시글 데이터베이스 조작을 위한 DAO입니다.

	String title = request.getParameter("titlei");
	// "titlei" 파라미터 값을 가져와서 title 변수에 저장합니다. 이는 폼에서 전달된 제목 값을 의미합니다.

	String date = request.getParameter("datei");
	// "datei" 파라미터 값을 가져와서 date 변수에 저장합니다. 이는 폼에서 전달된 날짜 값을 의미합니다. 여기서는 현재 날짜를 사용합니다.

	String content = request.getParameter("contenti");
	// "contenti" 파라미터 값을 가져와서 content 변수에 저장합니다. 이는 폼에서 전달된 내용 값을 의미합니다.

	Gongji gongji = new Gongji();
	// Gongji 객체를 생성합니다. 이 객체는 게시글 정보를 담는 엔티티입니다.

	gongji.setTitle(title);
	// gongji 객체의 title 속성에 title 값을 설정합니다.

	gongji.setDate(date);
	// gongji 객체의 date 속성에 date 값을 설정합니다.

	gongji.setText(content);
	// gongji 객체의 text 속성에 content 값을 설정합니다.

	int id = gongjiDao.insertGongji(gongji);
	// gongjiDao의 insertGongji 메서드를 호출하여 게시글을 데이터베이스에 삽입합니다. 삽입된 게시글의 ID를 id 변수에 저장합니다.
%>
<form method="post" name="fm" action="gongji_write.jsp">
	<input type="hidden" name="key" value="<%=id%>">
	<!-- 숨겨진 필드(hidden field)를 사용하여 id 값을 전달합니다. -->

	<table width="650" border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td><b>번호</b></td>
			<td><%=id%></td>
			<!-- 게시글의 ID를 출력합니다. -->

		</tr>
		<tr>
			<td><b>제목</b></td>
			<td><input type="text" name="title" size="70" maxlength="70"
				value="<%=title%>" readonly></td>
			<!-- 폼에서 전달된 제목 값을 출력합니다. readonly 속성을 사용하여 읽기 전용으로 설정합니다. -->

		</tr>
		<tr>
			<td><b>일자</b></td>
			<td><input type="text" name="date" size="70" maxlength="70"
				value="<%=date%>" readonly></td>
			<!-- 폼에서 전달된 날짜 값을 출력합니다. readonly 속성을 사용하여 읽기 전용으로 설정합니다. -->

		</tr>
		<tr>
			<td><b>내용</b></td>
			<td><textarea style="width: 500px; height: 250px;"
					name="content" cols="70" row="600" readonly><%=content%></textarea></td>
			<!-- 폼에서 전달된 내용 값을 출력합니다. textarea를 사용하며, readonly 속성을 사용하여 읽기 전용으로 설정합니다. -->

		</tr>
		<tr>
			<td colspan="2"><input type="button" value="목록"
				onclick="location.href='gongji_list.jsp'"></td>
			<!-- "목록" 버튼을 클릭하면 gongji_list.jsp로 이동하는 onclick 이벤트를 설정합니다. -->

		</tr>
	</table>

</form>


<%
}
%>


