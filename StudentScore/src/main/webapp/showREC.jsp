<%@page import="kr.ac.kopo.ctc.kopo31.domain.StudentScore"%>
<%@page import="kr.ac.kopo.ctc.kopo31.dao.StudentScoreDaoImpl"%>
<%@page import="kr.ac.kopo.ctc.kopo31.dao.StudentScoreDao"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- 문자 인코딩을 UTF-8로 설정한다. -->
<%@ page contentType="text/html; charset=utf-8"%>
<!-- 페이지의 콘텐츠 유형을 HTML이며, 문자 인코딩을 UTF-8로 설정한다. -->
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<!-- Java의 SQL, JDBC, I/O 라이브러리를 가져온다. -->
<html>
<head>
<SCRIPT LANGUAGE="javaScript">
	// 자바스크립트 함수 submitForm 선언
	function submitForm(mode) {
		const form = document.getElementById('myform');

		if (mode === 'update') {
			const name = form.elements.name.value;
			// 입력 양식(form)의 name 요소의 값을 name 변수에 저장

			const kor = form.elements.korean.value;
			// 입력 양식(form)의 korean 요소의 값을 kor 변수에 저장

			const eng = form.elements.english.value;
			// 입력 양식(form)의 english 요소의 값을 eng 변수에 저장

			const mat = form.elements.mathmatic.value;
			// 입력 양식(form)의 mathmatic 요소의 값을 mat 변수에 저장

			const pattern1 = /^([a-zA-Z가-힣]+|[a-zA-Z0-9가-힣]+)$/;
			// 한글 또는 영어만 입력 가능한 패턴1을 정규식으로 표현한 것
			// 한글, 영어, 숫자 조합도 입력 가능

			const pattern2 = /^(?:100|[1-9]?[0-9])$/;
			// 0부터 100 사이의 정수만 입력 가능한 패턴2를 정규식으로 표현한 것

			// 아래부터는 입력값의 유효성 검사를 진행

			if (name.trim() === '' || kor.trim() === '' || eng.trim() === ''
					|| mat.trim() === '') {
				alert('데이터를 모두 입력해주세요.');
				// 입력 필드 중 어느 하나라도 비어있는 경우, '데이터를 모두 입력해주세요.' 알림창을 표시하고 함수 종료
				return;
			}

			if (!pattern1.test(name)) {
				alert('이름은 정확한 한글 또는 영어만 입력 가능합니다.');
				// 이름이 패턴1과 일치하지 않는 경우, '이름은 정확한 한글 또는 영어만 입력 가능합니다.' 알림창을 표시하고 함수 종료
				return;
			}

			if (!pattern2.test(kor) || !pattern2.test(eng)
					|| !pattern2.test(mat)) {
				alert('국어, 영어, 수학 점수는 0부터 100 사이의 정수만 입력 가능합니다.');
				// 국어, 영어, 수학 점수 중 하나라도 패턴2와 일치하지 않는 경우,
				// '국어, 영어, 수학 점수는 0부터 100 사이의 정수만 입력 가능합니다.' 알림창을 표시하고 함수 종료
				return;
			}

			if (name.length > 20) {
				alert('이름은 20자 이하만 입력 가능합니다.');
				// 이름이 20자를 초과하는 경우, '이름은 20자 이하만 입력 가능합니다.' 알림창을 표시하고 함수 종료
				return;
			}

			form.action = 'updateDB.jsp'; // 폼의 액션을 'updateDB.jsp'로 설정
			form.submit(); // 폼 제출
		} else if (mode === 'delete') {
			form.action = 'deleteDB.jsp'; // 폼의 액션을 'deleteDB.jsp'로 설정
			form.submit(); // 폼 제출
		}
	}

	function go2() {
		const form = document.getElementById('search1'); // search1 ID를 가진 폼 요소를 가져옴
		const searchid = form.elements.searchid.value; // 검색 ID 입력란의 값을 가져옴
		const pattern1 = /^\d+$/; // 숫자만 입력 가능한 패턴1
		const pattern2 = /^.+$/; // 빈값이 아닌지 확인하는 패턴2
		const pattern3 = /^[^.]+$/; // 점이 없는지 확인하는 패턴3

		if (!(pattern1.test(searchid)) || !(pattern2.test(searchid))
				|| !(pattern3.test(searchid))) {
			alert("잘못된 입력입니다"); // 검색 ID가 패턴과 일치하지 않을 경우 잘못된 입력 경고 메시지 출력
		} else {
			form.action = "showREC.jsp"; // 폼의 액션을 "showREC.jsp"로 설정
			form.submit(); // 폼 제출
		}
	}
