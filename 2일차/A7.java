package daily0320;

import java.util.Scanner;

public class A7 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner(System.in);
		int n = scanner.nextInt();
		int k = scanner.nextInt();
		int sum = n * k;
		for(int i = 1; i<=sum; i++) {
			if(i % n == 0 && i % k == 0) {
				System.out.println(i);
			break;
			}
		}
	}

}
