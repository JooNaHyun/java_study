package daily0405;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class paper12 {

	public static double k31_netprice(int k31_price, double k31_rate) {
		return (k31_price / (1 + k31_rate));
		// 총 가격과 세율(0.1)을 받아서 총 가격에 1.1을 나눈 가격이 세전가격이다.
		// 이 클래스에서 세전가격을 계산해서 main함수에 리턴해준다.
	}

	public static void main(String[] args) {

		int k31_price = 80000;// 상품가격
		double k31_tax_rate = 0.1;// 세율
		double k31_netprice = k31_netprice(k31_price, k31_tax_rate);
		// 세전가격을 계산 한 값을 대입
		double k31_tax = k31_price - k31_netprice;
		// 부가세 계산(부가세는 총 가격에 세전가격을 뺀 금액)
		Calendar k31_day = Calendar.getInstance();
		// 시스템에서 현재 시간 가져오기

		DecimalFormat k31_df = new DecimalFormat("###,###,###,###,###");
		// 3자리마다 콤마 찍기
		SimpleDateFormat k31_today = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		// 출력 형태 지정

		// 총 41칸
		System.out.printf("신용승인\n");
		// 신용승인 출력하고 다음줄로 넘어가기
		System.out.printf("%-16s", "단말기 : 2N68665898");
		// 16칸을 차지하고 왼쪽 정렬해서 출력
		System.out.printf("%18s\n", "전표번호 : 041218");
		// 18칸을 차지하고 오른쪽 정렬해서 출력
		System.out.printf("가맹점 : 한양김치찌개\n");
		// 가맹점 출력하고 다음줄로 넘어가기
		System.out.printf("주소 : 경기 성남시 분당구 황새울로351번길 10 ,1층\n");
		// 주소 출력하고 다음줄로 넘어가기
		System.out.printf("대표자 : 유창신\n");
		// 대표자 출력하고 다음줄로 넘어가기
		System.out.printf("사업자 : 752-53-00558");
		// 사업자 출력
		System.out.printf("%21s", "TEL : 7055695\n");
		// 21칸을 차지하고 TEL 출력하기
		System.out.printf("- - - - - - - - - - - - - - - - - - - - - \n");// 출력하고 한줄 넘어가기
		System.out.printf("금  액");// 금액 출력
		System.out.printf("%32.10s 원\n", k31_df.format(k31_netprice));
		// 32칸을 차지하고 최대 10글자 까지 쓸 수 있게 출력 형태를 지정하고 세전가격을 세자리마다 콤마 찍어서 출력하고 다음줄로
		System.out.printf("부가세");// 부가세 출력
		System.out.printf("%32.10s 원\n", k31_df.format(k31_tax));
		// 32칸을 차지하고 최대 10글자 까지 쓸 수 있게 출력 형태를 지정하고 세전가격을 세자리마다 콤마 찍어서 출력하고 다음줄로
		System.out.printf("합  계");// 합계 출력
		System.out.printf("%32.10s 원\n", k31_df.format(k31_price));
		// 32칸을 차지하고 최대 10글자 까지 쓸 수 있게 출력 형태를 지정하고 세전가격을 세자리마다 콤마 찍어서 출력하고 다음줄로
		System.out.printf("- - - - - - - - - - - - - - - - - - - - - \n");// 출력하고 한줄 넘어가기
		System.out.printf("우리카드\n");// 출력하고 한줄 넘어가기
		System.out.printf("%-35s\n", "카드번호 : 5387-20**-****-4613(S)  일시불");// 35칸 차지하고 왼쪽 정렬해서 출력
		System.out.printf("거래일시 : %s\n", k31_today.format(k31_day.getTime()));
		// 현재 시스템 시간을 위에 지정해준 형식대로 출력하고 다음줄로
		System.out.printf("승인번호 : 70404427\n");// 승인번호 출력하고 한줄 넘어가기
		System.out.printf("거래번호 : 357734873739\n");// 거래번호 출력하고 한줄 넘어가기
		System.out.printf("매입 : 비씨카드사");// 매입 출력하기
		System.out.printf("%18s\n", "가맹 : 720068568");// 18칸을 차지하고 가맹출력하고 다음줄로
		System.out.printf("알림 : EDC매출표\n");// 알림 출력하고 한줄 넘어가기
		System.out.printf("문의 : TEL)1544-4700\n");// 문의 출력하고 한줄 넘어가기
		System.out.printf("- - - - - - - - - - - - - - - - - - - - - \n");// 출력하고 한줄 넘어가기
		System.out.printf("          * 감사합니다 *            \n");// 출력하고 한줄 넘어가기
		System.out.printf("%39s\n", "표준V2.08_20200212");// 39칸을 차지하고 출력하기

	}

}