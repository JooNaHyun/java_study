package java5;

import java.util.Scanner;

public class A5 {

	A5class a5class = new A5class();

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner(System.in);
		System.out.println("1.문자열의 길이는 5이상이어야 한다.");
		System.out.println("2.문자열은 숫자를 포함해야 한다.");
		System.out.println("3.문자열은 대문자 알파벳을 포함해야 한다.");
		System.out.println("4.문자열은 소문자 알파벳을 포함해야 한다.");
		System.out.println("5.문자열은 문자 'n'또는 'N'을 포함해야 한다.");

		while (true) {
			System.out.print("->");
			String word = scanner.next();

			if (A5class.validateString(word)) {
				System.out.println(" PASS");
			} else {
				System.out.println(" FAIL");
			}
		}

	}

}
