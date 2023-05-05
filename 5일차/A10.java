package java5;

import java.util.Scanner;

public class A10 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String sentence1 = scanner.nextLine();
		String sentence2 = scanner.nextLine();
		int countFinal = 0;
		// 자기 자신의 중복 세기
		for (int i = 0; i < sentence1.length(); i++) {
			int count = 0;
			int redundant = 0;
			for (int j = 0; j < sentence1.length(); j++) {
				if (sentence1.charAt(i) == sentence1.charAt(j)) {
					redundant++;
				}
			}

			// 나와 남을 세기
			for (int k = 0; k < sentence2.length(); k++) {
				if (sentence1.charAt(i) == sentence2.charAt(k)) {
					count++;
				}
			}

			count = count / redundant;
			countFinal += count;

			

		}
		if (countFinal == sentence1.length()) {
			System.out.println("yes");
		} else {
			System.out.println("false");
		}
	}
}

