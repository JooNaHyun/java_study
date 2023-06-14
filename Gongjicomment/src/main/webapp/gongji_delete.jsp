
<%@page import="dao.GongjiDaoImpl2"%>
<%@page import="dao.GongjiDao2"%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!--컨텐츠 타입 및 캐릭터셋, 언어 지정-->

<html>
<!--html 작성 시작-->
<body>
	<!--본문 작성 시작-->
	<%
	int id = Integer.parseInt(request.getParameter("id")); // id 값 받아오기

	GongjiDao2 gongjiProgramDao = new GongjiDaoImpl2(); // DAO 객체 생성

	gongjiProgramDao.deleteOneGongji(id); // 해당 id의 공지 DB에서 삭제

	int pageValue = Integer.parseInt(request.getParameter("page")); // 페이지 값 받아옴
	%>
	<script> // 스크립트 작성 시작
alert('삭제되었습니다.'); // 삭제되었다는 안내문 출력
window.location='gongji_list.jsp?key=<%=id%>&page=<%=pageValue%>'; // 리스트에서 해당 id가 존재하는 페이지로 이동
	</script>
	<!--스크립트 작성 끝-->
</body>
<!--본문 작성 끝-->
</html>
<!--html 작성 끝-->