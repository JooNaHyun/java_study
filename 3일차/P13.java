package ppt3;

import java.util.Scanner;

public class P13 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String line = scanner.nextLine();
		String word = scanner.nextLine();

		int min = 999;

		for (int i = 0; i < word.length(); i++) {
			int count = 0;
			int redundant = 0;
			for (int j = 0; j < word.length(); j++) {

				if (word.charAt(i) == word.charAt(j)) {
					redundant++;
				}
			}

			for (int h = 0; h < line.length(); h++) {
				if (word.charAt(i) == line.charAt(h)) {
					count++;
				}
			}

			count = count / redundant;

			if (count < min) {
				min = count;

			}
		}
		System.out.println(min);
	}
}
