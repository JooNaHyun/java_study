package daily0322;

import java.util.Scanner;

public class A2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		int pcount = 0;
		int ncount = 0;
		int ocount = 0;
		int ecount = 0;
		
		while(true){
			int num = scanner.nextInt();
		
			if(num > 0) {
				pcount ++;
			}else {
				ncount ++;
			}
			if(num % 2 == 0) {
				ocount ++;
			}else{
				ecount ++;
			}
			System.out.println("p - " + pcount + ", " + "N - " + ncount + ", " + "E - " + ecount + ", " + "O - " + ocount);
		}
	}

}
