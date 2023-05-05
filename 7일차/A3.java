package ppt6;

import java.util.ArrayList;
import java.util.Collections;
import java.util.InputMismatchException;
import java.util.Scanner;

public class A3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner(System.in);
		ArrayList<String> names = new ArrayList<String>();
		ArrayList<Integer> scores = new ArrayList<Integer>();
		// 이름
		System.out.println("이름을 입력하세요. (10개 이상)");
		while (true) {
			String name = scanner.nextLine();
			names.add(name);
			if (names.size() >= 10) {
				break;
			}
		}
		System.out.println(names);

		// 점수
		System.out.println("점수를 입력하세요. (10개 이상)");
		while (true) {
			try {
				int score = scanner.nextInt();
				scores.add(score);
				if (scores.size() >= 10) {
					break;
				}
			} catch (Exception e) { // 사용자가 입력한 값이 int 타입으로 변환할 수 없는 경우
				System.out.println("Error");
				scanner.nextLine(); // 입력 버퍼를 비움
				continue; // 반복문 처음으로 돌아감
			}

		}
		System.out.println(scores);

		Collections.sort(names);
		System.out.println("오름차순 : " + names);
		Collections.reverse(names);
		System.out.println("내림차순 : " + names);

		Collections.sort(scores);
		System.out.println("오름차순 : " + scores);
		Collections.reverse(scores);
		System.out.println("내림차순 : " + scores);
	}

}
