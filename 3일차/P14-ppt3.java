package ppt3;

import java.util.Scanner;

public class P141 { // 관사 판별

	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);
		String sentence = scanner.nextLine();

		String[] words = sentence.split(" ");

		int[] aWords = new int[words.length];
		int count = 0;

		for (int i = 0; i < words.length; i++) {
			if (words[i].equals("a")) {
				aWords[count] = i;
				count++;
			}
		}

		for (int i = 0; i < count; i++) {
			int index = aWords[i];
			String word = words[index + 1];
			char firstLetter = word.charAt(0);

			if (firstLetter == 'a' || firstLetter == 'e' || firstLetter == 'i' || firstLetter == 'o'
					|| firstLetter == 'u') {
				words[index] = "an";
			}
		}

		// an 찾기
		for (int i = 0; i < words.length; i++) {
			if (words[i].equals("an")) {
				aWords[count] = i;
				count++;
			}
		}

		for (int i = 0; i < count; i++) {
			int index = aWords[i];
			String word = words[index + 1];
			char firstLetter = word.charAt(0);

			if (firstLetter == 'a' || firstLetter == 'e' || firstLetter == 'i' || firstLetter == 'o'
					|| firstLetter == 'u' || firstLetter == 'A' || firstLetter == 'E' || firstLetter == 'I'
					|| firstLetter == 'O' || firstLetter == 'U') {
				words[index] = "an";
			} else {
				words[index] = "a";
			}
			break;
		}

		String newSentence = "";
		for (int i = 0; i < words.length; i++) {
			newSentence += words[i];
			if (i < words.length - 1) {
				newSentence += " ";
			}
		}
		System.out.println(newSentence);

	}

}