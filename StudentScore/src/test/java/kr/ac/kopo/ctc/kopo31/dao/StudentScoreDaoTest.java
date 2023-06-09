package kr.ac.kopo.ctc.kopo31.dao;

import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import kr.ac.kopo.ctc.kopo31.domain.StudentScore;

class StudentScoreDaoTest {

//	    @Test
//	    public void testMaketable() {
//	        // �׽�Ʈ ����
//	        StudentScoreDao studentScoreDao = new StudentScoreDaoImpl();
//	        studentScoreDao.maketable();
//
//	        // ���̺��� ���������� �����Ǿ����� Ȯ��
//	        boolean tableExists = checkIfTableExists();
//	        Assertions.assertTrue(tableExists, "���̺��� ���������� �����Ǿ���� �մϴ�.");
//	    }
//
//	    private boolean checkIfTableExists() {
//	        // ���̺��� ���� ���θ� Ȯ���ϴ� ������ �����մϴ�.
//	        // ���� ���, ���̺��� ������ ��ȸ�Ͽ� ���� ���θ� Ȯ���ϰų� ���ܰ� �߻��ϴ��� Ȯ���ϴ� ����� ����� �� �ֽ��ϴ�.
//	        // �� ���������� ���̺��� ���� ���θ� ������ Ȯ���ϱ� ���� true�� ��ȯ�ϵ��� �ϰڽ��ϴ�.
//	        return true;
//	    }


	@Test
	   void test_create() {
	      StudentScoreDao studentScoreDao = new StudentScoreDaoImpl();
	      
	      StudentScore studentScore = new StudentScore();
	      studentScore.setName("�̿���");
	      studentScore.setKor(100);
	      studentScore.setEng(100);
	      studentScore.setMat(100);

	      studentScoreDao.create(studentScore);
	   }

    @Test
   public void testSelectOne() {
    	        

    	// �׽�Ʈ�� �޼��� ȣ��
    	StudentScoreDao studentScoreDao = new StudentScoreDaoImpl();
    	StudentScore studentScore1 = studentScoreDao.selectOne(1);

    }
    
    @Test
    public void testSelectAll() {
        // �׽�Ʈ�� �������� �������� ����
        
        // �׽�Ʈ�� �޼��� ȣ��
    	int page = 2;
    	int countPerPage = 10;
        StudentScoreDao studentScoreDao = new StudentScoreDaoImpl();
        List<StudentScore> studentScoreList = studentScoreDao.selectAll(page, countPerPage);

        // ���� ��� ����
       
        // ��� ����
        Assertions.assertEquals(10, studentScoreList.size());
    }

	
	    @Test
	    public void testUpdate() {
	      
	        
	        StudentScore studentScore = new StudentScore();
	        studentScore.setId(7);
	        studentScore.setName("�ֳ���");
	        studentScore.setKor(88);
	        studentScore.setEng(25);
	        studentScore.setMat(87);

	        StudentScoreDao studentScoreDao = new StudentScoreDaoImpl();
	        StudentScore result = studentScoreDao.update(6, studentScore);

	        // ������Ʈ ��� Ȯ��
	        Assertions.assertEquals(studentScore.getId(), result.getId()); // ������Ʈ�� StudentScore ��ü�� ���� ����� ��ġ�ϴ��� Ȯ��
	    }
	    @Test
	    void test_delete() {
	       StudentScoreDao studentScoreDao = new StudentScoreDaoImpl();
	       StudentScore studentScore = new StudentScore();
	       studentScore = studentScoreDao.deleteById(5);
	    }

}
	



