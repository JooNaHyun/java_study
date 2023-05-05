package daily0321;

import java.util.Calendar;
import java.util.Scanner;

public class P6 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Calendar cal = Calendar.getInstance();
		Scanner scanner = new Scanner(System.in);
		int year = scanner.nextInt();
		int month = scanner.nextInt();

		cal.set(Calendar.YEAR, year); // 입력받은 년도로 세팅
		cal.set(Calendar.MONTH, month); // 입력받은 월로 세팅
		//cal.set 날짜 설정
		
		System.out.println("  일 \t  월 \t  화 \t  수 \t  목 \t  금 \t  토");

		cal.set(year, month - 1, 1); // 입력받은 월의 1일로 세팅
										// month는 0이 1월이므로 -1을 해준다

		int end = cal.getActualMaximum(Calendar.DATE); // 해당 월 마지막 날짜
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); // 해당 날짜의 요일(1:일요일 … 7:토요일)

		for (int i = 1; i <= end; i++) {
			if (i == 1) {
				for (int j = 1; j < dayOfWeek; j++) {
					System.out.print("\t");
				}//시작일 전까지 공백
			}
			if (i < 10) { // 한자릿수일 경우 공백을 추가해서 줄맞추기
				System.out.print(" ");
			}
			System.out.print("  " + i + "\t");
			if (dayOfWeek % 7 == 0) { // 한줄에 7일씩 출력
				System.out.println();
			}
			dayOfWeek++;

		}

	}
}
