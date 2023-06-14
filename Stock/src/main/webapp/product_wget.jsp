<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.StockDaoImpl"%>
<%@page import="dao.StockDao"%>
<%@page import="domain.Stock"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.Date"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%
request.setCharacterEncoding("UTF-8"); // 요청의 문자 인코딩을 UTF-8로 설정한다.
response.setCharacterEncoding("UTF-8"); // 응답의 문자 인코딩을 UTF-8로 설정한다.

String path = "./image/"; // 이미지 업로드 경로를 지정한다.
String realPath = application.getRealPath(path); // 이미지 업로드 실제 경로를 가져온다.
System.out.println("write.jsp - realPath : " + realPath); // 절대경로 확인

int size = 10 * 1024 * 1024; // 업로드 파일의 최대 크기를 10MB로 설정한다.

MultipartRequest multi = new MultipartRequest(request, realPath, size, "UTF-8", new DefaultFileRenamePolicy());
// MultipartRequest 객체를 생성하여 파일 업로드를 처리한다.

StockDao stockDao = new StockDaoImpl(); // StockDaoImpl 객체를 생성한다.

String id = multi.getParameter("id"); // 요청 파라미터에서 "id" 값을 가져온다.
String name = multi.getParameter("name"); // 요청 파라미터에서 "name" 값을 가져온다.
int stocknum = Integer.parseInt(multi.getParameter("stocknum")); // 요청 파라미터에서 "stocknum" 값을 가져와서 정수로 변환한다.
String content = multi.getParameter("content"); // 요청 파라미터에서 "content" 값을 가져온다.
String photo = multi.getFilesystemName("photo"); // 업로드된 파일의 파일명을 가져온다.

Stock stock = new Stock(); // Stock 객체를 생성합니다.

stock.setId(id); // 생성한 Stock 객체의 id 속성에 id 값을 설정합니다.
stock.setName(name); // 생성한 Stock 객체의 name 속성에 name 값을 설정합니다.
stock.setStocknum(stocknum); // 생성한 Stock 객체의 stocknum 속성에 stocknum 값을 설정합니다.
stock.setText(content); // 생성한 Stock 객체의 text 속성에 content 값을 설정합니다.
stock.setPhoto(path + photo); // 생성한 Stock 객체의 photo 속성에 path와 photo 값을 연결하여 설정합니다.

int insert = stockDao.insertStock(stock); // Stock 객체를 데이터베이스에 저장한다.

if (insert == 1) {
	//insert를 성공하면
	int currentPage = stockDao.getCurrentPage(id, 20); // 현재 페이지 번호를 가져온다.
	response.sendRedirect("Stock_list.jsp?page=" + currentPage + "&id=" + stock.getId());
	// 현재 페이지 번호와 id를 포함하여 Stock_list.jsp 페이지로 리다이렉트한다.
} else {
	out.println("Failed to insert the record."); // 레코드 삽입 실패 메시지를 출력한다.
}
%>
