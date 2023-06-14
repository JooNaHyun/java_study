<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.StockDaoImpl"%>
<%@page import="dao.StockDao"%>
<%@page import="domain.Stock"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.Date"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	StockDao stockDao = new StockDaoImpl();

	// 상품 정보와 재고수량을 파라미터에서 가져옴
	String id = request.getParameter("id"); // 상품 번호
	System.out.println(id);
	int stocknum = Integer.parseInt(request.getParameter("stocknum")); // 재고 수량

	// 상품 정보를 DB에서 조회하여 객체로 가져옴
	Stock stock = stockDao.selectOneStock(id);

	// 재고수량 업데이트
	stock.setStocknum(stocknum);
	int update = stockDao.updateStock(stock);

	if (update == 1) { // 업데이트가 성공한 경우
		int c = stockDao.getCurrentPage(id, 20); // 현재 페이지 번호 계산
		response.sendRedirect("Stock_list.jsp?page="+c+"&id="+stock.getId()); // 재고 목록 페이지로 이동
	} else {
		out.println("Failed to update the record."); // 업데이트 실패 시 에러 메시지 출력
	}
%>
