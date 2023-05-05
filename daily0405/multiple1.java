package daily0405;

public class multiple1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int k31_i = 1;// 곱하는 수
		int k31_j;// 단

		for (k31_j = 1; k31_j < 10; k31_j = k31_j + 3) {
			// 1부터 9까지 반복하는데 단수를 3단씩 늘림
			System.out.printf("*************** *************** ***************\n");
			// *************사이를 탭으로 띄운다.
			System.out.printf("구구단 %d 단 \t구구단 %d 단\t구구단 %d 단\t\n", k31_j, k31_j + 1, k31_j + 2);
			// 단수가 만약 1이면 1,2,3을 출력하고 다음단으로

			System.out.printf("*************** *************** ***************\n");
			// *************사이를 탭으로 띄운다.
			for (k31_i = 1; k31_i < 10; k31_i++) {
				// 1부터 9까지 1씩 증가하면서 반복
				System.out.printf("%d * %d = %d\t", k31_j, k31_i, k31_j * k31_i);
				// 1이면 1단 출력하고 탭
				System.out.printf("%d * %d = %d\t", k31_j + 1, k31_i, (k31_j + 1) * k31_i);
				// 1에서 1을 더한 2단 출력 탭
				System.out.printf("%d * %d = %d\n", k31_j + 2, k31_i, (k31_j + 2) * k31_i);
				// 1에서 2를 더한 3단 출력하고 한 줄 넘어간다.

			}

		}

	}

}
