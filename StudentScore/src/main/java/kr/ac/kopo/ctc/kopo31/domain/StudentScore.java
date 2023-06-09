package kr.ac.kopo.ctc.kopo31.domain;

public class StudentScore {

	private int id; // 학생 점수의 고유한 ID를 나타내는 변수
	private String name; // 학생 이름을 나타내는 변수
	private int studentid; // 학생의 학번을 나타내는 변수
	private int kor; // 국어 점수를 나타내는 변수
	private int eng; // 영어 점수를 나타내는 변수
	private int mat; // 수학 점수를 나타내는 변수
	private int sum; // 국어, 영어, 수학 점수의 합계를 나타내는 변수
	private double avg; // 국어, 영어, 수학 점수의 평균을 나타내는 변수
	private int ranking; // 학생의 순위를 나타내는 변수

	public int getId() {
		return id;
	}

	// getId() 메소드는 id 변수의 값을 반환합니다.

	public int getSum() {
		return sum;
	}

	// getSum() 메소드는 sum 변수의 값을 반환합니다.

	public void setSum(int sum) {
		this.sum = sum;
	}

	// setSum(int sum) 메소드는 sum 변수의 값을 주어진 sum 매개변수로 설정합니다.

	public double getAvg() {
		return avg;
	}

	// getAvg() 메소드는 avg 변수의 값을 반환합니다.

	public void setAvg(double avg) {
		this.avg = avg;
	}

	// setAvg(double avg) 메소드는 avg 변수의 값을 주어진 avg 매개변수로 설정합니다.

	public int getRanking() {
		return ranking;
	}

	// getRanking() 메소드는 ranking 변수의 값을 반환합니다.

	public void setRanking(int ranking) {
		this.ranking = ranking;
	}

	// setRanking(int ranking) 메소드는 ranking 변수의 값을 주어진 ranking 매개변수로 설정합니다.

	public void setId(int id) {
		this.id = id;
	}

	// setId(int id) 메소드는 id 변수의 값을 주어진 id 매개변수로 설정합니다.

	public String getName() {
		return name;
	}

	// getName() 메소드는 name 변수의 값을 반환합니다.

	public void setName(String name) {
		this.name = name;
	}

	// setName(String name) 메소드는 name 변수의 값을 주어진 name 매개변수로 설정합니다.

	public int getStudentid() {
		return studentid;
	}

	// getStudentid() 메소드는 studentid 변수의 값을 반환합니다.

	public void setStudentid(int studentid) {
		this.studentid = studentid;
	}

	// setStudentid(int studentid) 메소드는 studentid 변수의 값을 주어진 studentid 매개변수로 설정합니다.

	public int getKor() {
		return kor;
	}

	// getKor() 메소드는 kor 변수의 값을 반환합니다.

	public void setKor(int kor) {
		this.kor = kor;
	}

	// setKor(int kor) 메소드는 kor 변수의 값을 주어진 kor 매개변수로 설정합니다.

	public int getEng() {
		return eng;
	}

	// getEng() 메소드는 eng 변수의 값을 반환합니다.

	public void setEng(int eng) {
		this.eng = eng;
	}

	// setEng(int eng) 메소드는 eng 변수의 값을 주어진 eng 매개변수로 설정합니다.

	public int getMat() {
		return mat;
	}

	// getMat() 메소드는 mat 변수의 값을 반환합니다.

	public void setMat(int mat) {
		this.mat = mat;
	}

	// setMat(int mat) 메소드는 mat 변수의 값을 주어진 mat 매개변수로 설정합니다.

}
