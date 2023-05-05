package daily0320;

import java.util.Scanner;

public class A3 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int n = scanner.nextInt();
		for (int i = 1; i <= n; i++) {
			for (int j = 1; j < i+1; j++) {
				
			System.out.print("*");
			}
		System.out.println("");
		}
	}
}