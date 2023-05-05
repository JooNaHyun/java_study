package PPt5;

import java.util.Arrays;
import java.util.Scanner;

public class A5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner(System.in);

		String str = scanner.nextLine();

		String[] putline = str.split(" ");
		for(int i =0; i < putline.length; i++) {
			System.out.println(putline[i]);
		}
		
		Arrays.sort(putline);
		for(int j = 0; j < putline.length ; j++) {
			System.out.print(putline[j] + " ");
		}

	}

}
