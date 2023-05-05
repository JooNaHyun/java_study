package daily0320;

import java.util.Scanner;

public class A10 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner scanner = new Scanner(System.in);
		System.out.println("#menu");
		System.out.println("1.Coke - 340");
		System.out.println("2.Orange Juice - 500");
		System.out.println("3.Milk - 650");
		System.out.println("4.Water - 290");
		System.out.println("5.Coffee - 170");
		System.out.print("->"); 
		int num = scanner.nextInt();
		int money2 = 0;
		if (num == 1) {
			money2 = 340;
		}else if (num == 2) {
			money2 = 500;
		}else if (num == 3) {
			money2 = 650;
		}else if (num == 4) {
			money2 = 290;
		}else {
			money2 = 170;
		}
		
		double hundred = Math.floor((1000 - money2) / 100);
		double fifty = Math.floor(((1000 - money2) % 100)/50);
	    double ten= Math.floor(((1000 - money2) % 50)/10);

		
		System.out.println("The change is "+ (1000 - money2) +"("+ "100 X" + (int)hundred + ",50 X" + (int)fifty +",10 X" + (int)ten +")");
	}

}
