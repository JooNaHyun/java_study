package daily0321;

import java.util.Scanner;

public class P11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		System.out.println("#Current Converter");
		System.out.println("1. South Korean won -> United States Dollar");
		System.out.println("2. United States Dollar -> Shouth Korean won");
		int n;
		while (true) {
			n = scanner.nextInt();
			if (n == 1 || n == 2) {
				break;
			} else {
				System.out.println("다시 입력해주세요");
			}
		}
			double usd = 1304.55;
			if (n == 1) {
				int won = scanner.nextInt();
				double dollar = won / usd;
				System.out.println(Math.round(dollar * 100) / 100.0);
			} else {
				double dollar1 = scanner.nextInt();
				double won1 = dollar1 * usd;
				System.out.println(won1);
			}

		

	}

}
