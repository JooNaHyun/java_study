package dao;

import java.sql.Connection;
import java.sql.Date;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import domain.Stock;

public class StockDaoImpl implements StockDao {
	@Override
	public int makeData() {
		try {
			// JDBC 드라이버 로드
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 데이터베이스 연결
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31");
			// SQL 문 실행을 위한 Statement 객체 생성
			java.sql.Statement stmt = conn.createStatement();
			// stock 테이블 생성 쿼리 실행
			stmt.executeUpdate(
					"CREATE TABLE stock (row_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, id VARCHAR(70) UNIQUE, name VARCHAR(70), stocknum INT, regdate DATE, checkdate DATE, content TEXT, photo TEXT) DEFAULT CHARSET=utf8");

			// 150개의 재고 데이터 생성
			for (int i = 1; i <= 150; i++) {
				// 재고 ID 생성
				String id = "fruit" + i;
				// 제품번호 생성
				String productnum = String.format("%013d", i);
				// 현재 날짜를 체크 날짜로 설정
				Date checkDate = new Date(System.currentTimeMillis());
				// 등록 날짜를 "2017-06-01"로 설정
				java.sql.Date regDate = java.sql.Date.valueOf("2017-06-01");
				// 재고 수량을 10으로 설정
				int stocknum = 10;
				// 내용 생성
				String content = "맛있다. " + i;
				// URL은 빈 문자열로 설정
				String url = "";
				// 재고 데이터 삽입 쿼리 생성 및 실행
				String insertQuery = "INSERT INTO stock (id, name, stocknum, checkdate, regdate, content, photo) VALUES ('"
						+ productnum + "', '" + id + "', " + stocknum + ", '" + regDate + "', '" + checkDate + "', '"
						+ content + "', '" + url + "')";
				stmt.executeUpdate(insertQuery);
			}
			System.out.println("테이블 만들기 OK");
			// 자원 해제
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 1;
	}

	@Override
	public List<Stock> selectAllStock(int page, int countPerPage) {
		List<Stock> stocklist = new ArrayList<>(); // Stock 객체의 리스트를 생성합니다.
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결합니다.

			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.

			int start = (page - 1) * countPerPage; // 페이지 시작 위치를 계산합니다.
			ResultSet rset = stmt
					.executeQuery("SELECT * FROM stock ORDER BY row_id desc LIMIT " + start + "," + countPerPage);
			// 페이지에 해당하는 레코드를 조회하는 SQL 문을 실행합니다.

			while (rset.next()) {
				Stock stock = new Stock();
				stock.setId(rset.getString(2)); // 결과셋의 두 번째 컬럼 값을 Stock 객체의 id에 설정합니다.
				stock.setName(rset.getString(3)); // 결과셋의 세 번째 컬럼 값을 Stock 객체의 name에 설정합니다.
				stock.setStocknum(rset.getInt(4)); // 결과셋의 네 번째 컬럼 값을 Stock 객체의 stocknum에 설정합니다.
				stock.setCheckdate(rset.getString(5)); // 결과셋의 다섯 번째 컬럼 값을 Stock 객체의 checkdate에 설정합니다.
				stock.setRegdate(rset.getString(6)); // 결과셋의 여섯 번째 컬럼 값을 Stock 객체의 regdate에 설정합니다.
				stock.setPhoto(rset.getString(7)); // 결과셋의 일곱 번째 컬럼 값을 Stock 객체의 photo에 설정합니다.
				stocklist.add(stock); // Stock 객체를 리스트에 추가합니다.
			}

			stmt.close(); // Statement 객체를 닫습니다.
			conn.close(); // 데이터베이스 연결을 닫습니다.
		} catch (Exception e) {
			e.printStackTrace(); // 예외가 발생하면 예외 정보를 출력합니다.
			return null; // 예외 발생 시 null을 반환합니다.
		}

		return stocklist; // stocklist 객체를 반환합니다.
	}

	@Override
	public Stock selectOneStock(String id) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.

			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결합니다.

			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.

			ResultSet rset = stmt.executeQuery("SELECT * FROM stock WHERE id = '" + id + "'");
 // 주어진 id에 해당하는 레코드를 조회하는 SQL 문을
																						// 실행합니다.

			Stock stock = null;

			if (rset.next()) {
				stock = new Stock(); // 새로운 Stock 객체를 생성합니다.
				stock.setId(rset.getString("id")); // 결과셋의 첫 번째 컬럼 값을 Stock 객체의 id에 설정합니다.
				stock.setName(rset.getString("name")); // 결과셋의 두 번째 컬럼 값을 Stock 객체의 name에 설정합니다.
				stock.setStocknum(rset.getInt("stocknum")); // 결과셋의 세 번째 컬럼 값을 Stock 객체의 stocknum에 설정합니다.
				stock.setCheckdate(rset.getString("checkdate")); // 결과셋의 다섯 번째 컬럼 값을 Stock 객체의 checkdate에 설정합니다.
				stock.setRegdate(rset.getString("regdate")); // 결과셋의 네 번째 컬럼 값을 Stock 객체의 regdate에 설정합니다.
				stock.setText(rset.getString("content")); // 결과셋의 여섯 번째 컬럼 값을 Stock 객체의 text에 설정합니다.
				stock.setPhoto(rset.getString("photo")); // 결과셋의 일곱 번째 컬럼 값을 Stock 객체의 photo에 설정합니다.
			}

			stmt.close(); // Statement 객체를 닫습니다.
			conn.close(); // 데이터베이스 연결을 닫습니다.

