package domain;


public class Gongji {

	private int id; // 공지사항의 ID를 저장하는 변수입니다.
	private String title; // 공지사항의 제목을 저장하는 변수입니다.
	private String date; // 공지사항의 날짜를 저장하는 변수입니다.
	private String text; // 공지사항의 내용을 저장하는 변수입니다.
	
	public int getId() {
		return id; // ID 값을 반환하는 메서드입니다.
	}
	public void setId(int id) {
		this.id = id; // ID 값을 설정하는 메서드입니다.
	}
	
	public String getTitle() {
		return title; // 제목을 반환하는 메서드입니다.
	}
	public void setTitle(String title) {
		this.title = title; // 제목을 설정하는 메서드입니다.
	}
	
	public String getDate() {
		return date; // 날짜를 반환하는 메서드입니다.
	}
	public void setDate(String date) {
		this.date = date; // 날짜를 설정하는 메서드입니다.
	}
	
	public String getText() {
		return text; // 내용을 반환하는 메서드입니다.
	}
	public void setText(String text) {
		this.text = text; // 내용을 설정하는 메서드입니다.
	}

}
