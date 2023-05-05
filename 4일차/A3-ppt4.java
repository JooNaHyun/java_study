package java5;

import java.util.Scanner;

public class A3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner(System.in);
		int M = scanner.nextInt();
		int N = scanner.nextInt();
		int sum = 0;
		StringBuilder multiples = new StringBuilder();

		for (int i = 1; i <= M; i++) {
			if (i % N == 0) {
				multiples.append(i + ",");
				sum += i;
			}
		}

		multiples.deleteCharAt(multiples.length() - 1);
		System.out.println("SUM : " + sum + "(" + multiples.toString() + ")");
	}

}
