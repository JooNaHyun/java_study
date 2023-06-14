<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.GongjiDaoImpl"%>
<%@page import="dao.GongjiDao"%>
<%@page import="domain.Gongji"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.Date"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<html>

<head>
<style>
/* CSS 스타일 지정 */

/* 전체 페이지의 스타일 */
body {
	font-family: Arial, sans-serif; /* 폰트 패밀리를 Arial, sans-serif로 지정 */
	background-color: #F1F8FF; /* 배경색을 연한 파란색(#F1F8FF)으로 지정 */
	margin: 0; /* 바깥 여백을 0으로 설정 */
	padding: 20px; /* 안쪽 여백을 20px로 설정 */
}

/* 제목 스타일 */
h1 {
	color: #0366d6; /* 글자 색상을 파란색(#0366d6)으로 지정 */
	margin-bottom: 20px; /* 하단 여백을 20px로 설정 */
}

/* 테이블 스타일 */
table {
	border-collapse: collapse; /* 테이블 테두리를 겹치도록 설정 */
	width: 1000px; /* 테이블의 너비를 100%로 설정 */
	background-color: #fff; /* 배경색을 흰색(#fff)으로 지정 */
	border: 1px solid #ddd; /* 테두리를 1px 두께의 회색(#ddd)으로 지정 */
	margin-left: auto;
	margin-right: auto;
}

/* 테이블 셀 스타일 */
th, td {
	padding: 10px; /* 셀 안쪽 여백을 10px로 설정 */
	text-align: left; /* 셀 내용을 왼쪽 정렬로 설정 */
	border-bottom: 1px solid #ddd; /* 아래쪽 테두리를 1px 두께의 회색(#ddd)으로 지정 */
}

/* 테이블 헤더 스타일 */
th {
	background-color: #0366d6; /* 배경색을 파란색(#0366d6)으로 지정 */
	color: #fff; /* 글자 색상을 흰색(#fff)으로 지정 */
}
/* 링크 스타일 */
a {
	color: #0366d6; /* 링크의 색상을 파란색(#0366d6)으로 지정 */
	text-decoration: none; /* 텍스트에 대한 텍스트 장식을 없앰 */
}
/* 링크에 마우스를 올렸을 때의 스타일 */
a:hover {
	text-decoration: underline; /* 링크에 밑줄을 추가 */
}
/* 버튼 스타일 */
input[type="button"], input[type="submit"] {
	background-color: #0366d6; /* 배경색을 파란색(#0366d6)으로 지정 */
	color: #fff; /* 글자 색상을 흰색(#fff)으로 지정 */
	border: none; /* 테두리를 없앰 */
	padding: 10px 20px; /* 안쪽 여백을 10px(top/bottom) 20px(left/right)로 설정 */
	cursor: pointer; /* 커서를 손가락 모양으로 설정 */
	font-size: 14px; /* 글자 크기를 14px로 설정 */
	border-radius: 4px; /* 테두리의 둥근 정도를 4px로 설정 */
}
/* 버튼에 마우스를 올렸을 때의 스타일 */
input[type="button"]:hover, input[type="submit"]:hover {
	background-color: #0056b3; /* 배경색을 진한 파란색(#0056b3)으로 변경 */
}

/* 페이지네이션 스타일 */
.pagination {
	margin-top: 20px; /* 위쪽 여백을 20px로 설정 */
	text-align: center; /* 텍스트를 가운데 정렬로 설정 */
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
		const titlei = fm.elements.titlei.value; // 제목 입력 필드의 값을 가져옴
		const contenti = fm.elements.contenti.value; // 내용 입력 필드의 값을 가져옴
		if (titlei.trim() === '' || contenti.trim() === '') { // 제목 또는 내용이 공백인 경우
			alert('내용을 입력해주세요.'); // 경고 메시지 표시
			return; // 함수 종료
		}
		if (titlei.length > 100) { // 제목의 길이가 100자를 초과하는 경우
			alert('100자 이하로 입력해주세요.'); // 경고 메시지 표시
			return; // 함수 종료
		}

		fm.action = "gongji_write.jsp?key=INSERT"; // 폼의 action 속성을 설정하여 전송할 URL 지정
		fm.submit(); // 폼 전송
	}
</script>

<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

// 요청(request)과 응답(response)의 인코딩을 UTF-8로 설정합니다.

Date date = new Date(); // 현재 날짜와 시간을 가져옵니다.
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 포맷을 지정합니다.
String formattedDate = dateFormat.format(date); // 현재 날짜를 지정된 포맷으로 변환합니다.
%>
</head>

<body>
	<form method="post" name="fm">
		<table width="650" border="1" cellspacing="0" cellpadding="5">
			<tr>
				<td><b>번호</b></td>
				<td>신규(insert)<input type=hidden name=idi value='INSERT'></td>
				<!-- 번호를 나타내는 셀과 신규 입력(insert)을 나타내는 셀이 있습니다. -->
			</tr>
			<tr>
				<td><b>제목</b></td>
				<td><input type="text" name="titlei" size="70" maxlength="70"></td>
				<!-- 제목을 입력하는 입력 필드가 있습니다. -->
			</tr>
			<tr>
				<td><b>일자</b></td>
				<td><input type="text" name="datei" size="70" maxlength="70"
					value="<%=formattedDate%>"></td>
				<!-- 일자를 입력하는 입력 필드가 있으며, 기본값으로 현재 날짜가 표시됩니다. -->
			</tr>
			<tr>
				<td><b>내용</b></td>
				<td><textarea style="width: 500px; height: 250px;"
						name="contenti" cols="70" rows="50"></textarea></td>
				<!-- 내용을 입력하는 다중 행 텍스트 영역이 있습니다. -->
			</tr>
		</table>
		<table width="650">
			<tr>
				<td style="text-align: right;" width="600"></td>
				<td><input type="button" value="취소"
					onclick="location.href='gongji_list.jsp'"></td>
				<!-- 취소 버튼을 클릭하면 'gongji_list.jsp'로 이동합니다. -->
				<td><input type="button" value="쓰기"
					onclick="submitForm('write')"> <!-- 쓰기 버튼을 클릭하면 'submitForm('write')' 함수가 호출됩니다. --></td>
			</tr>
		</table>
	</form>
</body>

</html>