<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- 문자 인코딩을 UTF-8로 설정한다. -->
<%@ page contentType="text/html; charset=utf-8"%>
<!-- 페이지의 콘텐츠 유형을 HTML이며, 문자 인코딩을 UTF-8로 설정한다. -->
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<!-- Java의 SQL, JDBC, I/O 라이브러리를 가져온다. -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<html>
<head>
<!-- 문서 헤드(머리글) 영역 시작 -->
</head>
<!-- 문서 헤드(머리글) 영역 종료 -->
<body>
	<!-- 문서 본문 영역 시작 -->
	<h1>
		<center>JSP Database 실습 1</center>
	</h1>
	<!--JSP Database실습 1출력-->
	<%
	String data;
	int cnt = 0;

	// FileReader 객체를 생성하여 "C:/Users/nahyun/eclipse-workspace/StudentScore/src/main/webapp/cnt.txt" 파일을 읽어옵니다.
	FileReader f1 = new FileReader("C:/Users/nahyun/eclipse-workspace/StudentScore/src/main/webapp/cnt.txt");

	// StringBuffer 객체를 생성합니다.
	StringBuffer sb = new StringBuffer();

	int ch = 0;

	// 파일에서 문자를 하나씩 읽어서 StringBuffer에 추가합니다.
	while ((ch = f1.read()) != -1) {
		sb.append((char) ch);
	}

	// StringBuffer를 문자열로 변환하고, 양 끝의 공백과 개행문자를 제거합니다.
	data = sb.toString().trim().replace("\n", "");

	// FileReader를 닫습니다.
	f1.close();

	// data 변수의 값을 정수로 변환하여 cnt 변수에 저장합니다.
	cnt = Integer.parseInt(data);

	// cnt 변수를 1 증가시킵니다.
	cnt++;

	// cnt 변수를 다시 문자열로 변환하여 data 변수에 저장합니다.
	data = Integer.toString(cnt);

	// "<br><br>현재 홈페이지 방문조회수는 ["+data+"]입니다</br>" 문자열을 출력합니다.
	out.println("<br><br>현재 홈페이지 방문조회수는 [" + data + "]입니다</br>");

	// FileWriter 객체를 생성하여 "C:/Users/nahyun/eclipse-workspace/StudentScore/src/main/webapp/cnt.txt" 파일을 쓰기 모드로 엽니다.
	FileWriter f12 = new FileWriter("C:/Users/nahyun/eclipse-workspace/StudentScore/src/main/webapp/cnt.txt", false);

	// data 변수의 값을 파일에 씁니다.
	f12.write(data);

	// FileWriter를 닫습니다.
	f12.close();
	%>
</body>
<!-- 문서 본문 영역 종료 -->
</html>
<!-- HTML 문서 종료 -->
