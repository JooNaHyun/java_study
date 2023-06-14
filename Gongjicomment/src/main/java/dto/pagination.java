package dto;

public class pagination {

	private int c; // 현재 페이지
	private int s; // 시작 인덱스
	private int e; // 끝 인덱스
	private int p; // 이전 페이지
	private int pp; // 처음 페이지
	private int n; // 다음 페이지
	private int nn; // 마지막 페이지

	public int getC() {
		return c; // 현재 페이지 번호를 가져옴
	}

	public void setC(int c) {
		this.c = c; // 현재 페이지 번호를 설정함
	}

	public int getS() {
		return s; // 시작 인덱스를 가져옴
	}

	public void setS(int s) {
		this.s = s; // 시작 인덱스를 설정함
	}

	public int getE() {
		return e; // 끝 인덱스를 가져옴
	}

	public void setE(int e) {
		this.e = e; // 끝 인덱스를 설정함
	}

	public int getP() {
		return p; // 이전 페이지 번호를 가져옴
	}

	public void setP(int p) {
		this.p = p; // 이전 페이지 번호를 설정함
	}

	public int getPp() {
		return pp; // 처음 페이지 번호를 가져옴
	}

	public void setPp(int pp) {
		this.pp = pp; // 처음 페이지 번호를 설정함
	}

	public int getN() {
		return n; // 다음 페이지 번호를 가져옴
	}

	public void setN(int n) {
		this.n = n; // 다음 페이지 번호를 설정함
	}

	public int getNn() {
		return nn; // 마지막 페이지 번호를 가져옴
	}

	public void setNn(int nn) {
		this.nn = nn; // 마지막 페이지 번호를 설정함
	}

}
