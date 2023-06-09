<%@page import="kr.ac.kopo.ctc.kopo31.domain.StudentScore"%>
<%@page import="kr.ac.kopo.ctc.kopo31.dao.StudentScoreDaoImpl"%>
<%@page import="kr.ac.kopo.ctc.kopo31.dao.StudentScoreDao"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- 문자 인코딩을 UTF-8로 설정한다. -->
<%@ page contentType="text/html; charset=utf-8"%>
<!-- 페이지의 콘텐츠 유형을 HTML이며, 문자 인코딩을 UTF-8로 설정한다. -->
<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.net.*"%>
<!-- Java의 SQL, JDBC, I/O 라이브러리를 가져온다. -->


<%
try {
	request.setCharacterEncoding("UTF-8"); // 요청의 문자 인코딩을 UTF-8로 설정합니다.
	String name = request.getParameter("name"); // "name" 파라미터의 값을 가져와 `name` 변수에 저장합니다.
	String kor = request.getParameter("korean"); // "korean" 파라미터의 값을 가져와 `kor` 변수에 저장합니다.
	String eng = request.getParameter("english"); // "english" 파라미터의 값을 가져와 `eng` 변수에 저장합니다.
	String mat = request.getParameter("mathmatic"); // "mathmatic" 파라미터의 값을 가져와 `mat` 변수에 저장합니다.

	StudentScoreDao studentScoreDao = new StudentScoreDaoImpl(); // StudentScoreDaoImpl 객체를 생성하여 `studentScoreDao` 변수에 저장합니다.
	StudentScore studentScore = new StudentScore(); // StudentScore 객체를 생성합니다.
	studentScore.setName(name); // 객체의 이름 속성을 `name` 변수의 값으로 설정합니다.
	studentScore.setKor(Integer.parseInt(kor)); // 객체의 국어 점수 속성을 `kor` 변수의 정수로 변환한 값으로 설정합니다.
	studentScore.setEng(Integer.parseInt(eng)); // 객체의 영어 점수 속성을 `eng` 변수의 정수로 변환한 값으로 설정합니다.
	studentScore.setMat(Integer.parseInt(mat)); // 객체의 수학 점수 속성을 `mat` 변수의 정수로 변환한 값으로 설정합니다.

	StudentScore printResult = studentScoreDao.create(studentScore); // `studentScoreDao`를 사용하여 학생 성적을 생성하고 생성된 결과를 `printResult` 변수에 저장합니다.
	int studentid = printResult.getStudentid(); // `printResult` 객체에서 학생 ID를 가져와 `studentid` 변수에 저장합니다.
%>
<html>
<head>
</head>
<body>
	<h1>성적입력추가완료</h1>
	<!-- 웹 페이지의 제목을 나타내는 제목 태그 -->
	<form method='post' action='inputForm1.html'>
		<!-- 폼을 POST 방식으로 전송하며, action 속성에는 'inputForm1.html' 페이지로 이동하도록 설정함 -->

		<div>
			<p align=left>
				<button onclick="location.href = './inputForm1.html'">뒤로가기</button>
			</p>
		</div>

		<table cellspacing="0" cellpadding="1" width=100% border=1
			align=center>
			<tr>
				<!--행 시작-->
				<td align=center>이름</td>
				<!-- '이름'이라는 라벨이 위치한 열 -->
				<td align=center><input type='text' name='name'
					value='<%=name%>' readonly> <!-- name 속성이 'name'인 읽기 전용 텍스트 필드, 기본값은 'cTmpHan' 변수의 값 -->
				</td>
			</tr>
			<!--행 끝-->
			<tr>
				<!--행 시작-->
				<td align=center>학번</td>
				<!-- '학번'이라는 라벨이 위치한 열 -->
				<td align=center><input type='text' name='studentid'
					value='<%=studentid%>' readonly> <!-- name 속성이 'studentid'인 읽기 전용 텍스트 필드, 기본값은 'NewStdId' 변수의 값 -->
				</td>
			</tr>
			<!--행 끝-->
			<tr>
				<!--행 시작-->
				<td align=center>국어</td>
				<!-- '국어'라는 라벨이 위치한 열 -->
				<td align=center><input type='text' name='kor' value='<%=kor%>'
					readonly> <!-- name 속성이 'korean'인 읽기 전용 텍스트 필드, 기본값은 'korean' 파라미터의 값 -->
				</td>
			</tr>
			<!--행 끝-->
			<tr>
				<!--행 시작-->
				<td align=center>영어</td>
				<!-- '영어'라는 라벨이 위치한 열 -->
				<td align=center><input type='text' name='eng' value='<%=eng%>'
					readonly> <!-- name 속성이 'english'인 읽기 전용 텍스트 필드, 기본값은 'english' 파라미터의 값 -->
				</td>
			</tr>
			<!--행 끝-->
			<tr>
				<!--행 시작-->
				<td align=center>수학</td>
				<!-- '수학'이라는 라벨이 위치한 열 -->
				<td align=center><input type='text' name='mat' value='<%=mat%>'
					readonly></td>
			</tr>
			<!--행 끝-->
		</table>
	</form>
	<%
	} catch (Exception e) {
	out.println(e);//오류 출력
	}
	%>
</body>
</html>
