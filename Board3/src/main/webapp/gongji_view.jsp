<%@page import="dao.GongjiDaoImpl"%>
<%@page import="dao.GongjiDao"%>
<%@page import="domain.Gongji"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<html>

<head>
<style>
body {
	font-family: Arial, sans-serif; /* 글꼴 설정 */
	background-color: #F1F8FF; /* 배경색 설정 */
	margin: 0; /* 바깥 여백 제거 */
	padding: 20px; /* 안쪽 여백 설정 */
}

h1 {
	color: #0366d6; /* 제목 색상 설정 */
	margin-bottom: 20px; /* 아래 여백 설정 */
}

table {
	border-collapse: collapse; /* 테이블 경계선 병합 */
	width: 1000px; /* 테이블 너비 설정 */
	background-color: #fff; /* 테이블 배경색 설정 */
	border: 1px solid #ddd; /* 테이블 경계선 스타일 설정 */
	margin-left: auto;
	margin-right: auto;
}

th, td {
	padding: 10px; /* 셀 안쪽 여백 설정 */
	text-align: left; /* 셀 내용 정렬 설정 */
	border-bottom: 1px solid #ddd; /* 셀 하단 경계선 스타일 설정 */
}

th {
	background-color: #0366d6; /* 테이블 헤더 배경색 설정 */
	color: #fff; /* 테이블 헤더 글자색 설정 */
}

a {
	color: #0366d6; /* 링크 색상 설정 */
	text-decoration: none; /* 링크 밑줄 제거 */
}

a:hover {
	text-decoration: underline; /* 링크에 마우스를 올렸을 때 밑줄 추가 */
}

input[type="button"], input[type="submit"] {
	background-color: #0366d6; /* 버튼 배경색 설정 */
	color: #fff; /* 버튼 글자색 설정 */
	border: none; /* 버튼 테두리 제거 */
	padding: 10px 20px; /* 버튼 안쪽 여백 설정 */
	cursor: pointer; /* 커서 모양 변경 */
	font-size: 14px; /* 버튼 글자 크기 설정 */
	border-radius: 4px; /* 버튼 모서리 둥글게 설정 */
}

input[type="button"]:hover, input[type="submit"]:hover {
	background-color: #0056b3; /* 버튼에 마우스를 올렸을 때 배경색 변경 */
}

textarea {
	width: 300px; /* 텍스트영역의 너비를 300픽셀로 설정 */
	height: 200px; /* 텍스트영역의 높이를 200픽셀로 설정 */
	padding: 10px; /* 텍스트영역 내부의 여백을 10픽셀로 설정 */
	font-family: Arial, sans-serif; /* 글꼴을 Arial 또는 sans-serif로 설정 */
	font-size: 14px; /* 글꼴 크기를 14픽셀로 설정 */
	border: 1px solid #ddd; /* 1픽셀 두께의 #ddd 색상으로 테두리를 설정 */
	border-radius: 4px; /* 4픽셀 반경의 둥근 모서리를 가진 테두리를 설정 */
	resize: vertical; /* 수직 방향으로만 크기 조정이 가능하도록 설정 */
	resize: none; /* 크기 조정 비활성화 */
}
</style>

<script language="JavaScript">
	// JavaScript 함수 정의
	function submitForm(mode) {
		// mode에 따라 액션 설정
		if (mode == "write") {
			fm.action = "gongji_write.jsp"; // 쓰기 모드인 경우 액션을 gongji_write.jsp로 설정
		} else if (mode == "delete") {
			fm.action = "gongji_delete.jsp"; // 삭제 모드인 경우 액션을 gongji_delete.jsp로 설정
		}
		fm.submit(); // 폼 제출
	}
</script>
<%


// 요청과 응답의 인코딩을 UTF-8로 설정합니다.
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

// "key" 매개변수를 받아옵니다.
String ckey = request.getParameter("key");

// "ckey" 값을 정수형으로 변환하여 "id" 변수에 저장합니다.
int id = Integer.parseInt(ckey);

// Gongji 객체와 GongjiDao 객체를 생성합니다.
Gongji gongji = new Gongji();
GongjiDao gongjiDao = new GongjiDaoImpl();

// GongjiDao를 사용하여 id에 해당하는 Gongji 객체를 조회합니다.
Gongji gongjiList = gongjiDao.selectOneGongji(id);

// 조회한 Gongji 객체의 제목, 일자, 내용을 변수에 저장합니다.
String title = gongjiList.getTitle();
String date = gongjiList.getDate();
String content = gongjiList.getText();
%>

<body>
	<form method="post" name="fm">
		<table width="650" border="1" cellspacing="0" cellpadding="5">
			<tr>
				<td><b>번호</b></td>
				<!-- 번호 칼럼 -->
				<td><%=ckey%></td>
				<!-- ckey 변수의 값 출력 -->
			</tr>
			<tr>
				<td><b>제목</b></td>
				<!-- 제목 칼럼 -->
				<td><%=title.replaceAll("<", "&lt;").replaceAll(">", "&gt;")%></td>
				<!-- title 변수의 값 출력 -->
			</tr>
			<tr>
				<td><b>일자</b></td>
				<!-- 일자 칼럼 -->
				<td><%=date%></td>
				<!-- date 변수의 값 출력 -->
			</tr>
			<tr>
				<td><b>내용</b></td>
				<!-- 내용 칼럼 -->
				<td><textarea style="width: 500px; height: 250px;"
						name="content" cols="70" readonly><%=content.replaceAll("<", "&lt;").replaceAll(">", "&gt;")%></textarea></td>

				<!-- content 변수의 값 출력 -->
			</tr>

		</table>
		<table width="650">
			<tr>
				<!-- 추가 내용 없음 -->
		</table>
		<table width="650">
			<tr>
				<td width="600"></td>
				<td><input type="button" value="목록"
					OnClick="location.href='gongji_list.jsp'"></td>
				<!-- 목록 버튼 -->
				<td><input type="button" value="수정"
					OnClick="location.href='gongji_update.jsp?key=<%=ckey%>'"></td>
				<!-- 수정 버튼 -->
			</tr>
		</table>
	</form>
</body>


</html>