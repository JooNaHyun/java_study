package ppt6;

import java.util.Scanner;

public class A5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] numbers = { 123, 32, 356, 53, 2, 67, 31, 78, 41, 9, 29 };

		Scanner scanner = new Scanner(System.in);
		try {
			System.out.print("찾을 숫자 입력: ");
			int target = 0;

			target = scanner.nextInt();

			for (int number : numbers) {
				int current = number;
				while (current != 0) {
					int digit = current % 10;
					if (digit == target) {
						System.out.print(number + " ");
						break;
					}
					current /= 10;
				}
			}
		} catch (Exception e) { // 예외 처리
			System.out.println("error");
		}

	}
}