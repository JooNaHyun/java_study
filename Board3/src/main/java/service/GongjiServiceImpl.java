package service;

import dao.GongjiDaoImpl;
import dto.pagination;

public class GongjiServiceImpl implements GongjiService {

	@Override
	public pagination getPagination(int page, int countperpage) {
		GongjiDaoImpl gongjiDaoImpl = new GongjiDaoImpl();

		int totalData = gongjiDaoImpl.count(); // 전체 데이터 개수를 가져옴

		int cntPT = countperpage; // 페이지당 항목 개수를 가져옴

		int currentpage = page; // 현재 선택한 페이지 번호를 가져옴

		int startPage = 1; // 현재 선택한 페이지의 첫 번째 페이지 번호를 초기화함

		int pagecnt = 10; // 한 화면에 표시할 페이지 개수를 설정함

		int lastPage = totalData % cntPT == 0 ? totalData / cntPT : (totalData / cntPT) + 1;
		// 전체 페이지 수를 계산함. 데이터 개수를 페이지당 항목 개수로 나눈 나머지가 0이면 몫을, 그렇지 않으면 몫에 +1을 함

		if (page <= 1) {
			currentpage = 1; // 페이지가 1 이하인 경우, 현재 페이지 번호를 1로 설정함
		} else if (page > lastPage) {
			currentpage = lastPage; // 페이지가 전체 페이지 수보다 큰 경우, 현재 페이지 번호를 마지막 페이지로 설정함
		} else {
			currentpage = page; // 그 외의 경우, 현재 페이지 번호를 선택한 페이지로 설정함
		}

		startPage = ((currentpage - 1) / pagecnt) * pagecnt + 1; // 현재 선택한 페이지의 시작 페이지 번호를 계산함

		int lastStartPage = ((lastPage - 1) / pagecnt) * pagecnt + 1; // 전체 페이지의 시작 페이지 번호를 계산함

		int endPage = startPage + pagecnt - 1; // 현재 선택한 페이지의 마지막 페이지 번호를 계산함

		if (lastPage < endPage) {
			endPage = lastPage; // 마지막 페이지 번호가 전체 페이지 수보다 큰 경우, 마지막 페이지 번호를 전체 페이지 수로 설정함
		}

		int prev = currentpage - pagecnt; // 이전 페이지 번호를 계산함

		int pprev = 1; // 이전 이전 페이지 번호를 초기화함

		if (prev < 1) {
			prev = -1; // 이전 페이지 번호가 1보다 작은 경우, 이전 페이지 번호를 -1로 설정함
			pprev = -1; // 이전 이전 페이지 번호를 -1로 설정함
		}

		int next = currentpage + pagecnt; // 다음 페이지 번호를 계산함

		if (next > lastPage) {
			next = lastPage; // 다음 페이지 번호가 마지막 페이지를 초과하는 경우, 다음 페이지 번호를 마지막 페이지로 설정함
		}

		int nnext = lastPage; // 다음 다음 페이지 번호를 전체 페이지 수로 설정함

		if (startPage == lastStartPage) {
			next = -1; // 시작 페이지와 전체 페이지의 시작 페이지 번호가 같은 경우, 다음 페이지 번호를 -1로 설정함
			nnext = -1; // 다음 다음 페이지 번호를 -1로 설정함
		}

		// pagination 객체를 생성하고 각 필드에 값을 설정함
		pagination pagination = new pagination();
		pagination.setC(currentpage); // 현재 페이지 번호를 설정함
		pagination.setS(startPage); // 현재 페이지의 시작 페이지 번호 설정
		pagination.setE(endPage); // 현재 페이지의 마지막 페이지 번호 설정
		pagination.setP(prev); // 10 페이지 이전으로 이동 설정
		pagination.setPp(pprev); // 1 페이지로 이동 설정
		pagination.setN(next); // 10 페이지 다음으로 이동 설정
		pagination.setNn(nnext); // 마지막 페이지로 이동 설정
		return pagination;
	}

	

}
