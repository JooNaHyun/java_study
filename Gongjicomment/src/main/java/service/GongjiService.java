package service;

import dto.pagination;

public interface GongjiService {
	public pagination getPagination(int page, int countperpage);
	//페이지 정보를 기반으로 페이징 처리된 데이터를 반환하는 메서드
}
