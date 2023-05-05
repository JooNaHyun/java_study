package dailyPKG;

import java.util.Scanner;

public class P12 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Input the 1st number!");
		int n= scanner.nextInt();
	
		System.out.println("Input the 2nd number!");
		int j= scanner.nextInt();
		
		int result = n+j;
		System.out.println("result : " + n + "+" + j + "=" + result);


	}

}
