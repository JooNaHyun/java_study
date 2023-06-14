<%@page import="dao.GongjiDaoImpl"%>
<%@page import="dao.GongjiDao"%>
<%@page import="domain.Gongji"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<html>

<head>
<style>
/* 전체 body 스타일 */
body {
	font-family: Arial, sans-serif; /* 글꼴 패밀리 설정 */
	background-color: #F1F8FF; /* 배경 색상 설정 */
	margin: 0; /* 기본 여백 제거 */
	padding: 20px; /* 콘텐츠 주위에 여백 추가 */
}

/* 제목 스타일 */
h1 {
	color: #0366d6; /* 제목 색상 설정 */
	margin-bottom: 20px; /* 하단 여백 추가 */
}

/* 테이블 스타일 */
table {
	border-collapse: collapse; /* 테이블 테두리 겹치기 */
	width: 1000px; /* 테이블 너비를 컨테이너의 100%로 설정 */
	background-color: #fff; /* 테이블 배경 색상 설정 */
	border: 1px solid #ddd; /* 테두리 선 스타일 및 색상 설정 */
	margin-left: auto;
	margin-right: auto;
}

/* 테이블 헤더와 셀 스타일 */
th, td {
	padding: 10px; /* 셀 내 여백 설정 */
	text-align: left; /* 텍스트 정렬 설정 */
	border-bottom: 1px solid #ddd; /* 하단 테두리 선 스타일 및 색상 설정 */
}

/* 테이블 헤더 스타일 */
th {
	background-color: #0366d6; /* 헤더 배경 색상 설정 */
	color: #fff; /* 헤더 글자 색상 설정 */
}

/* 링크 스타일 */
a {
	color: #0366d6; /* 링크 색상 설정 */
	text-decoration: none; /* 링크에 밑줄 제거 */
}

/* 링크 호버 스타일 */
a:hover {
	text-decoration: underline; /* 링크에 밑줄 표시 */
}

/* 버튼 및 제출 버튼 스타일 */
input[type="button"], input[type="submit"] {
	background-color: #0366d6; /* 버튼 배경 색상 설정 */
	color: #fff; /* 버튼 글자 색상 설정 */
	border: none; /* 테두리 제거 */
	padding: 10px 20px; /* 버튼 여백 설정 */
	cursor: pointer; /* 커서 모양을 포인터로 설정 */
	font-size: 14px; /* 글자 크기 설정 */
	border-radius: 4px; /* 버튼 테두리 모양 설정 */
}

/* 버튼 및 제출 버튼 호버 스타일 */
input[type="button"]:hover, input[type="submit"]:hover {
	background-color: #0056b3; /* 호버 시 버튼 배경 색상 변경 */
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
</head>

<body>
	<%

			String ckey = request.getParameter("key"); // 요청 파라미터에서 key 값을 가져옵니다.
			int id = Integer.parseInt(ckey); // key 값을 정수로 변환합니다.
			Gongji gongji = new Gongji(); // Gongji 객체 생성
			GongjiDao gongjiDao = new GongjiDaoImpl(); // GongjiDao 객체 생성
			Gongji gongjiList = gongjiDao.selectOneGongji(id); // id에 해당하는 Gongji 정보를 조회합니다.
			String title = gongjiList.getTitle(); // Gongji 제목을 가져옵니다.
			String date = gongjiList.getDate(); // Gongji 등록일을 가져옵니다.
			String content = gongjiList.getText(); // Gongji 내용을 가져옵니다.
	%>
	<script language="JavaScript">
		function submitForm(mode) {
			const title = fm.elements.title.value; // 폼의 title 입력값을 가져옵니다.
			const content = fm.elements.content.value; // 폼의 content 입력값을 가져옵니다.
			if (title.trim() === '' || content.trim() === '') {
				alert('내용을 입력해주세요.'); // 제목 또는 내용이 비어있는 경우 알림창을 띄웁니다.
				return;
			}
			if (title.length > 100) {
				alert('100자 이하로 입력해주세요.'); // 제목이 100자를 초과하는 경우 알림창을 띄웁니다.
				return;
			}
			if (content.length > 10000) {
				alert('10000자 이하로 입력해주세요.'); // 내용이 10000자를 초과하는 경우 알림창을 띄웁니다.
				return;
			}
			if (mode === 'write') {
				fm.action = 'gongji_write.jsp?key1=UPDATE'; // mode가 write인 경우 폼의 action을 설정합니다.
			} else if (mode === 'delete') {
				if (confirm('삭제하시겠습니까?')) { // mode가 delete인 경우 삭제 여부를 확인하는 알림창을 띄웁니다.
					fm.action = 'gongji_delete.jsp'; // 확인한 경우 폼의 action을 설정합니다.
				} else {
					return; // 취소한 경우 함수를 종료합니다.
				}
			}
			fm.submit(); // 폼을 제출합니다.
		}
	</script>



	<form method="post" name="fm" action=''>
		<input type="hidden" name="key" value="<%="UPDATE"%>">
		<!-- UPDATE 값을 가지는 숨겨진 필드 -->
		<table width="650" border="1" cellspacing="0" cellpadding="5">
			<tr>
				<td><b>번호</b></td>
				<!-- 번호 -->
				<td><input type="text" name="id" size="70" value="<%=id%>"
					readonly></td>
				<!-- id 값 출력 및 읽기 전용 설정 -->
			</tr>
			<tr>
				<td><b>제목</b></td>
				<!-- 제목 -->
				<td><input type="text" name="title" size="70" maxlength="70"
					value="<%=title%>"></td>
				<!-- 제목 값 입력 -->
			</tr>
			<tr>
				<td><b>일자</b></td>
				<!-- 일자 -->
				<td><input type="text" name="date" size="70" maxlength="70"
					value="<%=date%>" readonly></td>
				<!-- 일자 값 입력 -->
			</tr>
			<tr>
				<td><b>내용</b></td>
				<!-- 내용 -->
				<td><textarea style="width: 500px; height: 250px;"
						name="content" cols="70" row="600"><%=content%></textarea></td>
				<!-- 내용 값 입력 -->
			</tr>
		</table>
		<table width="650">
			<tr>
				<td width="600"></td>
				<td><input type="button" value="취소"
					onclick="location.href='gongji_list.jsp'"></td>
				<!-- 취소 버튼 -->
				<td><input type="submit" value="쓰기"
					onclick="submitForm('write')"></td>
				<!-- 쓰기 버튼 -->
				<td><input type="submit" value="삭제"
					onclick="submitForm('delete')"></td>
				<!-- 삭제 버튼 -->
			</tr>
		</table>
	</form>

</body>

</html>
