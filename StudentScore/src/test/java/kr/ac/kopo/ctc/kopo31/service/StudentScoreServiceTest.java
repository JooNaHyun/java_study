package kr.ac.kopo.ctc.kopo31.service;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import dto.pagination;

class StudentScoreServiceTest {

	@Test
	void test_50_1() {
		StudentScoreService studentScoreService = new StudentScoreServiceImpl();
		pagination pagination = studentScoreService.getPagination(1, 50);
		assertEquals(pagination.getC(),1);
		assertEquals(pagination.getS(),1);
		assertEquals(pagination.getE(),10);
		assertEquals(pagination.getP(),-1);
		assertEquals(pagination.getPp(),-1);
		assertEquals(pagination.getN(),11);
		assertEquals(pagination.getNn(),23);
	}
	@Test
	void test_50_2() {
		StudentScoreService studentScoreService = new StudentScoreServiceImpl();
		pagination pagination = studentScoreService.getPagination(0, 50);
		assertEquals(pagination.getC(),1);
		assertEquals(pagination.getS(),1);
		assertEquals(pagination.getE(),10);
		assertEquals(pagination.getP(),-1);
		assertEquals(pagination.getPp(),-1);
		assertEquals(pagination.getN(),11);
		assertEquals(pagination.getNn(),23);
	}
	@Test
	void test_50_3() {
		StudentScoreService studentScoreService = new StudentScoreServiceImpl();
		pagination pagination = studentScoreService.getPagination(-100, 50);
		assertEquals(pagination.getC(),1);
		assertEquals(pagination.getS(),1);
		assertEquals(pagination.getE(),10);
		assertEquals(pagination.getP(),-1);
		assertEquals(pagination.getPp(),-1);
		assertEquals(pagination.getN(),11);
		assertEquals(pagination.getNn(),23);
	}
	@Test
	void test_50_4() {
		StudentScoreService studentScoreService = new StudentScoreServiceImpl();
		pagination pagination = studentScoreService.getPagination(5, 50);
		assertEquals(pagination.getC(),5);
		assertEquals(pagination.getS(),1);
		assertEquals(pagination.getE(),10);
		assertEquals(pagination.getP(),-1);
		assertEquals(pagination.getPp(),-1);
		assertEquals(pagination.getN(),15);
		assertEquals(pagination.getNn(),23);
	}
	@Test
	void test_50_5() {
		StudentScoreService studentScoreService = new StudentScoreServiceImpl();
		pagination pagination = studentScoreService.getPagination(10, 50);
		assertEquals(pagination.getC(),10);
		assertEquals(pagination.getS(),1);
		assertEquals(pagination.getE(),10);
		assertEquals(pagination.getP(),-1);
		assertEquals(pagination.getPp(),-1);
		assertEquals(pagination.getN(),20);
		assertEquals(pagination.getNn(),23);
	}
	@Test
	void test_50_6() {
		StudentScoreService studentScoreService = new StudentScoreServiceImpl();
		pagination pagination = studentScoreService.getPagination(11, 50);
		assertEquals(pagination.getC(),11);
		assertEquals(pagination.getS(),11);
		assertEquals(pagination.getE(),20);
		assertEquals(pagination.getP(),1);
		assertEquals(pagination.getPp(),1);
		assertEquals(pagination.getN(),21);
		assertEquals(pagination.getNn(),23);
	}
	@Test
	void test_50_7() {
		StudentScoreService studentScoreService = new StudentScoreServiceImpl();
		pagination pagination = studentScoreService.getPagination(15, 50);
		assertEquals(pagination.getC(),15);
		assertEquals(pagination.getS(),11);
		assertEquals(pagination.getE(),20);
		assertEquals(pagination.getP(),5);
		assertEquals(pagination.getPp(),1);
		assertEquals(pagination.getN(),23);
		assertEquals(pagination.getNn(),23);
	}
	@Test
	void test_50_8() {
		StudentScoreService studentScoreService = new StudentScoreServiceImpl();
		pagination pagination = studentScoreService.getPagination(20, 50);
		assertEquals(pagination.getC(),20);
		assertEquals(pagination.getS(),11);
		assertEquals(pagination.getE(),20);
		assertEquals(pagination.getP(),10);
		assertEquals(pagination.getPp(),1);
		assertEquals(pagination.getN(),23);
		assertEquals(pagination.getNn(),23);
	}
	@Test
	void test_50_9() {
		StudentScoreService studentScoreService = new StudentScoreServiceImpl();
		pagination pagination = studentScoreService.getPagination(21, 50);
		assertEquals(pagination.getC(),21);
		assertEquals(pagination.getS(),21);
		assertEquals(pagination.getE(),23);
		assertEquals(pagination.getP(),11);
		assertEquals(pagination.getPp(),1);
		assertEquals(pagination.getN(),-1);
		assertEquals(pagination.getNn(),-1);
	}
	@Test
	void test_50_10() {
		StudentScoreService studentScoreService = new StudentScoreServiceImpl();
		pagination pagination = studentScoreService.getPagination(25, 50);
	
		assertEquals(pagination.getC(),23);
		assertEquals(pagination.getS(),21);
		assertEquals(pagination.getE(),23);
		assertEquals(pagination.getP(),13);
		assertEquals(pagination.getPp(),1);
		assertEquals(pagination.getN(),-1);
		assertEquals(pagination.getNn(),-1);
	}

}
