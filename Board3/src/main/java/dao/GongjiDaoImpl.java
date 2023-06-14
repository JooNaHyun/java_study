package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import domain.Gongji;

public class GongjiDaoImpl implements GongjiDao {

	@Override
	public int makeData() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.
			// 데이터베이스에 연결합니다.
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31");
			// SQL 문을 실행하기 위한 Statement 객체를 생성합니다.
			java.sql.Statement stmt = conn.createStatement();
			// 테이블 생성 쿼리를 실행합니다.
			stmt.executeUpdate("create table gongji( id int not null primary key auto_increment, "
					+ "title varchar(70), " + "date date, " + "content text)" + "DEFAULT CHARSET=utf8;");
			// 1부터 40까지 반복하면서 데이터를 삽입합니다.
			for (int i = 1; i <= 40; i++) {
				String title = "Title " + i;
				java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
				String content = "안녕하세요 " + i;

				String insertQuery = "INSERT INTO gongji (title, date, content) VALUES ('" + title + "', '" + date
						+ "', '" + content + "')";

				stmt.executeUpdate(insertQuery);
			}
			// 테이블 생성 완료 메시지를 출력합니다.
			System.out.println("테이블 만들기 OK");
			// Statement 객체를 닫습니다.
			stmt.close();
			// Connection 객체를 닫습니다.
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			return -1; // 오류 메시지를 반환합니다.
		}
		return 1; // 성공 메시지를 반환합니다.
	}

	@Override
	public List<Gongji> selectAllGongji(int page, int countPerPage) {
		List<Gongji> gongjilist = new ArrayList<>(); // Gongji 객체의 리스트를 생성합니다.

		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결합니다.

			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.

			int start = (page - 1) * countPerPage; // 페이지 시작 위치를 계산합니다.

			// 페이지에 해당하는 레코드를 조회하는 SQL 문을 실행합니다.
			ResultSet rset = stmt
					.executeQuery("SELECT * FROM gongji ORDER BY id DESC LIMIT " + start + "," + countPerPage);

			while (rset.next()) {
				Gongji gongji = new Gongji();
				gongji.setId(rset.getInt(1)); // 결과셋의 첫 번째 컬럼 값을 Gongji 객체의 id에 설정합니다.
				gongji.setTitle(rset.getString(2)); // 결과셋의 두 번째 컬럼 값을 Gongji 객체의 title에 설정합니다.
				gongji.setDate(rset.getString(3)); // 결과셋의 세 번째 컬럼 값을 Gongji 객체의 date에 설정합니다.
				gongji.setText(rset.getString(4)); // 결과셋의 네 번째 컬럼 값을 Gongji 객체의 content에 설정합니다.
				gongjilist.add(gongji); // Gongji 객체를 리스트에 추가합니다.
			}

			stmt.close(); // Statement 객체를 닫습니다.
			conn.close(); // 데이터베이스 연결을 닫습니다.
		} catch (Exception e) {
			e.printStackTrace(); // 예외가 발생하면 예외 정보를 출력합니다.
			return null; // 예외 발생 시 null을 반환합니다.
		}

		return gongjilist; // gongjilist 객체를 반환합니다.
	}

	@Override
	public Gongji selectOneGongji(int id) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.

			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결합니다.

			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.

			// 주어진 id에 해당하는 레코드를 조회하는 SQL 문을 실행합니다.
			ResultSet rset = stmt.executeQuery("SELECT * FROM gongji WHERE id = " + id);

			Gongji gongji = null;

			if (rset.next()) {
				gongji = new Gongji(); // 새로운 Gongji 객체를 생성합니다.
				gongji.setId(rset.getInt("id")); // 결과셋의 첫 번째 컬럼 값을 Gongji 객체의 id에 설정합니다.
				gongji.setTitle(rset.getString("title")); // 결과셋의 두 번째 컬럼 값을 Gongji 객체의 title에 설정합니다.
				gongji.setDate(rset.getString("date")); // 결과셋의 세 번째 컬럼 값을 Gongji 객체의 date에 설정합니다.
				gongji.setText(rset.getString("content")); // 결과셋의 네 번째 컬럼 값을 Gongji 객체의 text에 설정합니다.
			}

			stmt.close(); // Statement 객체를 닫습니다.
			conn.close(); // 데이터베이스 연결을 닫습니다.

			return gongji; // Gongji 객체를 반환합니다.
		} catch (Exception e) {
			e.printStackTrace(); // 예외가 발생하면 예외 정보를 출력합니다.
			return null; // 예외 발생 시 null을 반환합니다.
		}
	}

	@Override
	public int deleteOneGongji(int id) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.

			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결합니다.

			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.

			// 주어진 id에 해당하는 레코드를 삭제하는 SQL 문을 실행합니다.
			int deleterow = stmt.executeUpdate("DELETE FROM gongji WHERE id = " + id);

			stmt.close(); // Statement 객체를 닫습니다.
			conn.close(); // 데이터베이스 연결을 닫습니다.
			return 1; // 삭제된 레코드에 대한 정보를 반환하지 않으므로 null을 반환합니다.
		} catch (Exception e) {
			e.printStackTrace(); // 예외가 발생하면 예외 정보를 출력합니다.
			return -1; // 예외 발생 시 -1을 반환합니다.
		}
	}

	@Override
	public int updateGongji(Gongji gongji) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결합니다.
			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.

			String updateQuery = "UPDATE gongji SET " + "title = '" + gongji.getTitle() + "', " + "date = '"
					+ gongji.getDate() + "', " + "content = '" + gongji.getText() + "' " + "WHERE id = "
					+ gongji.getId();
			int updaterow = stmt.executeUpdate(updateQuery); // 주어진 id에 해당하는 레코드를 업데이트하는 SQL 문을 실행합니다.

			System.out.println("update 성공"); // 업데이트 성공 메시지를 출력합니다.

			stmt.close(); // Statement 객체를 닫습니다.
			conn.close(); // 데이터베이스 연결을 닫습니다.

		} catch (Exception e) {
			e.printStackTrace(); // 예외가 발생하면 예외 정보를 출력합니다.
			return -1;
		}
		return 1; // 업데이트된 studentScore 객체를 반환합니다.
	}

	@Override
	public int insertGongji(Gongji gongji) {
		int id = 0; // 새로 삽입된 공지사항의 id를 초기화합니다.
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결합니다.
			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.

			// 공지사항을 삽입하는 SQL 문을 실행합니다.
			stmt.execute("INSERT INTO gongji (title, date, content) VALUES ('" + gongji.getTitle() + "', DATE(NOW()), '"
					+ gongji.getText() + "')");

			ResultSet rset = stmt.executeQuery("SELECT MAX(id) FROM gongji"); // 가장 큰 id 값을 조회하는 SQL 문을 실행합니다.

			if (rset.next()) {
				id = rset.getInt(1); // 결과셋의 첫 번째 컬럼 값을 id 변수에 저장합니다.
			}

			stmt.close(); // Statement 객체를 닫습니다.
			conn.close(); // 데이터베이스 연결을 닫습니다.
		} catch (Exception e) {
			e.printStackTrace(); // 예외가 발생하면 예외 정보를 출력합니다.
		}

		return id; // 삽입된 공지사항의 id를 반환합니다.
	}

	@Override
	public int count() {
		int count = 0; // 레코드 개수를 저장하기 위한 변수를 초기화합니다.
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결합니다.
			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.
			ResultSet resultSet = stmt.executeQuery("SELECT COUNT(*) FROM gongji"); // gongji의 레코드 개수를 조회하는 SQL 문을
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
	public List<Gongji> selectAll() {
		List<Gongji> gongjilist = new ArrayList<>(); // 공지사항(Gongji) 객체의 리스트를 생성합니다.
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결합니다.
			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.
			ResultSet rset = stmt.executeQuery("SELECT * FROM gongji ORDER BY id DESC"); // 모든 공지사항을 역순으로 조회하는 SQL 문을
																							// 실행합니다.

			while (rset.next()) {
				Gongji gongji = new Gongji(); // 새로운 Gongji 객체를 생성합니다.
				gongji.setId(rset.getInt(1)); // 결과셋의 첫 번째 컬럼 값을 Gongji 객체의 id에 설정합니다.
				gongji.setTitle(rset.getString(2)); // 결과셋의 두 번째 컬럼 값을 Gongji 객체의 title에 설정합니다.
				gongji.setDate(rset.getString(3)); // 결과셋의 세 번째 컬럼 값을 Gongji 객체의 date에 설정합니다.
				gongji.setText(rset.getString(4)); // 결과셋의 네 번째 컬럼 값을 Gongji 객체의 text에 설정합니다.
				gongjilist.add(gongji); // Gongji 객체를 리스트에 추가합니다.
			}
			stmt.close(); // Statement 객체를 닫습니다.
			conn.close(); // 데이터베이스 연결을 닫습니다.
		} catch (Exception e) {
			e.printStackTrace(); // 예외가 발생하면 예외 정보를 출력합니다.
			return null; // 예외 발생 시 null을 반환합니다.
		}
		return gongjilist; // gongjilist 객체를 반환합니다.
	}

	@Override
	public int getCurrentPage(int id, int countPerPage) {
		int cnt = 0; // 학생 수를 세는 변수를 초기화합니다.
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결합니다.
			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.
			ResultSet rset = stmt.executeQuery("select * from gongji ORDER BY id DESC"); // gongji 테이블의 모든 데이터를 역순으로
																							// 조회합니다.

			while (rset.next()) {
				Gongji gongji = new Gongji(); // 새로운 Gongji 객체를 생성합니다.
				cnt++; // 학생 수를 증가시킵니다.
				if (id == rset.getInt(1)) { // 입력받은 id와 일치하는 학번을 찾으면 반복문을 종료합니다.
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
