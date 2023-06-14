package dao;

import java.util.List;

import domain.Stock;

public interface StockDao {
	int makeData(); // 데이터베이스에서 테이블을 생성하는 메서드입니다.

	List<Stock> selectAllStock(int page, int countPerPage); // 페이지와 페이지 당 항목 수를 기준으로 모든 재고 정보를 조회하는 메서드입니다.

	Stock selectOneStock(String id); // 주어진 id에 해당하는 재고 정보를 조회하는 메서드입니다.

	int deleteOneStock(String id); // 주어진 id에 해당하는 재고 정보를 삭제하는 메서드입니다.

	int updateStock(Stock stock); // 재고 정보를 업데이트(수정)하는 메서드입니다.

	int insertStock(Stock stock); // 재고 정보를 삽입(추가)하는 메서드입니다.

	int count(); // 재고 정보의 총 개수를 반환하는 메서드입니다.

	List<Stock> selectAll(); // 모든 재고 정보를 조회하는 메서드입니다.

	int getCurrentPage(String id, int countPerPage); // 주어진 id가 속한 페이지를 반환하는 메서드입니다.
}
