package ppt6;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Scanner;

public class A8 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);

		System.out.println("첫번째 단어를 입력하세요.");
		String word1 = "";
		try {
			word1 = scanner.nextLine();
		} catch (Exception e) {
			System.out.println("Error");
			return;
		}

		System.out.println("두번째 단어를 입력하세요.");
		String word2 = "";
		try {
			word2 = scanner.nextLine();
		} catch (Exception e) {
			System.out.println("Error");
			return;
		}

		ArrayList<Character> arrWord1 = new ArrayList<>();
		ArrayList<Character> arrWord2 = new ArrayList<>();
		HashSet<Character> ch = new HashSet<>();

		char c1;
		for (int i = 0; i < word1.length(); i++) {
			c1 = word1.charAt(i);
			arrWord1.add(c1);
		}
		char c2;
		for (int j = 0; j < word2.length(); j++) {
			c2 = word2.charAt(j);
			arrWord2.add(c2);
		}

		System.out.println("첫번째 단어 크기 : " + arrWord1.size());
		System.out.println("두번째 단어 크기 : " + arrWord2.size());

		for (int i = 0; i < arrWord1.size(); i++) {
			for (int j = 0; j < arrWord2.size(); j++) {
				if (arrWord1.get(i) == arrWord2.get(j)) {
					ch.add(arrWord2.get(j));
				}
			}
		}

		System.out.println("겹치는 숫자의 개수 : " + ch.size());
	}

}
