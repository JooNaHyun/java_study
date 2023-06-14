package domain;

public class Stock {
	int row_id; // Stock의 행 번호를 저장하는 변수입니다.
	String id; // Stock의 id를 저장하는 변수입니다.
	String name; // Stock의 이름을 저장하는 변수입니다.
	int stocknum; // Stock의 재고 수량을 저장하는 변수입니다.
	String regdate; // Stock의 등록일을 저장하는 변수입니다.
	String checkdate; // Stock의 확인일을 저장하는 변수입니다.
	String text; // Stock의 텍스트 내용을 저장하는 변수입니다.
	String photo; // Stock의 사진을 저장하는 변수입니다.

	public int getRow_id() {
		return row_id; // 행 번호를 반환합니다.
	}

	public void setRow_id(int row_id) {
		this.row_id = row_id; // 행 번호를 설정합니다.
	}

	public String getId() {
		return id; // id를 반환합니다.
	}

	public void setId(String id) {
		this.id = id; // id를 설정합니다.
	}

	public String getName() {
		return name; // 이름을 반환합니다.
	}

	public void setName(String name) {
		this.name = name; // 이름을 설정합니다.
	}

	public int getStocknum() {
		return stocknum; // 재고 수량을 반환합니다.
	}

	public void setStocknum(int stocknum) {
		this.stocknum = stocknum; // 재고 수량을 설정합니다.
	}

	public String getRegdate() {
		return regdate; // 등록일을 반환합니다.
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate; // 등록일을 설정합니다.
	}

	public String getCheckdate() {
		return checkdate; // 확인일을 반환합니다.
	}

	public void setCheckdate(String checkdate) {
		this.checkdate = checkdate; // 확인일을 설정합니다.
	}

	public String getText() {
		return text; // 텍스트 내용을 반환합니다.
	}

	public void setText(String text) {
		this.text = text; // 텍스트 내용을 설정합니다.
	}

	public String getPhoto() {
		return photo; // 사진을 반환합니다.
	}

	public void setPhoto(String photo) {
		this.photo = photo; // 사진을 설정합니다.
	}
}
