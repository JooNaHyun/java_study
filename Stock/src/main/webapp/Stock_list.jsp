
<%@page import="domain.Stock"%>
<%@page import="java.util.List"%>
<%@page import="dao.StockDaoImpl"%>
<%@page import="dao.StockDao"%>
<%@page import="service.StockServiceImpl"%>
<%@page import="service.StockService"%>
<%@page import="dto.pagination"%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<html>
<head>
<style>
body {
	background-color: #f1f8e9;
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 20px;
}

h1 {
	text-align: center;
	color: #4caf50;
}

.search-form {
	text-align: right;
	margin-bottom: 20px;
}

.search-form input[type="text"] {
	padding: 6px 10px;
	font-size: 16px;
	border: none;
	border-radius: 3px;
}

.search-form input[type="button"] {
	padding: 6px 10px;
	font-size: 16px;
	background-color: #4caf50;
	color: #fff;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #4caf50;
	color: #fff;
}
}
</style>
<head>
<script>
	function submitForm() {
		const id = document.getElementById('searchid').elements.key.value;

		if (id.trim() === '') { // 입력 창이 비어있으면
			alert("데이터를 입력해주세요."); // 해당 메세지 출력
			return; // 함수 실행 종료
		}

	
		document.getElementById('searchid').submit();
	}
</script>
</head>

