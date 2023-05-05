package daily0405;

public class multiple2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int k31_i = 1;// 단수
		int k31_j;// 곱하는 수

		for (k31_j = 1; k31_j < 4; k31_j = k31_j + 1) {
			// 1부터 3까지 반복하는데 1씩 증가하면서 반복
			System.out.printf("*************** *************** ***************\n");
			// *************사이를 탭으로 띄운다.
			System.out.printf("구구단 %d 단 \t구구단 %d 단\t구구단 %d 단\t\n", k31_j, k31_j + 3, k31_j + 6);
			// 1이면 1단,4단, 7단 탭으로 구분하고 한 줄 넘어가기
			System.out.printf("*************** *************** ***************\n");
			// *************사이를 탭으로 띄운다.
			for (k31_i = 1; k31_i < 10; k31_i++) {
				// 1부터9까지 1씩 증가하면서 반복
				System.out.printf("%d * %d = %d\t", k31_j, k31_i, k31_j * k31_i);
				// 1이면 1단 출력하고 탭
				System.out.printf("%d * %d = %d\t", k31_j + 3, k31_i, (k31_j + 3) * k31_i);
				// 1이면 4단 출력하고 탭
				System.out.printf("%d * %d = %d\n", k31_j + 6, k31_i, (k31_j + 6) * k31_i);
				// 1이면 7단 출력하고 한 줄 넘어가기

			}

		}

	}

}
