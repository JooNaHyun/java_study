
<%@page import="domain.Gongji2"%>
<%@page import="dao.GongjiDaoImpl2"%>
<%@page import="dao.GongjiDao2"%>
<%@ page contentType="text/html; charset=utf-8" language="java" %> <!--컨텐츠 타입 및 캐릭터셋, 언어 지정-->

<html> <!--html 작성 시작-->
<head> <!--머리말 작성 시작-->
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
</head> <!--머리말 작성 끝-->
<body> <!--본문 작성 시작-->
<%
	int id = Integer.parseInt(request.getParameter("key")); // 파라미터 값 가져와 id 변수에 지정

	GongjiDao2 gongjiProgramDao = new GongjiDaoImpl2(); // DAO 객체 생성

	gongjiProgramDao.addViewCnt(id); // 조회수 1 추가
	Gongji2 gongji = gongjiProgramDao.selectOneGongji(id); // id를 통해 공지 정보 하나를 가져옴
	
	String page1 = request.getParameter("page"); // 페이지 값 받아오기
	int pageNum = 0; // 페이지 담을 변수

	if (page1 != null) // null이 아니라면
	// 페이지값을 정수형으로 받아옴
	pageNum = Integer.parseInt(request.getParameter("page"));
	
%>
<script> // 스크립트 작성 시작
function submitForm(mode) { // 제출 버튼 눌렀을 때 호출되는 함수
	if(mode == "delete") { // mode 값이 delete일 경우
		var result = confirm("삭제할까요?"); // 삭제할 것인지 선택지 제공
		if(result) { // 예를 클릭했을 경우
			location.href='gongji_delete.jsp?id=<%=id%>&page=<%=pageNum%>' // 삭제 페이지로 이동
		}
	}
	if(mode == "daetgul") { // mode 값이 댓글일 경우
		 	// 댓글 작성 페이지로 이동
			location.href='gongji_reinsert.jsp?rootid=<%=gongji.getRootid()%>&level=<%=gongji.getRelevel()%>&recnt=<%=gongji.getRecnt()%>'
	}
}
</script> <!--스크립트 작성 끝-->
<table cellspacing=1 width=600px border=1> <!--테이블 생성-->
<%

	if (gongji.getRelevel() == 0) { // relevel이 0일 경우

 		String content = gongji.getContent().replaceAll("&", "&amp;"); // &를 &amp;로 변경
		String content2 = content.replaceAll("<", "&lt;").replaceAll(">", "&gt;"); // <와 >를 각각 &lt;와 &gt;로 변경
		
		String title = gongji.getTitle().replaceAll("&", "&amp;"); // &를 &amp;로 변경
    	String title2 = title.replaceAll("<", "&lt;").replaceAll(">", "&gt;"); // <와 >를 각각 &lt;와 &gt;로 변경


		out.println("<form method=post name='fm'"); // 폼 생성
		out.println("<tr>"); // tr 태그 시작
		out.println("<th width= 70px><b>번호</b></th>"); // 번호 인덱스
		out.println("<td>"+gongji.getId()+"</td>"); // 번호 내용 출력
		out.println("</tr>"); // tr 태그 닫기
		out.println("<tr>"); // tr 태그 시작
		out.println("<th><b>제목</b></th>"); // 제목 인덱스
		out.println("<td>"+title2+"</td>"); // 제목 출력
		out.println("</tr>"); // tr 태그 닫기
		out.println("<tr>"); // tr 태그 시작
		out.println("<th><b>일자</b></th>"); // 일자 인덱스
		out.println("<td>"+gongji.getDate()+"</td>"); // 일자 출력
		out.println("</tr>"); // tr 태그 닫기
		out.println("<tr>"); // tr 태그 시작
		out.println("<th><b>조회수</b></th>"); // 조회수 인덱스
		out.println("<td>"+gongji.getViewcnt()+"</td>"); // 조회수 출력
		out.println("</tr>"); // tr 태그 닫기
		out.println("<tr>"); // tr 태그 시작
		out.println("<th><b>내용</b></th>"); // 본문 내용 인덱스
		// 본문 내용 출력
		out.println("<td><textarea readonly style=\"width: 500px; height: 250px;\">"+content+"</textarea></td>");
		out.println("</tr>"); // tr 태그 닫기
	}
	else { // 그 외에는
	out.println("<form method=post name='fm'"); // 폼 생성
	out.println("<tr>"); // tr 태그 시작
	out.println("<th width= 70px><b>번호</b></th>"); // 번호 인덱스
	out.println("<td>"+gongji.getId()+"</td>"); // 번호 내용 출력
	out.println("</tr>"); // tr 태그 닫기
	out.println("<tr>"); // tr 태그 시작
	String title = gongji.getTitle().replaceAll("<", "&lt;").replaceAll(">", "&gt;"); // &를 &amp;로 변경
 	String content = gongji.getContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;"); // <와 >를 각각 &lt;와 &gt;로 변경

	out.println("<th><b>제목</b></th>"); // 제목 인덱스
	out.println("<td>"+title+"</td>"); // 제목 출력
	out.println("</tr>"); // tr 태그 닫기
	out.println("<tr>"); // tr 태그 시작
	out.println("<th><b>일자</b></th>"); // 일자 인덱스
	out.println("<td>"+gongji.getDate()+"</td>"); // 일자 출력
	out.println("</tr>"); // tr 태그 닫기
	out.println("<tr>"); // tr 태그 시작
	out.println("<th><b>조회수</b></th>"); // 조회수
	out.println("<td>"+gongji.getViewcnt()+"</td>"); // 조회수 출력
	out.println("</tr>"); // tr 태그 닫기
	out.println("<tr>"); // tr 태그 시작
	out.println("<th><b>내용</b></th>");// 내용
	// 내용 출력
	out.println("<td><textarea readonly style=\"width: 500px; height: 250px;\">"+content+"</textarea></td>");
	out.println("</tr>"); // tr 태그 닫기
	out.println("<tr>"); // tr 태그 시작
	out.println("<th><b>원글</b></th>");//원글
	//원글 아이디 출력
	out.println("<td>"+gongji.getRootid()+"</td>");
	out.println("</tr>"); // tr 태그 닫기
	out.println("<tr>"); // tr 태그 시작
	out.println("<th><b>댓글수준</b></th>");//댓글 수준
	out.println("<td>"+gongji.getRelevel());// 댓글 수준 출력
	%>
	
	<span style="float: right; margin-right: 50px;"> <!--span 생성-->
    댓글 내 순서: <%=gongji.getRecnt()%> <!--댓글 내 순서-->
  </span> <!--스팬 닫기-->
  
	<%
	out.println("</td>"); // td 닫기
	out.println("</tr>"); // tr 닫기
	} %>
</table> <!--테이블 작성 끝-->
<table width=600> <!--테이블 생성-->
<tr> <!--tr 열기-->
	<td width=550></td> <!--td 열고 닫기-->
	<!--목록 버튼 생성-->
	<td><input type=button value="목록" onclick="location.href='gongji_list.jsp?key=<%=id%>'"></td>
	 <!--댓글 버튼 생성-->
	 <td><input type=button value="댓글"onclick="submitForm('daetgul')"></td>
	 <!--수정 버튼 생성-->
	 <td><input type=button value="수정" onclick="location.href='gongji_update.jsp?key=<%=id%>'"></td>
	 <!--삭제 버튼 생성-->
	 <td><input type=button value="삭제" onclick="submitForm('delete')"></td>
</table> <!--테이블 작성 끝-->
</body> <!--body 작성 끝-->
</html> <!--html 작성 끝-->