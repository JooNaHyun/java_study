<%@page import="java.text.SimpleDateFormat"%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.Date"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<html>

<head>
<style>
body {
	background-color: #f1f8e9; /* 배경색 설정 */
	font-family: Arial, sans-serif; /* 폰트 설정 */
	margin: 0; /* 바깥쪽 여백 제거 */
	padding: 20px; /* 안쪽 여백 설정 */
}

h1 {
	text-align: center; /* 가운데 정렬 */
	color: #4caf50; /* 글자색 설정 */
}

table {
	width: 1000px; /* 테이블 너비 100% */
	border-collapse: collapse; /* 테이블 테두리 합치기 */
	margin-bottom: 20px; /* 아래쪽 여백 설정 */
	margin-left: auto;
	margin-right: auto;
}

th, td {
	padding: 8px; /* 셀 안쪽 여백 설정 */
	text-align: center; /* 가운데 정렬 */
	border-bottom: 1px solid #ddd; /* 아래쪽 테두리 설정 */
}

th {
	background-color: #4caf50; /* 배경색 설정 */
	color: #fff; /* 글자색 설정 */
}

input[type="text"], input[type="file"] {
	padding: 6px 10px; /* 입력 필드 안쪽 여백 설정 */
	font-size: 16px; /* 글자 크기 설정 */
	border: none; /* 테두리 제거 */
	border-radius: 3px; /* 테두리 둥글게 설정 */
}

input[type="button"] {
	padding: 6px 10px; /* 버튼 안쪽 여백 설정 */
	font-size: 16px; /* 글자 크기 설정 */
	background-color: #4caf50; /* 배경색 설정 */
	color: #fff; /* 글자색 설정 */
	border: none; /* 테두리 제거 */
	border-radius: 3px; /* 테두리 둥글게 설정 */
	cursor: pointer; /* 커서 모양 변경 */
}
</style>

<script language="JavaScript">
function showPreview(event) { // event를 매개변수로 받는 함수 선언
	var file = event.target.files[0];
    var fileName = file.name;
    var fileExtension = fileName.split('.').pop().toLowerCase();
    
    // 허용할 이미지 파일 확장자 목록
    var allowedExtensions = ['jpg', 'jpeg', 'png', 'gif'];
    
    // 허용된 확장자인지 확인
    if (!allowedExtensions.includes(fileExtension)) {
        alert('이미지 파일만 업로드할 수 있습니다.');
        event.target.value = ''; // 파일 선택 창 초기화
        return;
    }
    var reader = new FileReader(); // FileReader 객체 생성 (파일 내용 읽음)
    reader.onload = function() { // 이벤트 핸들러 정의 (파일 읽기 완료시 실행)
      var imgElement = document.getElementById('preview'); // preview id를 가진 이미지 엘리먼트 가져옴
      imgElement.src = reader.result; // 파일 내용 읽어온 후 이미지엘리먼트 src에 설정
    };
    reader.readAsDataURL(event.target.files[0]); // 선택한 파일을 data url 형식으로 읽어옴
  }

function submitForm() {
    const id = fm.elements.id.value; // 상품번호 필드 값 가져오기
    const name = fm.elements.name.value; // 제목 필드 값 가져오기
    const stocknum = fm.elements.stocknum.value; // 재고현황 필드 값 가져오기
    const content = fm.elements.content.value; // 상품설명 필드 값 가져오기
    const alphanumericPattern = /^[a-zA-Z0-9]+$/;
    if (!alphanumericPattern.test(id)) {
      alert("상품번호는 영문과 숫자 조합으로만 입력해주세요.");
      return;
    }


    if (id.trim() === '' || name.trim() === '' || stocknum.trim() === '' || content.trim() === '') { // 입력 창이 비어있으면
       alert("데이터를 모두 입력해주세요."); // 해당 메세지 출력
       return; // 함수 실행 종료
    }
    
   
    if (name.length > 20) { // 이름이 20자 이상이면
       alert("상품명은 20자 이하로 입력해주세요."); // 해당 메세지 출력
       return; // 함수 실행 종료
    }
    
    // 정규식을 사용하여 한글 자음 또는 모음이 단독으로 입력되었는지 확인합니다.
    const koreanPattern = /^[ㄱ-ㅎㅏ-ㅣ]+$/;
    if (koreanPattern.test(name)) {
        alert("단어로 입력할 수 없습니다."); // 해당 메세지 출력
        return; // 함수 실행 종료
    }
     
    // 정규식을 사용하여 0부터 10000 이하의 정수인지 확인합니다.
    const numberPattern = /^[0-9]{1,5}$/;
    if (!numberPattern.test(stocknum) || stocknum < 0 || stocknum > 10000) {
        alert("재고현황은 0부터 10000 이하의 정수로 입력해주세요."); // 해당 메세지 출력
        return; // 함수 실행 종료
    }
    
    fm.action = "product_wget.jsp"; // 폼이 제출될 경로
    fm.submit(); // 폼 제출
    
    alert("등록되었습니다."); // 등록되었습니다. 알리창 띄우기
}


</script>


<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

// 요청과 응답의 인코딩을 UTF-8로 설정합니다.
Date date = new Date(); // 현재 날짜를 가져옵니다.
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 형식을 지정합니다.
String formattedDate = dateFormat.format(date); // 현재 날짜를 형식에 맞게 포맷팅합니다.
%>

<body>
	<form method="post" name="fm" enctype="multipart/form-data">
		<table width="650" border="1" cellspacing="0" cellpadding="5">
			<tr>
				<td><b>상품 번호</b></td>
				<td><input type="text" name="id" value=""></td>
				<!-- 상품 번호를 입력하는 필드입니다. -->
			</tr>
			<tr>
				<td><b>상품명</b></td>
				<td><input type="text" name="name" size="70" maxlength="70"></td>
				<!-- 상품명을 입력하는 필드입니다. 최대 길이는 70자입니다. -->
			</tr>
			<tr>
				<td><b>재고현황</b></td>
				<td><input type="text" name="stocknum" size="70" maxlength="70"></td>
				<!-- 재고현황을 입력하는 필드입니다. 최대 길이는 70자입니다. -->
			</tr>
			<tr>
				<td><b>상품등록일</b></td>
				<td><%=formattedDate%></td>
				<!-- 현재 날짜를 출력합니다. -->
			</tr>
			<tr>
				<td><b>재고등록일</b></td>
				<td><%=formattedDate%></td>
				<!-- 현재 날짜를 출력합니다. -->
			</tr>

			<tr>
				<td><b>상품설명</b></td>
				<td><input type="text" name="content" size="70" maxlength="70"></td>
				<!-- 상품 설명을 입력하는 필드입니다. 최대 길이는 70자입니다. -->
			</tr>
			<tr>
				<td><b>상품사진</b></td>
				<td><input type="file" name="photo"
					onchange="showPreview(event)"> <img id="preview" src="#"
					alt="" style="max-width: 300px;"></td>
				<!-- 두번째 열 입력 -->
				<!-- 상품 사진을 업로드하는 필드입니다. -->
			</tr>

		</table>
		<table width="650">
			<tr>
				<td width="600"></td>
				<td><input type="button" value=" 완료" OnClick="submitForm()"></td>
				<!-- 폼을 제출하는 버튼입니다. 클릭 시 submitForm() 함수가 실행됩니다. -->
			</tr>
		</table>
	</form>
</body>

</html>