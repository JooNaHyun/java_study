package kr.ac.kopo.ctc.kopo31.service;

import dto.pagination; // dto 패키지에 있는 pagination 클래스를 import함

public interface StudentScoreService {
   
   pagination getPagination(int page, int countPerpage);
   // 학생 성적 서비스에서 페이지네이션 정보를 가져오는 메서드를 선언함.
   // page: 요청한 페이지 번호를 나타내는 매개변수
   // countPerpage: 페이지당 항목 개수를 나타내는 매개변수
   
}