package kr.ac.kopo.ctc.kopo31.dao;

import java.util.List;

import kr.ac.kopo.ctc.kopo31.domain.StudentScore;

public interface StudentScoreDao {
	StudentScore create(StudentScore studentScore); 
	// 학생 점수 정보를 생성하는 메서드입니다.

	StudentScore selectOne(int id); 
	// 주어진 id에 해당하는 학생 점수 정보를 조회하는 메서드입니다.

	List<StudentScore> selectAll(int page, int countPerPage); 
	// 페이지와 페이지 당 항목 수를 기반으로 모든 학생 점수 정보를 조회하는 메서드입니다.

	StudentScore update(int id, StudentScore studentScore);
	// 주어진 id에 해당하는 학생 점수 정보를 업데이트하는 메서드입니다.

	StudentScore deleteById(int id); 
	// 주어진 id에 해당하는 학생 점수 정보를 삭제하는 메서드입니다.

	StudentScore deleteByStudentId(int studentId); 
	// 주어진 학생 id에 해당하는 학생 점수 정보를 삭제하는 메서드입니다.

	String maketable(); 
	// 테이블을 생성하는 SQL 문을 반환하는 메서드입니다.

	String insertAll(int last); 
	// 마지막 학생까지의 학생 점수 정보를 삽입하는 SQL 문을 반환하는 메서드입니다.

	String droptable(); 
	// 테이블을 삭제하는 SQL 문을 반환하는 메서드입니다.

	int getCurrentPage(int id, int countPerPage); 
	// 주어진 id와 페이지 당 항목 수를 기반으로 현재 페이지를 반환하는 메서드입니다.

	int count(); 
	// 전체 학생 점수 정보의 개수를 반환하는 메서드입니다.
}
