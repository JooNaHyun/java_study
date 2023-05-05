package java5;

import java.util.Scanner;

public class A9 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		int t1 = scanner.nextInt();
		int t2 = scanner.nextInt();
		int result = interval1(t1, t2);
		System.out.println(result + "s");
		
	
	}
	public static int interval1 (int t1, int t2) {
		int hour1s = (t1 / 10000) *3600;
		int minute1s = ((t1 /100) % 100) * 60;
		int second1 = t1 % 100;
		int hour2s = (t2 / 10000) *3600;
		int minute2s = ((t2 /100) % 100) * 60;
		int second2 = t2 % 100;
		
		int t11 = hour1s + minute1s + second1;
		int t22 = hour2s + minute2s + second2;
		
		int minus = t22 - t11;
		return minus;
	
	}
}
