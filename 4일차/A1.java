package daily0322;

import java.util.Scanner;

public class A1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner(System.in);

		int count = 0;
		int max = 0;
		int min = 0;
		Double sum = 0.0;

		while (true) {
			int num = scanner.nextInt();
			count++;
			if (count == 1) {
				max = num;
				min = num;
				sum = (double)num;
			} else {
				max = Math.max(max, num);
				min = Math.min(min, num);
				sum = sum + num;
			}
			System.out.println(
					"Result: " + count + " - Mean " + sum/count + ", Max " + max + ", Min " + min);
		}

	}

}
