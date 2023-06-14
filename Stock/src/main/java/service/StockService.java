package service;

import dto.pagination; // pagination 객체를 import합니다.

public interface StockService {

	public pagination getPagination(int page, int countperpage);
	// 페이지네이션 정보를 가져오는 메서드를 선언합니다.
	// 인자로 현재 페이지 번호와 페이지당 항목 수를 받습니다.
	// pagination 객체를 반환합니다.
}
