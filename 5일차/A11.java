package java5;
import java.util.Scanner;
public class A11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		int N = sc.nextInt();
		int M = sc.nextInt();

		dice(N, M, "");
	}

	public static void dice(int N, int M, String result) {
		// 주사위를 N번 던졌을 때, 합이 M이 되는 경우를 출력하는 함수
		if (N == 0 && M == 0) {
			System.out.println(result.trim());
		} else if (N > 0 && M >= N && M <= 6 * N) {
			// 주사위를 더 던질 수 있고, 합이 가능한 범위 내에 있는 경우
			for (int i = 1; i <= 6; i++) {
				dice(N - 1, M - i, result + " " + i);
			}
		}
	}
}