</head>
<body>
	<%
	int pagenum = 1; // from값(table의 첫번째 값)선언 및 초기화
	int countperpage = 20; // cnt값(table의 나와야할 데이터 개수)선언 및 초기화

	try {
		pagenum = Integer.parseInt(request.getParameter("page"));
		// 전달받은 파라미터 값을 "from"에 할당
		if (pagenum <= 0) {//만약 전달받은 값이 0이거나 0보다 작으면
			pagenum = 1;//from에 1할당
		}
	} catch (Exception e) {
	}
	try {
		countperpage = Integer.parseInt(request.getParameter("countperpage"));
		// 전달받은 파라미터 값을 "cnt"에 할당  
		if (countperpage <= 0) {//만약 전달받은 값이 0이거나 0보다 작으면
			countperpage = 10;//cnt에 10할당
		}
	} catch (Exception e) {
	}
	StockService stockservice = new StockServiceImpl();

	pagination pagination = stockservice.getPagination(pagenum, countperpage);
	// 지정한 페이지 번호와 페이지당 개수를 기준으로 페이지네이션 정보를 생성한다.

	int c = pagination.getC();
	// 현재 페이지 번호를 가져온다.
	int s = pagination.getS();
	// 시작 페이지 번호를 가져온다.
	int e = pagination.getE();
	// 끝 페이지 번호를 가져온다.
	int p = pagination.getP();
	// 이전 페이지 번호를 가져온다.
	int pp = pagination.getPp();
	// 이전 블록의 시작 페이지 번호를 가져온다.
	int n = pagination.getN();
	// 다음 페이지 번호를 가져온다.
	int nn = pagination.getNn();
	// 다음 블록의 시작 페이지 번호를 가져온

	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	StockDao StockDao = new StockDaoImpl();
	Stock stock = new Stock();
	List<Stock> StockList = StockDao.selectAllStock(pagenum, countperpage); // 모든 공지 정보 조회

	if (StockList != null && !StockList.isEmpty()) {
		//Stock stock = StockList.get(i);
	%>

	<h1>(주)트와이스 재고 현황-전체현황</h1>
	<div class="search-form">
		<!-- 검색 양식을 감싸는 div 요소입니다. -->
		<form action="stock_view.jsp" method="post" id="searchid">
			<!-- 검색 결과를 보여줄 페이지(stock_view.jsp)로 데이터를 전송하는 form 요소입니다. -->
			<input type="text" name="key" placeholder="상품 번호를 입력하세요">
			<!-- 상품 번호를 입력할 수 있는 input 요소입니다. -->
			<input type="button" value="검색" onclick="submitForm()">
			<!-- 검색 버튼을 클릭할 때 submitForm() 함수를 호출하는 버튼입니다. -->
		</form>
	</div>
	<hr>
	<table cellspacing="1" width="600" border="1">
		<tr>
			<!-- 상품번호를 나타내는 셀 -->
			<td width="50"><p align="center">상품번호</p></td>

			<!-- 상품명을 나타내는 셀 -->
			<td width="500"><p align="center">상품명</p></td>

			<!-- 현재재고수를 나타내는 셀 -->
			<td width="200"><p align="center">현재재고수</p></td>

			<!-- 재고파악일을 나타내는 셀 -->
			<td width="300"><p align="center">재고파악일</p></td>

			<!-- 상품등록일을 나타내는 셀 -->
			<td width="300"><p align="center">상품등록일</p></td>
		</tr>


		<%
		for (int i = 0; i < StockList.size(); i++) {
			//StockList.size만큼 for문 반복
			Stock stock1 = StockList.get(i); // StockList에서 i번째 항목을 가져와 stock1에 저장한다.
		%>
		<tr>
			<!-- 행 시작 -->
			<td width="50"><p align="center">
					<a href="stock_view.jsp?key=<%=stock1.getId()%>"><%=stock1.getId().replaceAll("<", "&lt;").replaceAll(">", "&gt;")%></a>
				</p></td>
			<!-- 셀 시작 -->
			<td width="500"><p align="center">
					<a href="stock_view.jsp?key=<%=stock1.getId()%>"><%=stock1.getName().replaceAll("<", "&lt;").replaceAll(">", "&gt;")%></a>
				</p></td>
			<!-- 셀 시작 -->
			<td width="200"><p align="center"><%=stock1.getStocknum()%></p></td>
			<!-- 셀 시작 -->
			<td width="300"><p align="center"><%=stock1.getCheckdate()%></p></td>
			<td width="300"><p align="center"><%=stock1.getRegdate()%></p></td>
		</tr>
		<!-- 행 종료 -->
		<%
		}
		%>
	</table>
	<div style="text-align: right;">
		<!-- 신규등록 버튼 -->
		<input type="button" value="신규등록"
			onclick="window.location='product_write.jsp'">
	</div>


	<%
	} else {
	// 공지 정보가 없는 경우 처리
	}
	%>




	<div style="text-align: center; font-weight: bold; font-size: 20pt;">
		<%
		if (10 < c) {
		%>
		<!-- 만약 현재 페이지 번호(c)가 10보다 큰 경우 -->
		<a href="Stock_list.jsp?page=<%=pp%>" style="color: black"><<</a>
		<!-- 이전 페이지 블록으로 이동하는 링크 (<<) -->
		<a href="Stock_list.jsp?page=<%=p%>" style="color: black"><</a>
		<!-- 이전 페이지로 이동하는 링크 (<) -->
		<%
		}
		%>

		<%
		for (int i = s; i <= e; i++) {
		%>
		<!-- 페이지 번호 반복문 -->
		<%
		if (i == c) {
		%>
		<!-- 만약 현재 반복 중인 페이지 번호(i)와 현재 페이지 번호(c)가 일치하는 경우 -->
		<a style="color: red;" href="Stock_list.jsp?page=<%=i%>"
			style="color:black"><%=i%></a>
		<!-- 현재 페이지 번호 (빨간색) -->
		<%
		} else {
		%>
		<!-- 그렇지 않은 경우 -->
		<a href="Stock_list.jsp?page=<%=i%>" style="color: green;"><%=i%></a>
		<!-- 페이지 번호 (파란색) -->
		<%
		}
		%>
		<%
		}
		%>

		<%
		if (nn != -1) {
		%>
		<!-- 만약 nn 값이 -1이 아닌 경우 -->
		<a href="Stock_list.jsp?page=<%=n%>" style="color: black">></a>
		<!-- 다음 페이지로 이동하는 링크 (>) -->
		<a href="Stock_list.jsp?page=<%=nn%>" style="color: black">>></a>
		<!-- 다음 페이지로 이동하는 링크 (>>) -->
		<%
		}
		%>
	</div>

</body>
</html>