</SCRIPT>
</head>
<body>

	<%
	try {
		String name = "", studentid = "", kor = "", eng = "", mat = "";
		// name, studentid, kor, eng, mat 변수를 빈 문자열("")로 초기화

		String ctmp = request.getParameter("searchid");
		// ctmp 변수에 "searchid" 파라미터의 값을 저장

		if (ctmp.length() == 0)
			ctmp = "0";
		// ctmp의 길이가 0인 경우, ctmp에 "0"을 저장
		// 아무 학번도 없이 조회할 경우

		StudentScoreDao studentScoreDao = new StudentScoreDaoImpl();
		StudentScore studentScore = new StudentScore();

		try {
			studentScore = studentScoreDao.selectOne(Integer.parseInt(ctmp));
			// studentScoreDao를 사용하여 입력된 학번에 해당하는 학생 정보를 조회하여 studentScore에 저장
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (studentScore.getName() == null) {
			name = "해당이름없음";
			// 학생 정보가 없는 경우 name에 "해당이름없음"을 설정
		} else {
			name = studentScore.getName();
			studentid = Integer.toString(studentScore.getStudentid());
			kor = Integer.toString(studentScore.getKor());
			eng = Integer.toString(studentScore.getEng());
			mat = Integer.toString(studentScore.getMat());
			// 학생 정보가 있는 경우 해당 정보를 변수에 저장
		}
	%>
	<h1>성적 조회 후 정정 / 삭제</h1>
	<!-- 웹 페이지의 제목을 나타내는 제목 태그 -->
	<form method='post' id="search1">
		<!-- 아래 폼을 다 채우고 실행은 insertDB.jsp로 간다. -->
		<table cellspacing=1 width=400 border=0>
			<!-- 테이블의 간격을 1로 설정하고, 너비는 400, 테두리는 없음 -->
			<tr>
				<!-- 행 시작 -->
				<td width=300><p align=center>조회할 학번</p></td>
				<!-- '조회할 학번'이라는 텍스트가 위치한 열, 너비는 300 -->
				<td width=100><p align=center>
						<input type='text' name='searchid' value=''>
					</p></td>
				<!-- name 속성이 'searchid'인 텍스트 필드가 위치한 열, 너비는 100, 기본값은 없음 -->
				<td width=100><input type="button" value="조회" onclick="go2()"></td>
				<!-- '조회'라는 버튼이 위치한 열 -->
			</tr>
			<!-- 행 끝 -->
		</table>
	</form>
	<form method='post' id='myform' name='myform'>
		<!-- 폼을 POST 방식으로 전송하며, action 속성에는 'myform' 페이지로 이동하도록 설정함 -->
		<table cellspacing="0" cellpadding="1" width=100% border=1
			align=center>
			<tr>
				<!--행 시작-->
				<td align=center>이름</td>
				<!-- '이름'이라는 라벨이 위치한 열 -->
				<td align=center><input type='text' name='name'
					value='<%=name%>'></td>
				<!-- name 속성이 'name'인 텍스트 필드, 기본값은 'name' 변수의 값 -->
			</tr>
			<!--행 끝-->
			<tr>
				<!--행 시작-->
				<td align=center>학번</td>
				<!-- '학번'이라는 라벨이 위치한 열 -->
				<td align=center><input type='text' name='studentid'
					value='<%=studentid%>' readonly></td>
				<!-- name 속성이 'studentid'인 읽기전용 텍스트 필드, 기본값은 'studentid' 변수의 값 -->
			</tr>
			<!--행 끝-->
			<tr>
				<!--행 시작-->
				<td align=center>국어</td>
				<!-- '국어'이라는 라벨이 위치한 열 -->
				<td align=center><input type='text' name='korean'
					value='<%=kor%>'></td>
				<!-- name 속성이 'korean'인 텍스트 필드, 기본값은 'kor' 변수의 값 -->
			</tr>
			<!--행 끝-->
			<tr>
				<!--행 시작-->
				<td align=center>영어</td>
				<!-- '영어'이라는 라벨이 위치한 열 -->
				<td align=center><input type='text' name='english'
					value='<%=eng%>'></td>
				<!-- name 속성이 'english'인 텍스트 필드, 기본값은 'eng' 변수의 값 -->
			</tr>
			<!--행 끝-->
			<tr>
				<!--행 시작-->
				<td align=center>수학</td>
				<!-- '수학'이라는 라벨이 위치한 열 -->
				<td align=center><input type='text' name='mathmatic'
					value='<%=mat%>'></td>
				<!-- name 속성이 'mathmatic'인 텍스트 필드, 기본값은 'mat' 변수의 값 -->
			</tr>
			<!--행 끝-->
		</table>
		<%
		if (!name.equals("해당이름없음")) {
			// 학번이 비어있지 않은 경우에만 실행
			out.println("<table cellspacing=1 width=100% border=0>");
			// 버튼을 위치시키기 위한 테이블 생성
			out.println("<tr>");
			// 행 생성
			out.println("<td></td>");
			// 빈 공간을 위한 빈 열
			out.println("<td><p align=left><input type = button value=\"수정\" OnClick=\"submitForm('update')\"</p></td>");
			// 수정 버튼을 생성하고, 버튼의 속성을 설정한다.
			// 버튼의 타입은 'button'으로 지정되며, 텍스트는 '수정'으로 표시된다.
			// 수정 버튼 클릭 시 함수 'submitForm()'을 호출하고, 인자로 'update'를 전달한다.
			//\"수정\"은 문자열 안에 큰따옴표를 포함시키기 위해 사용되었음
			out.println("<td><p align=left><input type = button value=\"삭제\" OnClick=\"submitForm('delete')\"</p></td>");
			// 삭제 버튼을 생성하고, 버튼의 속성을 설정한다.
			// 버튼의 타입은 'button'으로 지정되며, 텍스트는 '삭제'로 표시된다.
			// 삭제 버튼 클릭 시 함수 'submitForm()'을 호출하고, 인자로 'delete'를 전달한다.
			//\"삭제\"은 문자열 안에 큰따옴표를 포함시키기 위해 사용되었음
			out.println("</tr>");
			// 행 종료
			out.println("</table>");
			// 테이블 종료
		}
		%>
	</form>
	<%
	} catch (Exception e) {
	out.println(e);//오류 출력
	}
	%>
</body>
</html>
