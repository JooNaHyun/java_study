package PPt5;

import java.util.ArrayList;
import java.util.Scanner;

public class A6 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner(System.in);
		int num = scanner.nextInt();

		ArrayList<Integer> fibonacci = new ArrayList<Integer>();
		fibonacci.add(0);
		fibonacci.add(1);

		for (int i = 2; i < num; i++) {
			int fn = fibonacci.get(i - 1) + fibonacci.get(i - 2);
			fibonacci.add(fn);
		}

	System.out.println(fibonacci);
	}

}
