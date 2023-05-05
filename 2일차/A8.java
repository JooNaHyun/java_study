package daily0320;

import java.util.Scanner;

public class A8 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner(System.in);
		int n = scanner.nextInt();
		int k = scanner.nextInt();
		int sum = n * k;
		int min;
		if (n < k) {
		 min = n;
		} else {
		 min = k;
		}

		for (int i = min; i >= 1; i--) {
		 if (n % i == 0 && k % i == 0) {
		    System.out.println(i);
		    break;
		 	}
		}
	}
}


