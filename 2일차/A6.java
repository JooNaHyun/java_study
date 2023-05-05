package daily0320;

import java.util.Scanner;

public class A6 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		int n = scanner.nextInt();
		for(int i=1; i<n; i++) {
			int j = n%i;
			if(j == 0) {
				System.out.println(i);
			}
	}

}
}
