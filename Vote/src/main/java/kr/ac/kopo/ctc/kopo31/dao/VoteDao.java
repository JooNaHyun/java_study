package kr.ac.kopo.ctc.kopo31.dao;

import java.util.List;

import kr.ac.kopo.ctc.kopo31.domain.Vote;

public interface VoteDao {
	// 모든 투표 정보를 조회하는 메서드
	List<Vote> selectAll();

	// 특정 후보의 투표 정보를 삭제하는 메서드
	int deleteHubo(int kiho);

	// 후보를 후보자 목록에 추가하는 메서드
	int insertIntoHubo(String name);

	// 투표 번호를 계산하는 메서드
	int calNumber();

	// 투표 결과를 투표자 목록에 추가하는 메서드
	void insertIntoTupyo(int kiho, int age);

	// 전체 투표 수를 계산하는 메서드
	int countAll();

	// 특정 후보의 투표 수를 계산하는 메서드
	int countVotes(int kiho);

	// 특정 후보의 투표 정보를 조회하는 메서드
	List<Vote> selectOne(int kiho);
}
