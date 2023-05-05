package ppt6;

import java.util.Scanner;

public class A6 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("첫 번째 숫자를 입력하세요: ");
        int n = 0;
        try {
            n = scanner.nextInt();
        } catch (Exception e) {
            System.out.println("error");
            return;
        }
        
        System.out.print("두 번째 숫자를 입력하세요: ");
        int m = 0;
        try {
            m = scanner.nextInt();
        } catch (Exception e) {
            System.out.println("error.");
            return;
        }
        
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                System.out.println(i + "," + j);
            }
        }
    }
}