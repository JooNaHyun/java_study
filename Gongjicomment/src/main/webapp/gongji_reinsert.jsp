
<%@page import="dao.GongjiDaoImpl2"%>
<%@page import="dao.GongjiDao2"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<!--구동에 필요한 라이브러리 임포트-->
<%@page import="java.time.LocalDate"%>
<!--구동에 필요한 라이브러리 임포트-->
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!--컨텐츠 타입 및 캐릭터셋, 언어 지정-->

<html>
<!--html 작성 시작-->
<head>
<!--머리말 작성 시작-->
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
<script>
	function submitForm() { // 제출 버튼 눌렀을 때 호출되는 함수

		const title = fm.elements.title.value; // 제목 불러옴
		const content = fm.elements.content.value; // 본문 내용 불러옴

		let str = ""; // 오류 안내문 담을 string 변수

		if (title.trim() == "" || content.trim() == "" // 제목과 본문이 비었을 경우
				|| title.length > 200 // 제목 길이가 200자를 넘길 경우
				|| content.length > 10000) { // 본문 길이가 1000자를 넘길 경우
			if (title.trim() == "" || content.trim() == "") { // 공백이 있을 경우
				str = str + "데이터를 입력해주세요\n"; // 안내문 추가
			}
			if (title.length > 100) { // 제목 길이가 200자를 넘길 경우
				str = str + "제목을 100자 이하로 작성해주세요\n"; // 안내문 추가
			}
			if (content.length > 10000) { // 본문 길이가 1000자를 넘길 경우
				str = str + "내용을 10000자 이하로 작성해주세요\n"; // 안내문 추가			
			}

			alert(str); // 안내문 출력
		} else { // 에러 발생하지 않았을 경우
			var result = confirm('등록하시겠습니까?'); // 게시할 것인지 물어봄

			if (result) { // 게시를 선택한 경우
				fm.action = "gongji_write.jsp"; // 폼 경로 설정
				fm.submit(); // 폼 제출
			}
		}
	}
	
	
</script>
<!--스크립트 작성 끝-->
</head>
<!--머릿말 작성 끝-->
<body>
	<!--본문 작성 끝-->
	<%
	LocalDate now = LocalDate.now(); // 현재 날짜 구하기

	// 포맷 정의
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	// 포맷 적용
	String formatedNow = now.format(formatter);

	int rootid = Integer.parseInt(request.getParameter("rootid")); // rootid 받아옴
	int level = Integer.parseInt(request.getParameter("level")); // relevel 받아옴

	GongjiDao2 gongjiProgramDao = new GongjiDaoImpl2(); // DAO 객체 생성
	int cnt = Integer.parseInt(request.getParameter("recnt")); // recnt 받아옴

	int recnt = gongjiProgramDao.getRecnt(rootid, level, cnt); // 모체의 레벨과 cnt
	%>
	<form method=get name='fm'>
		<!--폼 생성-->
		<table width=600 border=1 cellspacing=0 cellpadding=5>
			<!--테이블 생성-->
			<tr>
				<!--tr 태그 시작-->
				<th><b>번호</b></th>
				<!--번호-->
				<td>댓글(insert)<input type=hidden name=key value='INSERT'></td>
				<!--key 전달-->
			</tr>
			<!--tr 태그 끝-->
			<tr>
				<!--tr 태그 시작-->
				<th><b>제목</b></th>
				<!--제목-->
				<!--제목 출력-->
				<td><input type=text name=title size=70 maxlength=70
					placeholder="제목을 입력하세요."></td>
			</tr>
			<!--tr 태그 끝-->
			<tr>
				<!--tr 태그 시작-->
				<th><b>일자</b></th>
				<!--오늘 일자-->
				<td><%=formatedNow%></td>
				<!--오늘 일자-->
				<input type=hidden name=date value='<%=formatedNow%>'>
				<!--오늘 일자-->
			</tr>
			<!--tr 태그 끝-->
			<tr>
				<!--tr 태그 시작-->
				<th><b>내용</b></th>
				<!--내용-->
				<!--내용 출력-->
				<td><textarea style='width: 500px; height: 250px;' name=content
						cols=70 row=600 placeholder="본문 내용을 입력하세요."></textarea></td>
			</tr>
			<!--tr 태그 끝-->
			<tr>
				<!--tr 태그 시작-->
				<th><b>원글</b></th>
				<!--원글 id-->
				<td><%=rootid%></td>
				<!--원글 id cnffur-->
				<input type=hidden name=rootid value=<%=rootid%>>
				<!--원글 id wjsekf-->
			</tr>
			<!--tr 태그 끝-->
			<tr>
				<!--tr 태그 시작-->
				<th><b>댓글수준</b></th>
				<!--댓글수준-->
				<td>
					<!--td 닫기--> <%=level + 1%> <!--댓글수준--> <span
					style="float: right; margin-right: 50px;"> <!--span 생성--> 댓글
						내 순서: <%=recnt%> <!--댓글 내 순서 출력--> <input type=hidden name=relevel
						value=<%=level + 1%>> <!--relevel--> <input type=hidden
						name=recnt value=<%=recnt%>> <!--recnt-->
				</span>
				<!--span 닫기-->
				</td>
				<!--td 닫기-->

			</tr>
			<!--tr 태그 끝-->
		</table>
		<!--테이블 작성 끝-->

		<table width=600>
			<!--테이블 생성-->
			<tr>
				<!--tr 태그 시작-->
				<td width=550></td>
				<!--td 열고 닫기-->
				<td><input type=button value="취소"
					onclick="history.back()"></td>
				<!--취소 버튼 생성-->
				<td><input type=button value="쓰기"
					 onclick="submitForm()"></td>
				<!--쓰기 버튼 생성-->
		</table>
		<!--테이블 작성 끝-->
	</form>
	<!--폼 작성 끝-->
</body>
<!--본문 작성 끝-->
</html>
<!--html 작성 끝-->