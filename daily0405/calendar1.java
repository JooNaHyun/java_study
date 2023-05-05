package daily0405;

public class calendar1 {

	public static void main(String[] args) {
		int k31_iWeekday = 5;// 요일 초기화
		int[] k31_iEnd = { 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };// 달의 끝날짜 배열 선언
		boolean k31_yd_flag = true;// 윤년 검사

		for (int k31_iMon = 0; k31_iMon < 12; k31_iMon++) {// 0부터 11까지 반복(월)
			System.out.printf("\n\n         %d월\n", k31_iMon + 1);// 몇 월달인지 출력
			System.out.printf("=====================\n");// 출력하고 한 줄 넘어가기
			System.out.printf(" 일 월 화 수 목 금 토\n");// 출력하고 한 줄 넘어가기

			if (k31_yd_flag == true) {// 윤년이 true면
				k31_iEnd[1] = 29;// 끝날짜가 29일이고
			} else {
				k31_iEnd[1] = 28;// 아니면 끝날짜가 28일이다.
			}

			for (int k31_i = 1; k31_i <= k31_iEnd[k31_iMon]; k31_i++) {
				// 1부터 k31_End[k31_iMon]의 배열의 인덱스 값만큼 반복히면서 1씩 증가시킨다.(일수)
				if (k31_i == 1) {// 1일일 때
					for (int k31_j = 0; k31_j < k31_iWeekday; k31_j++) {
						// 0부터 k31_dayOfWeek 값 전까지 반복해라.
						System.out.printf("%3s", " ");
					} // k31_iWeekday만큼 빈칸 출력(시작날짜 맞추기 위해서)
				}

				System.out.printf("%3d", k31_i);// 칸수 맞춰서 오른쪽 정렬로 출력(일수 출력)
				k31_iWeekday++;// 요일 증가

				if (k31_iWeekday == 7) {// 요일일 일요일이면
					k31_iWeekday = 0;// 0으로 바꿔줌
					System.out.printf("\n");// 다음 줄로
				}
			}

		}
	}

}