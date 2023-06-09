package kr.ac.kopo.ctc.kopo31.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.ctc.kopo31.domain.StudentScore;

public class StudentScoreDaoImpl implements StudentScoreDao {

	@Override
	public String maketable() {
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.
	        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에 연결합니다.
	        java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.

	        stmt.execute("CREATE TABLE examtable (" + // examtable 테이블을 생성하는 SQL 문을 실행합니다.
	                     "id INT AUTO_INCREMENT PRIMARY KEY, " + // id 칼럼은 자동 증가하는 기본 키입니다.
	                     "name VARCHAR(20), " + // name 칼럼은 20자 이내의 문자열을 저장합니다.
	                     "studentid INT NOT NULL UNIQUE, " + // studentid 칼럼은 NULL이 아니며 중복되지 않는 값이어야 합니다.
	                     "kor INT, " + // kor 칼럼은 정수형 값을 저장합니다.
	                     "eng INT, " + // eng 칼럼은 정수형 값을 저장합니다.
	                     "mat INT) DEFAULT CHARSET=utf8;"); // mat 칼럼은 정수형 값을 저장하며, CHARSET을 utf8로 설정합니다.
	        stmt.close(); // Statement 객체를 닫습니다.
	        conn.close(); // 데이터베이스 연결을 닫습니다.
	    } catch (Exception e) {
	        e.printStackTrace();
	        return e.toString(); // 예외가 발생하면 예외 정보를 반환합니다.
	    }
	    return "create table success"; // 테이블 생성이 성공적으로 완료되면 성공 메시지를 반환합니다.
	}

	@Override
	public int count() {
	    int count = 0; // 레코드 개수를 저장하기 위한 변수를 초기화합니다.
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.
	        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에 연결합니다.
	        java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.
	        ResultSet resultSet = stmt.executeQuery("SELECT COUNT(*) FROM examtable"); // examtable의 레코드 개수를 조회하는 SQL 문을 실행합니다.
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
	public StudentScore create(StudentScore studentScore) {
	    String name = studentScore.getName(); // StudentScore 객체에서 name 가져옴
	    int kor = studentScore.getKor(); // StudentScore 객체에서 kor 가져옴
	    int eng = studentScore.getEng(); // StudentScore 객체에서 eng 가져옴
	    int mat = studentScore.getMat(); // StudentScore 객체에서 mat 가져옴

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.
	        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에 연결합니다.

	        java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.

	        // 학번 오름차순으로 정렬하여 조회
	        ResultSet rset = stmt.executeQuery("SELECT studentid FROM examtable ORDER BY studentid ASC");

	        int newId = 209901; // 새로운 학번 변수 선언 및 초기값 설정
	        while (rset.next()) { // rset을 반복하면서 루프 실행
	            int currentId = rset.getInt("studentid"); // currentId에 현재 학번 대입
	            if (newId < currentId) { // newId가 작으면
	                break; // 루프 탈출
	            }
	            newId = currentId + 1; // 비어있는 학번에 새로운 학번 추가
	        }
	        rset.close(); // ResultSet을 닫습니다.

	        int studentid = newId; // studentid 값 설정

	        studentScore.setStudentid(studentid); // 부여된 학번을 studentScore에 설정

	        stmt.execute("INSERT INTO examtable (name, studentid, kor, eng, mat) VALUES ('" + name + "', " + studentid
	                + "," + kor + "," + eng + "," + mat + ");"); // examtable에 데이터 삽입

	        rset = stmt.executeQuery("SELECT id FROM examtable WHERE studentid = " + studentid); // 삽입된 레코드의 id 조회

	        while (rset.next()) {
	            studentScore.setId(rset.getInt(1)); // studentScore 객체의 setId를 호출하여 id 값을 설정
	        }
	        rset.close(); // ResultSet을 닫습니다.
	        stmt.close(); // Statement 객체를 닫습니다.
	        conn.close(); // 데이터베이스 연결을 닫습니다.
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null; // 예외 발생 시 null을 반환합니다.
	    }
	    return studentScore; // studentScore 객체를 반환합니다.
	}


	@Override
	public StudentScore selectOne(int studentid) {
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.

	        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에 연결합니다.

	        java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.

	        StudentScore studentscore = new StudentScore(); // 새로운 StudentScore 객체를 생성합니다.

	        ResultSet rset = stmt.executeQuery("SELECT *, b.kor + b.eng + b.mat, (b.kor + b.eng + b.mat) / 3,"
	                + "(SELECT COUNT(*) + 1 FROM examtable AS a WHERE (a.kor + a.eng + a.mat) > (b.kor + b.eng + b.mat)) FROM examtable AS b "
	                + "WHERE studentid = " + studentid); // 주어진 studentid에 해당하는 레코드를 조회하는 SQL 문을 실행합니다.

	        StudentScore studentScore = new StudentScore(); // 새로운 StudentScore 객체를 생성합니다.

	        if (rset.next()) {
	            studentScore = new StudentScore();
	            studentScore.setId(rset.getInt(1)); // 결과셋의 첫 번째 컬럼 값을 studentScore 객체의 id에 설정합니다.
	            studentScore.setName(rset.getString(2)); // 결과셋의 두 번째 컬럼 값을 studentScore 객체의 name에 설정합니다.
	            studentScore.setStudentid(rset.getInt(3)); // 결과셋의 세 번째 컬럼 값을 studentScore 객체의 studentid에 설정합니다.
	            studentScore.setKor(rset.getInt(4)); // 결과셋의 네 번째 컬럼 값을 studentScore 객체의 kor에 설정합니다.
	            studentScore.setEng(rset.getInt(5)); // 결과셋의 다섯 번째 컬럼 값을 studentScore 객체의 eng에 설정합니다.
	            studentScore.setMat(rset.getInt(6)); // 결과셋의 여섯 번째 컬럼 값을 studentScore 객체의 mat에 설정합니다.
	            studentScore.setSum(rset.getInt(7)); // 결과셋의 일곱 번째 컬럼 값을 studentScore 객체의 sum에 설정합니다.
	            studentScore.setAvg(rset.getDouble(8)); // 결과셋의 여덟 번째 컬럼 값을 studentScore 객체의 avg에 설정합니다.
	            studentScore.setRanking(rset.getInt(9)); // 결과셋의 아홉 번째 컬럼 값을 studentScore 객체의 ranking에 설정합니다.
	        }
	        stmt.close(); // Statement 객체를 닫습니다.
	        conn.close(); // 데이터베이스 연결을 닫습니다.

	        return studentScore; // studentScore 객체를 반환합니다.
	    } catch (Exception e) {
	        e.printStackTrace(); // 예외가 발생하면 예외 정보를 출력합니다.
	        return null; // 예외 발생 시 null을 반환합니다.
	    }
	}


	@Override
	public List<StudentScore> selectAll(int page, int countPerPage) {
	    List<StudentScore> studentScoreList = new ArrayList<>(); // StudentScore 객체의 리스트를 생성합니다.
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.
	        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에 연결합니다.

	        java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.

	        int start = (page - 1) * countPerPage; // 페이지 시작 위치를 계산합니다.
	        ResultSet rset = stmt.executeQuery("SELECT *, b.kor + b.eng + b.mat, (b.kor + b.eng + b.mat) / 3,"
	                + "(SELECT COUNT(*) + 1 FROM examtable AS a WHERE (a.kor + a.eng + a.mat) > (b.kor + b.eng + b.mat)) FROM examtable AS b "
	                + "LIMIT " + start + "," + countPerPage + ";"); // 페이지에 해당하는 레코드를 조회하는 SQL 문을 실행합니다.

	        while (rset.next()) {
	            StudentScore studentScore = new StudentScore();
	            studentScore.setId(rset.getInt(1)); // 결과셋의 첫 번째 컬럼 값을 studentScore 객체의 id에 설정합니다.
	            studentScore.setName(rset.getString(2)); // 결과셋의 두 번째 컬럼 값을 studentScore 객체의 name에 설정합니다.
	            studentScore.setStudentid(rset.getInt(3)); // 결과셋의 세 번째 컬럼 값을 studentScore 객체의 studentid에 설정합니다.
	            studentScore.setKor(rset.getInt(4)); // 결과셋의 네 번째 컬럼 값을 studentScore 객체의 kor에 설정합니다.
	            studentScore.setEng(rset.getInt(5)); // 결과셋의 다섯 번째 컬럼 값을 studentScore 객체의 eng에 설정합니다.
	            studentScore.setMat(rset.getInt(6)); // 결과셋의 여섯 번째 컬럼 값을 studentScore 객체의 mat에 설정합니다.
	            studentScore.setSum(rset.getInt(7)); // 결과셋의 일곱 번째 컬럼 값을 studentScore 객체의 sum에 설정합니다.
	            studentScore.setAvg(rset.getDouble(8)); // 결과셋의 여덟 번째 컬럼 값을 studentScore 객체의 avg에 설정합니다.
	            studentScore.setRanking(rset.getInt(9)); // 결과셋의 아홉 번째 컬럼 값을 studentScore 객체의 ranking에 설정합니다.
	            studentScoreList.add(studentScore); // studentScore 객체를 리스트에 추가합니다.
	        }

	        stmt.close(); // Statement 객체를 닫습니다.
	        conn.close(); // 데이터베이스 연결을 닫습니다.

	    } catch (Exception e) {
	        e.printStackTrace(); // 예외가 발생하면 예외 정보를 출력합니다.
	        return null; // 예외 발생 시 null을 반환합니다.
	    }

	    return studentScoreList; // studentScoreList 객체를 반환합니다.
	}


	@Override
	public StudentScore update(int id, StudentScore studentScore) {
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.

	        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에 연결합니다.

	        java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.

	        int updaterow = stmt.executeUpdate("UPDATE examtable SET " + "name = '" + studentScore.getName() + "', "
	                + "kor = " + studentScore.getKor() + ", " + "eng = " + studentScore.getEng() + ", " + "mat = "
	                + studentScore.getMat() + " WHERE studentid = " + studentScore.getStudentid()); // 주어진 studentid에 해당하는 레코드를 업데이트하는 SQL 문을 실행합니다.

	        System.out.println("update 성공"); // 업데이트 성공 메시지를 출력합니다.

	        stmt.close(); // Statement 객체를 닫습니다.
	        conn.close(); // 데이터베이스 연결을 닫습니다.

	    } catch (Exception e) {
	        e.printStackTrace(); // 예외가 발생하면 예외 정보를 출력합니다.
	    }
	    return studentScore; // 업데이트된 studentScore 객체를 반환합니다.
	}

	@Override
	public StudentScore deleteById(int id) {
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.

	        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에 연결합니다.

	        java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.

	        int deleterow = stmt.executeUpdate("DELETE FROM examtable WHERE id = " + id); // 주어진 id에 해당하는 레코드를 삭제하는 SQL 문을 실행합니다.

	        stmt.close(); // Statement 객체를 닫습니다.
	        conn.close(); // 데이터베이스 연결을 닫습니다.

	        return null; // 삭제된 레코드에 대한 정보를 반환하지 않으므로 null을 반환합니다.

	    } catch (Exception e) {
	        e.printStackTrace(); // 예외가 발생하면 예외 정보를 출력합니다.
	        return null;
	    }
	}


	@Override
	public StudentScore deleteByStudentId(int studentId) {
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.

	        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에 연결합니다.

	        java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.

	        int deleterow = stmt.executeUpdate("DELETE FROM examtable WHERE studentid = " + studentId); // 주어진 studentId에 해당하는 레코드를 삭제하는 SQL 문을 실행합니다.

	        stmt.close(); // Statement 객체를 닫습니다.
	        conn.close(); // 데이터베이스 연결을 닫습니다.

	        return null; // 삭제된 레코드에 대한 정보를 반환하지 않으므로 null을 반환합니다.

	    } catch (Exception e) {
	        e.printStackTrace(); // 예외가 발생하면 예외 정보를 출력합니다.
	        return null;
	    }
	}


	@Override
	public String insertAll(int last) {
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.

	        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에 연결합니다.

	        java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.

	        int cnt = 0;

	        while (true) {
	            cnt++;
	            String name = "홍길" + cnt;
	            int studentid = 209900 + cnt;
	            int kor = (int) (Math.random() * 100);
	            int eng = (int) (Math.random() * 100);
	            int mat = (int) (Math.random() * 100);

	            String insertQuery = "INSERT INTO examtable(name, studentid, kor, eng, mat) " +
	                    "VALUES ('" + name + "', " + studentid + ", " + kor + ", " + eng + ", " + mat + ")";
	            stmt.executeUpdate(insertQuery); // INSERT 문을 실행하여 데이터를 examtable에 삽입합니다.

	            if (cnt == last) {
	                break; // 지정한 개수(last)의 데이터를 삽입한 경우 반복문을 종료합니다.
	            }
	        }

	        stmt.close(); // Statement 객체를 닫습니다.
	        conn.close(); // 데이터베이스 연결을 닫습니다.

	    } catch (Exception e) {
	        e.printStackTrace(); // 예외가 발생하면 예외 정보를 출력합니다.
	        return e.toString();
	    }
	    return "insert data success"; // 데이터 삽입이 성공적으로 완료되었음을 알리는 메시지를 반환합니다.
	}


	@Override
	public String droptable() {
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.

	        Connection k31_conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에 연결합니다.

	        java.sql.Statement k31_stmt = k31_conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.

	        k31_stmt.execute("drop table examtable;"); // examtable 테이블을 삭제합니다.

	        k31_stmt.close(); // Statement 객체를 닫습니다.
	        k31_conn.close(); // 데이터베이스 연결을 닫습니다.

	    } catch (Exception e) {
	        e.printStackTrace(); // 예외가 발생하면 예외 정보를 출력합니다.
	        return e.toString();
	    }
	    return "drop table success"; // 테이블 삭제가 성공적으로 완료되었음을 알리는 메시지를 반환합니다.
	}


	@Override
	public int getCurrentPage(int id, int countPerPage) {
	    int cnt = 0; // 학생 수를 세는 변수를 초기화합니다.
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 로드합니다.
	        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.148:33060/kopo31", "root", "kopo31"); // 데이터베이스에 연결합니다.
	        java.sql.Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체를 생성합니다.

	        ResultSet rset = stmt.executeQuery("select * from examtable"); // examtable 테이블의 모든 데이터를 조회합니다.

	        while (rset.next()) {
	            StudentScore studentScore = new StudentScore();
	            cnt++; // 학생 수를 증가시킵니다.
	            if (id == rset.getInt(3)) { // 입력받은 id와 일치하는 학번을 찾으면 반복문을 종료합니다.
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
