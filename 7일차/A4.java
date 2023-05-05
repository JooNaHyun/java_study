package ppt6;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

public class A4 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("문자열 입력: ");
		String str = scanner.nextLine();

		System.out.print("찾을 문자 입력: ");
		String target = scanner.nextLine();
		char targetChar = target.charAt(0);

		try {
			int index = str.indexOf(targetChar); // 문자열에서 첫번째로 발견된 위치 검색
			if (index != -1) { // 문자열에 문자가 포함된 경우
				System.out.println(index + 1); // 1부터 시작하도록 인덱스값에 1을 더해서 출력
			} else { // 문자열에 문자가 포함되지 않은 경우
				System.out.println("문자열에 해당 문자가 없습니다.");
			}
		} catch (Exception e) { // 예외 처리
			System.out.println("잘못된 입력입니다. 프로그램을 종료합니다.");
		}
	}

}