			return stock; // Stock 객체를 반환합니다.
		} catch (Exception e) {
			e.printStackTrace(); // 예외가 발생하면 예외 정보를 출력합니다.
			return null; // 예외 발생 시 null을 반환합니다.
		}
	}

	@Override
	public int deleteOneStock(String id) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결합니다
			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.

			int deleterow = stmt.executeUpdate("DELETE FROM stock WHERE id= '" + id + "'"); // 주어진 id에 해당하는 레코드를 삭제하는 SQL 문을
																						// 실행합니다
			stmt.close(); // Statement 객체를 닫습니다.
			conn.close(); // 데이터베이스 연결을 닫습니다.

			return 1; // 삭제된 레코드에 대한 정보를 반환하지 않으므로 1을 반환합니다.

		} catch (Exception e) {
			e.printStackTrace(); // 예외가 발생하면 예외 정보를 출력합니다.
			return -1; // 예외 발생 시 -1을 반환합니다.
		}
	}

	@Override
	public int updateStock(Stock stock) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.

			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결합니다.

			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.

			String updateQuery = "UPDATE stock SET stocknum = '" + stock.getStocknum() + "', regdate = NOW()"
					+ " WHERE id = '" + stock.getId() +"'";
			int updaterow = stmt.executeUpdate(updateQuery); // 주어진 id에 해당하는 레코드를 업데이트하는 SQL 문을 실행합니다.

			System.out.println("업데이트 성공"); // 업데이트 성공 메시지를 출력합니다.

			stmt.close(); // Statement 객체를 닫습니다.
			conn.close(); // 데이터베이스 연결을 닫습니다.

		} catch (Exception e) {
			e.printStackTrace(); // 예외가 발생하면 예외 정보를 출력합니다.
			return -1; // 예외 발생 시 -1을 반환합니다.
		}
		return 1; // 업데이트가 성공했으므로 1을 반환합니다.
	}

	@Override
	public int insertStock(Stock stock) {
		int result = -1; // 결과를 나타내는 변수를 초기화합니다.
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결합니다.
			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.

			String id = stock.getId(); // Stock 객체의 id를 가져옵니다.
			String name = stock.getName(); // Stock 객체의 name을 가져옵니다.
			int stocknum = stock.getStocknum(); // Stock 객체의 stocknum을 가져옵니다.
			String content = stock.getText(); // Stock 객체의 text를 가져옵니다.
			String url = stock.getPhoto(); // Stock 객체의 photo를 가져옵니다.

			String sql = "INSERT INTO stock (id, name, stocknum, regdate, checkdate, content, photo) VALUES ('" + id
					+ "','" + name + "','" + stocknum + "', NOW(), NOW(), '" + content + "','" + url + "')"; // SQL 문을
																												// 생성합니다.

			stmt.execute(sql); // SQL 문을 실행하여 레코드를 삽입합니다.
			System.out.println("업데이트 완료"); // 업데이트 완료 메시지를 출력합니다.
			result = 1; // 결과를 1로 설정하여 성공적으로 삽입되었음을 나타냅니다.

			stmt.close(); // Statement 객체를 닫습니다.
			conn.close(); // 데이터베이스 연결을 닫습니다.
		} catch (Exception e) {
			e.printStackTrace(); // 예외가 발생하면 예외 정보를 출력합니다.
		}
		return result; // 결과를 반환합니다.
	}

	@Override
	public int count() {
		int count = 0; // 레코드 개수를 저장하기 위한 변수를 초기화합니다.
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결합니다.
			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.
			ResultSet resultSet = stmt.executeQuery("SELECT COUNT(*) FROM stock"); // examtable의 레코드 개수를 조회하는 SQL 문을
																					// 실행합니다.
			if (resultSet.next()) {
				count = resultSet.getInt(1); // 결과셋의 첫 번째 컬럼의 값을 count 변수에 저장합니다.
			}
			stmt.close(); // Statement 객체를 닫습니다.
			conn.close(); // 데이터베이스 연결을 닫습니다.
		} catch (Exception e) {
			e.printStackTrace(); // 예외가 발생하면 예외 정보를 출력합니다.
		}
		return count; // count 값을 반환합니다.
	}

	@Override
	public List<Stock> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getCurrentPage(String id, int countPerPage) {
		int cnt = 0; // 학생 수를 세는 변수를 초기화합니다.
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결합니다.
			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.

			ResultSet rset = stmt.executeQuery("SELECT * FROM stock ORDER BY row_id desc"); // stock 테이블의 모든 데이터를
																							// row_id를 기준으로 오름차순으로
																							// 조회합니다.

			while (rset.next()) {
				Stock stock = new Stock();
				cnt++; // 학생 수를 증가시킵니다.
				if (id.equals(rset.getString(2))) { // 입력받은 id와 일치하는 학번을 찾으면 반복문을 종료합니다.
					break;
				}
			}

			rset.close(); // ResultSet 객체를 닫습니다.
			stmt.close(); // Statement 객체를 닫습니다.
			conn.close(); // 데이터베이스 연결을 닫습니다.

		} catch (Exception e) {
			e.printStackTrace(); // 예외가 발생하면 예외 정보를 출력합니다.
			return -1;
		}

		int currentPage = cnt % countPerPage == 0 ? (cnt / countPerPage) : (cnt / countPerPage) + 1; // 현재 페이지를 계산합니다.
		return currentPage; // 현재 페이지를 반환합니다.
	}

}
