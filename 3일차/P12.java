package daily0321;

import java.util.Scanner;

public class P12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		System.out.println("#Current Converter");
		System.out.println("1. Celcius -> Fahrenheit");
		System.out.println("2. Fahrenheit -> Celcius");
		int n;
		while (true) {
			n = scanner.nextInt();
			if (n == 1 || n == 2) {
				break;
			} else {
				System.out.println("다시 입력해주세요");
			}
		}
			
			if (n == 1) {
				int c = scanner.nextInt();
				double f = c*1.8+32;
				System.out.println(f);
			} else {
				double f = scanner.nextInt();
				double c = (f-32) * 5/9;
				System.out.println(c);
			}

	}

}
