package daily0320;

import java.util.Scanner;

public class A9 {

	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		int num1 = scanner.nextInt();
		int count = 0;
		for(int i = 1; i<=num1; i++) {
			count = 0;
			for(int j = 1; j<=i; j++) {
				if((i % j) == 0) {
					count++;
				}
				
				}
			if(count == 2) {
				System.out.println(i);
			}
			
		
		
		}

	}
	
}
