package daily0320;

import java.util.Scanner;

public class A2 {

	public static void main(String[] args) {
			// TODO Auto-generated method stub
		int i = 2;
		while (i <= 9) {
		    System.out.println(i + "단");
		    int j = 1;
		    while (j <= 9) {
		        switch (i) {
		            case 2:
		                System.out.println("2 X " + j + " = " + (2 * j));
		                break;
		            case 3:
		                System.out.println("3 X " + j + " = " + (3 * j));
		                break;
		            case 4:
		                System.out.println("4 X " + j + " = " + (4 * j));
		                break;
		            case 5:
		                System.out.println("5 X " + j + " = " + (5 * j));
		                break;
		            case 6:
		                System.out.println("6 X " + j + " = " + (6 * j));
		                break;
		            case 7:
		                System.out.println("7 X " + j + " = " + (7 * j));
		                break;
		            case 8:
		                System.out.println("8 X " + j + " = " + (8 * j));
		                break;
		            case 9:
		                System.out.println("9 X " + j + " = " + (9 * j));
		                break;
		        }
		        j++;
		    }
		    System.out.println();
		    i++;
		}
	}
}

	


