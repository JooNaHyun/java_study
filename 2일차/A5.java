package daily0320;

import java.util.Scanner;

public class A5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		int n = scanner.nextInt();
		for (int i = 0; i < n; i++) {
			
			for (int k = 0; k < i; k++) {
				System.out.print(" ");
			}
			
			for (int j = (2 * n) - 1; j > 2 * i ; j--) { // 987654321 -> 9876543 -> 98765 -> 987 -> 95
				System.out.print("*");
			}
			
			System.out.println();
		}

	}

}
