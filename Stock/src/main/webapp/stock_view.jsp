
<%@page import="dao.StockDaoImpl"%>
<%@page import="dao.StockDao"%>
<%@page import="domain.Stock"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<html>

<head>
<style>
body {
	/* 배경색 설정 */
	background-color: #f1f8e9;
	/* 글꼴 설정 */
	font-family: Arial, sans-serif;
	/* body 요소의 외부 여백 설정 */
	margin: 0;
	/* body 요소의 내부 여백 설정 */
	padding: 20px;
}

h1 {
	/* 제목 정렬 */
	text-align: center;
	/* 제목 색상 설정 */
	color: #4caf50;
}

table {
	/* 테이블의 너비를 100%로 설정 */
	width: 1000px;
	/* 테이블 셀들이 경계를 공유하도록 설정 */
	border-collapse: collapse;
	/* 테이블과 아래 요소 사이의 여백 설정 */
	margin-bottom: 20px;
	margin-left: auto;
	margin-right: auto;
}

th, td {
	/* 셀의 패딩 설정 */
	padding: 8px;
	/* 셀 내용 가운데 정렬 */
	text-align: center;
	/* 셀의 아래쪽에 1px 실선 테두리 설정 */
	border-bottom: 1px solid #ddd;
}

th {
	/* 테이블 헤더의 배경색 설정 */
	background-color: #4caf50;
	/* 테이블 헤더의 글자색 설정 */
	color: #fff;
}
</style>

<%
// 한글 인코딩 설정
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

// key 파라미터로부터 상품 ID 값을 받아옴
String id = request.getParameter("key");

// Stock 객체와 StockDao 객체 생성
Stock stock = new Stock();
StockDao stockDao = new StockDaoImpl();

// 상품 ID에 해당하는 재고 정보를 조회
Stock stockList = stockDao.selectOneStock(id);

// 조회한 재고 정보가 없는 경우
if (stockList == null) {
	// 경고창을 띄우고 Stock_list.jsp 페이지로 이동하는 스크립트 출력
	out.println("<script>alert('없는 상품 번호입니다.'); location.href='Stock_list.jsp';</script>");
} else {
	// 조회한 재고 정보가 있는 경우

	// 재고 정보를 변수에 저장
	String name = stockList.getName();
	int stocknum = stockList.getStocknum();
	String regdate = stockList.getRegdate();
	String checkdate = stockList.getCheckdate();
	String content = stockList.getText();
	String photo = stockList.getPhoto();
%>
<script>
	function confirmDelete() {
		// 삭제를 확인하는 팝업창이 나타날 때 실행되는 함수

		if (confirm("삭제하시겠습니까?")) {
			// 확인 버튼을 눌렀을 때

			alert("삭제되었습니다."); // 삭제되었다는 알림 메시지 출력

			// 삭제를 처리하는 페이지로 이동하는 액션을 설정하고 폼을 제출
			fm.action = "product_delete.jsp?key=<%=id%>";
			// 삭제를 처리할 페이지 주소 설정
			fm.submit(); // 폼 제출
		}
	}
</script>
<body>

	<hr>
	<form method=post name='fm'>
		<table width=650 border=1 cellspacing=0 cellpadding=5>
			<tr>
				<td><b>상품번호</b></td>
				<!-- 상품번호 레이블 표시 -->
				<td><%=id.replaceAll("<", "&lt;").replaceAll(">", "&gt;")%></td>
				<!-- id 변수 값 출력. HTML 특수 문자 처리 -->
			</tr>

			<tr>
				<td><b>상품명</b></td>
				<!-- 상품명 레이블 표시 -->
				<td><%=name.replaceAll("<", "&lt;").replaceAll(">", "&gt;")%></td>
				<!-- name 변수 값 출력. HTML 특수 문자 처리 -->
			</tr>
			<tr>
				<td><b>재고현황</b></td>
				<!-- 재고현황 레이블 표시 -->
				<td><%=stocknum%></td>
				<!-- stocknum 변수 값 출력 -->
			</tr>
			<tr>
				<td><b>상품등록일</b></td>
				<!-- 상품등록일 레이블 표시 -->
				<td><%=checkdate%></td>
				<!-- checkdate 변수 값 출력 -->
			</tr>
			<tr>
				<td><b>재고등록일</b></td>
				<!-- 재고등록일 레이블 표시 -->
				<td><%=regdate%></td>
				<!-- regdate 변수 값 출력 -->
			</tr>
			<tr>
				<td><b>상품설명</b></td>
				<!-- 상품설명 레이블 표시 -->
				<td><%=content.replaceAll("<", "&lt;").replaceAll(">", "&gt;")%></td>
				<!-- content 변수 값 출력. HTML 특수 문자 처리 -->
			</tr>

			<tr>
				<td><b>상품사진</b></td>
				<!-- 상품사진 레이블 표시 -->

				<%
				if (stockList.getPhoto() == null || stockList.getPhoto().equals("./image/null")) {
				%>
				<td><img src="image/null.png"></td>
				<!-- stockList의 photo 값이 null이거나 "./image/null"인 경우, 대체 이미지 출력 -->
				<%
				} else {
				%>
				<td><img src="<%=photo%>"></td>
				<!-- 그 외의 경우, photo 변수 값으로 이미지 출력 -->
				<%
				}
				%>

			</tr>

		</table>
		<table width=650>
			<tr>
				<!-- 테이블 행 시작 -->
				<!-- 비어있음 -->
			</tr>
			<!-- 테이블 행 종료 -->
		</table>
		<!-- 첫 번째 테이블 종료 -->

		<table width="650">
			<tr>
				<!-- 테이블 행 시작 -->
				<td width=600></td>
				<!-- 너비가 600인 셀 -->
				<td>
					<button onclick="confirmDelete()" style="width: 80px;">상품
						삭제</button> <!-- 상품 삭제 버튼 -->
				</td>
				<td><input type=button value="재고수정"
					OnClick="location.href='stock_update.jsp?key=<%=id%>'"> <!-- 재고 수정 버튼 -->
				</td>
				<td>
					<!-- 재고 수량을 업데이트하기 위한 버튼 --> <input type="button" value="취소"
					onclick="location.href='Stock_list.jsp'">
				</td>
			</tr>
			<!-- 테이블 행 종료 -->
		</table>
		<!-- 두 번째 테이블 종료 -->

	</form>
	<%
	}
	%>
</body>

</html>