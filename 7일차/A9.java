package ppt6;

import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;

public class A9 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		List<Integer> numbers = new ArrayList<>();
		int count = 0;
		while (true) {
			try {
				int num = scanner.nextInt();
				numbers.add(num);
				count++;
				int sum = 0;
				int max = Integer.MIN_VALUE;
				int min = Integer.MAX_VALUE;
				for (int n : numbers) {
					sum = sum + n;
					if (n > max) {
						max = n;
					}
					if (n < min) {
						min = n;
					}
				}
				double mean = (double) sum / count;
				System.out.println("result:" + count + " - Mean " + (int) mean + " , Max " + max + " , Min " + min);

			} catch (InputMismatchException e) {
				System.out.println("프로그램을 종료합니다.");
				break;
			}
		}
	}
}