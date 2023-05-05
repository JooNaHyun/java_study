package java5;

import java.util.Scanner;

public class A4 {

	public static void main(String[] args) {
		A4class a4class = new A4class(null);
		Scanner scanner = new Scanner(System.in);
		String word = null;

		while (true) {
			System.out.println("#Menu");
			System.out.println("1.Encryption");
			System.out.println("2.Decryption");
			System.out.print("->");

			int choice = scanner.nextInt();

			switch (choice) {
			case 1:
				word = scanner.next();
				System.out.println("Result : " + a4class.Encryption(word));
				break;
			case 2:
				word = scanner.next();
				System.out.println("Result : " + a4class.decrypt(word));
				break;

			}

		}

	}

}
