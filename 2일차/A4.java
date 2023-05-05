package daily0320;

import java.util.Scanner;

public class A4 {

	public static void main(String[] args) {
		
			Scanner scanner = new Scanner(System.in);
			int n = scanner.nextInt();
			for (int i = 0; i < n; i++) {
				for(int k=0; k<n-i; k++) {
					System.out.print(" ");
				}
					for (int j = 0; j < 2*i+1; j++) {
						System.out.print("*");
					}
					System.out.println();	
				}
		}

	}

