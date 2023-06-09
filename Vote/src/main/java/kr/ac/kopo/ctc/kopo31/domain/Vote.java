package kr.ac.kopo.ctc.kopo31.domain;

public class Vote {
	private int Kiho; // Kiho 변수 선언
	private String name; // name 변수 선언
	private int age; // age 변수 선언
	private int count; // count 변수 선언

	public int getCount() { // count getter 메서드
		return count;
	}

	public void setCount(int count) { // count setter 메서드
		this.count = count;
	}

	public int getAge() { // age getter 메서드
		return age;
	}

	public void setAge(int age) { // age setter 메서드
		this.age = age;
	}

	public int getKiho() { // Kiho getter 메서드
		return Kiho;
	}

	public void setKiho(int kiho) { // Kiho setter 메서드
		Kiho = kiho;
	}

	public String getName() { // name getter 메서드
		return name;
	}

	public void setName(String name) { // name setter 메서드
		this.name = name;
	}
}
