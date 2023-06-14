package domain;

public class Gongji2 { // 공지 객체
	private int id; // private으로 id 변수 생성
	private String title; // private으로 title 변수 생성
	private String date; // private으로 date 변수 생성
	private String content; // private으로 content 변수 생성
	private int rootid; // private으로 rootid 변수 생성
	private int relevel; // private으로 relevel 변수 생성
	private int recnt; // private으로 recnt 변수 생성
	private int viewcnt; // private으로 viewcnt 변수 생성
	
	public int getId() { // id의 getter
		return id; // 값 리턴
	}
	public void setId(int id) { // id의 setter
		this.id = id; // 인자로 받은 값으로 변경
	}
	public String getTitle() { // title의 getter
		return title; // 값 리턴
	}
	public void setTitle(String title) { // title의 setter
		this.title = title; // 인자로 받은 값으로 변경
	}
	public String getDate() { // date의 getter
		return date; // 값 리턴
	}
	public void setDate(String date) { // date의 setter
		this.date = date; // 인자로 받은 값으로 변경
	}
	public String getContent() { // content의 getter
		return content; // 값 리턴
	}
	public void setContent(String content) { // content의 setter
		this.content = content; // 인자로 받은 값으로 변경
	}
	public int getRootid() { // rootid의 getter
		return rootid; // 값 리턴
	}
	public void setRootid(int rootid) { // rootid의 setter
		this.rootid = rootid; // 인자로 받은 값으로 변경
	}
	public int getRelevel() { // relevel의 getter
		return relevel; // 값 리턴
	}
	public void setRelevel(int relevel) { // relevel의 setter
		this.relevel = relevel; // 인자로 받은 값으로 변경
	}
	public int getRecnt() { // recnt의 getter
		return recnt; // 값 리턴
	}
	public void setRecnt(int recnt) { // recnt의 setter
		this.recnt = recnt; // 인자로 받은 값으로 변경
	}
	public int getViewcnt() { // viewcnt의 getter
		return viewcnt; // 값 리턴
	}
	public void setViewcnt(int viewcnt) { // viewcnt의 setter
		this.viewcnt = viewcnt; // 인자로 받은 값으로 변경
	}
	
}
