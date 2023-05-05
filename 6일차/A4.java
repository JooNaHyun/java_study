package PPt5;

import java.util.Scanner;

public class A4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		String word = scanner.nextLine();
		String[] de1 = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",
				"t", "u", "v", "w", "x", "y", "z" };
		String[] de2 = { "z", "y", "x", "w", "v", "u", "t", "s", "r", "q", "p", "o", "n", "m", "l", "k", "j", "i", "h",
				"g", "f", "e", "d", "c", "b", "a" };
		
		StringBuilder decryption = new StringBuilder();

		for (int i = 0; i < word.length(); i++) {
			char c = word.charAt(i);
			int index = c - 'a';
			if (index >= 0 && index < de1.length) {
				decryption.append(de2[index]);
			} else {
				decryption.append(c);
			}
		}

		System.out.println(decryption.toString());
	}

}
