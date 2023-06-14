
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
	background-color: #f1f8e9; /* 배경색을 설정합니다. */
	font-family: Arial, sans-serif; /* 글꼴을 설정합니다. */
	margin: 0; /* 바깥 여백을 0으로 설정합니다. */
	padding: 20px; /* 안쪽 여백을 설정합니다. */
}

h1 {
	text-align: center; /* 가운데 정렬을 설정합니다. */
	color: #4caf50; /* 글자 색상을 설정합니다. */
}

table {
	width: 1000px; /* 테이블의 너비를 100%로 설정합니다. */
	border-collapse: collapse; /* 테이블 경계를 합칩니다. */
	margin-bottom: 20px; /* 아래 여백을 설정합니다. */
	margin-left: auto;
	margin-right: auto;
}

th, td {
	padding: 8px; /* 셀 안쪽 여백을 설정합니다. */
	text-align: center; /* 가운데 정렬을 설정합니다. */
	border-bottom: 1px solid #ddd; /* 아래쪽 테두리를 설정합니다. */
}

th {
	background-color: #4caf50; /* 배경색을 설정합니다. */
	color: #fff; /* 글자 색상을 설정합니다. */
}

input[type="text"], textarea {
	padding: 6px 10px; /* 콘텐츠 안쪽 여백을 설정합니다. */
	font-size: 16px; /* 글꼴 크기를 설정합니다. */
	border: none; /* 테두리를 없앱니다. */
	border-radius: 3px; /* 테두리의 모서리를 둥글게 설정합니다. */
}
</style>


<script type="text/javascript">

function update() {//update function생성
	const stocknum = fm.elements.stocknum.value;
	console.log('stocknum: ', stocknum);
	 // 정규식을 사용하여 0부터 10000 이하의 정수인지 확인합니다.
    const numberPattern = /^[0-9]{1,5}$/;
    if (!numberPattern.test(stocknum) || stocknum < 0 || stocknum > 10000) {
        alert("0부터 10000 이하의 정수만 입력해주세요."); // 해당 메세지 출력
        return; // 함수 실행 종료
    }
	fm.action = 'stock_write.jsp?stocknum=' + stocknum;// fm을 제출할 경로
	fm.submit();//fm from 제출
}

</script>

</head>

<body>
	<%
	// 사용자의 요청(request)에서 "key" 파라미터를 가져와서 id 변수에 저장합니다.
	String id = request.getParameter("key");

	// Stock 객체와 StockDao 객체를 생성합니다.
	Stock stock = new Stock();
	StockDao stockDao = new StockDaoImpl();

	// StockDao를 사용하여 해당 id를 가진 상품의 재고 정보를 가져옵니다.
	Stock stockList = stockDao.selectOneStock(id);

	// 가져온 상품의 정보를 변수에 저장합니다.
	String name = stockList.getName(); // 상품명
	int stocknum = stockList.getStocknum(); // 재고현황
	String regdate = stockList.getRegdate(); // 상품 등록일
	String checkdate = stockList.getCheckdate(); // 재고 등록일
	String content = stockList.getText(); // 상품 설명
	String photo = stockList.getPhoto(); // 상품 사진
	%>


	<form method="post" name="fm" action=''>
		<!-- 숨겨진 필드로서 "UPDATE" 작업을 나타냄 -->
		<input type="hidden" name="key" value="<%="UPDATE"%>">

		<!-- 상품 정보를 표시하는 테이블 -->
		<table width="650" border="1" cellspacing="0" cellpadding="5">
			<tr>
				<td><b>번호</b></td>
				<td>
					<!-- 상품 ID를 표시하는 읽기 전용 입력 필드 --> <input type="text" name="id"
					size="70" maxlength="70"
					value="<%=id.replaceAll("<", "&lt;").replaceAll(">", "&gt;")%>"
					readonly>
				</td>
			</tr>
			<tr>
				<td><b>상품명</b></td>
				<!-- 상품명 -->
				<td><%=name.replaceAll("<", "&lt;").replaceAll(">", "&gt;")%></td>
			</tr>
			<tr>
				<td><b>재고현황</b></td>
				<td>
					<!-- 재고 수량을 업데이트하는 입력 필드 --> <input type="text" name="stocknum"
					size="70" maxlength="70" id="stocknum" value="<%=stocknum%>">
				</td>
			</tr>
			<tr>
				<td><b>상품등록일</b></td>
				<!-- 상품등록일 -->
				<td><%=regdate%></td>
			</tr>
			<tr>
				<td><b>재고등록일</b></td>
				<!-- 재고등록일 -->
				<td><%=checkdate%></td>
			</tr>
			<tr>
				<td><b>상품설명</b></td>
				<!-- 상품설명 -->
				<td><%=content.replaceAll("<", "&lt;").replaceAll(">", "&gt;")%></td>
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

		<!-- 재고 업데이트를 실행하는 버튼 -->

		<table width="650">
			<tr>
				<td width="600"></td>
				<td>
					<!-- 재고 수량을 업데이트하기 위한 버튼 --> <input type="button" value="수정"
					onclick="update()">
				</td>
				<td>
					<!-- 재고 수량을 업데이트하기 위한 버튼 --> <input type="button" value="취소"
					onclick="location.href='Stock_list.jsp'">
				</td>
			</tr>
		</table>








	</form>

</body>

</html>
