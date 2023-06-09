package kr.ac.kopo.ctc.kopo31.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.ctc.kopo31.domain.Vote;

public class VoteDaoImpl implements VoteDao {

	@Override
	public List<Vote> selectAll() {
		List<Vote> votes = new ArrayList<>(); // 투표 정보를 담을 리스트 생성

		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // JDBC 드라이버 로드
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결
			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체 생성
			ResultSet rset = stmt.executeQuery("select * from hubo_table;"); // hubo_table에서 모든 데이터를 조회하는 SQL 실행

			while (rset.next()) {
				Vote vote = new Vote(); // 투표 객체 생성
				vote.setKiho(rset.getInt(1)); // 첫 번째 컬럼의 값을 투표 번호로 설정
				vote.setName(rset.getString(2)); // 두 번째 컬럼의 값을 후보자 이름으로 설정

				votes.add(vote); // 리스트에 투표 객체 추가
			}

			conn.close(); // 데이터베이스 연결 종료
			stmt.close(); // Statement 객체 종료
			rset.close(); // ResultSet 객체 종료
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return votes; // 조회된 투표 정보 리스트 반환
	}

	@Override
	public int deleteHubo(int kiho) {
		Vote vote = new Vote(); // 투표 객체 생성

		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // JDBC 드라이버 로드
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결
			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체 생성
			stmt.executeUpdate("delete from hubo_table where kiho = " + kiho + ";"); // kiho 값이 해당하는 레코드를 hubo_table에서
																						// 삭제하는 SQL 실행
			stmt.close(); // Statement 객체 종료
			conn.close(); // 데이터베이스 연결 종료
		} catch (Exception e) {
			e.printStackTrace();
		}

		return kiho; // 삭제된 기호의 번호 반환
	}

	@Override
	public int insertIntoHubo(String name) {
		int newKiho = 1; // 새로운 학번 변수 초기화

		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // JDBC 드라이버 로드
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결
			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체 생성

			ResultSet rset = stmt.executeQuery("select kiho from hubo_table order by kiho asc"); // hubo_table의 kiho를
																									// 오름차순으로 정렬하여 조회하는
																									// SQL 실행

			while (rset.next()) { // rset을 반복하면서 루프 실행
				int currentKiho = rset.getInt("kiho"); // 현재 학번을 가져옴
				if (newKiho < currentKiho) { // newKiho가 현재 학번보다 작으면
					break; // 루프 탈출
				}
				newKiho = currentKiho + 1; // 비어있는 학번에 새로운 학번 추가
			}
			rset.close(); // ResultSet 객체 종료

			stmt.execute("INSERT INTO hubo_table VALUES (" + newKiho + ", '" + name + "');"); // 새로운 학번과 이름을 hubo_table에
																								// 삽입하는 SQL 실행

			conn.close(); // 데이터베이스 연결 종료
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);// 오류 출력
		}

		return newKiho; // 생성된 새로운 학번 반환
	}

	@Override
	public int calNumber() {
		int newKiho = 1; // 새로운 학번 변수 초기화

		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // JDBC 드라이버 로드
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결
			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체 생성

			ResultSet rset = stmt.executeQuery("select kiho from hubo_table order by kiho asc"); // hubo_table의 kiho를
																									// 오름차순으로 정렬하여 조회하는
																									// SQL 실행

			while (rset.next()) { // rset을 반복하면서 루프 실행
				int currentKiho = rset.getInt("kiho"); // 현재 학번을 가져옴
				if (newKiho < currentKiho) { // newKiho가 현재 학번보다 작으면
					break; // 루프 탈출
				}
				newKiho = currentKiho + 1; // 비어있는 학번에 새로운 학번 추가
			}
			rset.close(); // ResultSet 객체 종료

			conn.close(); // 데이터베이스 연결 종료
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return newKiho; // 생성된 새로운 학번 반환
	}

	@Override
	public void insertIntoTupyo(int kiho, int age) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // JDBC 드라이버 로드
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결
			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체 생성

			stmt.execute("INSERT INTO tupyo_table VALUES (" + kiho + ", " + age + ");"); // tupyo_table에 kiho와 age 값을
																							// 삽입하는 SQL 실행

			conn.close(); // 데이터베이스 연결 종료
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);// 오류 출력
		}
	}

	@Override
	public int countAll() {
		int count = 0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // JDBC 드라이버 로드
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결
			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체 생성
			ResultSet rset = stmt.executeQuery("select count(*) from tupyo_table;"); // tupyo_table의 레코드 수를 세는 SQL 실행

			while (rset.next()) {
				count = rset.getInt(1); // 결과셋의 첫 번째 열 값을 count 변수에 저장
			}

			conn.close(); // 데이터베이스 연결 종료
			stmt.close();
			rset.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count; // 결과값 반환
	}

	@Override
	public int countVotes(int kiho) {
		int count = 0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // JDBC 드라이버 로드
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결
			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체 생성
			ResultSet rset = stmt
					.executeQuery("SELECT kiho, COUNT(*) FROM tupyo_table WHERE kiho = " + kiho + " GROUP BY kiho"); // 해당
																														// kiho에
																														// 해당하는
																														// tupyo_table
																														// 레코드
																														// 수를
																														// 세는
																														// SQL
																														// 실행

			while (rset.next()) {
				count = rset.getInt(2); // 결과셋의 두 번째 열 값을 count 변수에 저장
			}

			conn.close(); // 데이터베이스 연결 종료
			stmt.close();
			rset.close();
		} catch (Exception e) {
			e.printStackTrace();// 오류 출력
		}

		return count; // 결과값 반환
	}

	@Override
	public List<Vote> selectOne(int kiho) {
		List<Vote> votes = new ArrayList<>();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // JDBC 드라이버 로드
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에
																															// 연결
			java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체 생성
			ResultSet rset = stmt.executeQuery("SELECT t.age, COUNT(*) AS voteCnt " + "FROM hubo_table as h "
					+ "JOIN tupyo_table as t ON h.kiho = t.kiho " + "WHERE h.kiho = '" + kiho + "'"
					+ "GROUP BY t.age;"); // 해당 kiho에 해당하는 tupyo_table의 age와 투표 수를 조회하는 SQL 실행

			while (rset.next()) {
				Vote vote = new Vote(); // Vote 객체 생성
				vote.setAge(rset.getInt(1)); // 결과셋의 첫 번째 열 값을 Vote 객체의 age에 설정
				vote.setCount(rset.getInt(2)); // 결과셋의 두 번째 열 값을 Vote 객체의 count에 설정

				votes.add(vote); // 리스트에 Vote 객체 추가
			}

			conn.close(); // 데이터베이스 연결 종료
			stmt.close();
			rset.close();
		} catch (Exception e) {
			e.printStackTrace();// 오류 출력
		}
		return votes; // 결과 리스트 반환
	}

}