package daily0405;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class paper22 {

	public static int netprice(int k31_price, double k31_rate) {
		return (int) (k31_price / (1 + k31_rate));
		// 총 가격과 세율(0.1)을 받아서 총 가격에 1.1을 나눈 가격이 세전가격이다.
		// 이 클래스에서 세전가격을 계산해서 main함수에 리턴해준다.
	}

	public static void main(String[] args) {

		String k31_itemnames[] = { "참깨끗한물티슈150매입캡형", "잘풀리는집3겹두루마리화장지12롤", "모던네트망(69X26cm)" };
		// 상품명 배열 선언
		String k31_itemcode[] = { "1031649", "60743", "1022602" };
		// 상품코드 배열 선언
		int k31_price[] = { 10000, 500, 2000 };
		// 상품가격 배열 선언
		int k31_amount1[] = { 10, 10, 1 };
		// 상품수량 배열 선언
		int k31_totalprice1 = 0;
		// 총 가격 선언 및 초기화
		
		Date date = new Date();//날짜 가져오기
		

		Calendar k31_day = Calendar.getInstance();// 시스템에서 현재 시간 가져오기
		Calendar k31_day1 = Calendar.getInstance();// 시스템에서 현재 시간 가져오기(14일 더하기 위해)
		k31_day1.setTime(date);
		k31_day1.add(Calendar.DAY_OF_MONTH, 14);
		
		

		DecimalFormat k31_df = new DecimalFormat("###,###,###,###,###");// 3자리마다 콤마 찍기
		SimpleDateFormat k31_today = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");// 출력 형태 지정
		SimpleDateFormat k31_today1 = new SimpleDateFormat("MM월 dd일");// 출력 형태 지정

		System.out.printf("             \"국민가게, 다이소\"        \n");// \"을 이용해서 "출력하기
		System.out.printf("(주)아성다이소_분당서현점\n");//// 출력하고 한줄 넘어가기
		System.out.printf("전화:031-702-6016\n");// 전화 출력하고 한줄 넘어가기
		System.out.printf("본사:서울 강남구 남부수환로 2748 (도곡동)\n");// 본사 출력하고 한줄 넘어가기
		System.out.printf("대표:박정부,신호섭 213-81-53063\n");// 대표 출력하고 한줄 넘어가기
		System.out.printf("매장:경기도 성남시 분당구 분당로53번길 11 (서현동)\n");// 출력하고 한줄 넘어가기
		System.out.printf("========================================= \n");// 출력하고 한줄 넘어가기
		System.out.printf("       소비자중심경영(CCM) 인증기업       \n");// 출력하고 한줄 넘어가기
		System.out.printf("     ISO 9001 품질경영시스템 인증기업     \n");// 출력하고 한줄 넘어가기
		System.out.printf("========================================= \n");// 출력하고 한줄 넘어가기
		System.out.printf("      교환/환불 14일(%s)이내,      \n",  k31_today1.format(k31_day1.getTime()));// 출력하고 한줄 넘어가기
		System.out.printf("(전자)영수증, 결제카드 지참 후 구입매장에서 가능\n");// 출력하고 한줄 넘어가기
		System.out.printf("    포장/가격 택 훼손시 교환/환불 불가      \n");// 출력하고 한줄 넘어가기
		System.out.printf("     체크카드 취소 시 최대 7일 소요       \n");// 출력하고 한줄 넘어가기
		System.out.printf("========================================= \n");// 출력하고 한줄 넘어가기
		System.out.printf("%-13s", "[POS 1058231]");// 13칸 차지하고 왼쪽 정렬해서 출력
		System.out.printf("%28.28s\n", k31_today.format(k31_day.getTime()));
		// 28칸 차지하고 최대 글자 수를 28자로 출력형태를 지정해주고 현재 시스템 시간 가져와서 왼쪽 정렬해서 출력하기
		System.out.printf("========================================= \n");// 출력하고 한줄 넘어가기

		for (int k31_i = 0; k31_i < k31_itemnames.length; k31_i++) {
			// 0에서 상품 배열 길이(29)까지 하나씩 증가시키면서 반복
			String k31_cc = k31_cutString2(k31_itemnames[k31_i], 22);
			// 상품명 배열을 하나씩 가져와서 22바이트 전까지 잘라서 상품명 바이트 수 맞추기
			System.out.printf("%s", k31_cc);
			// 22바이트 전까지 자른 상품명 출력
			System.out.printf("%8s%4d%8s\n", k31_df.format(k31_price[k31_i]), k31_amount1[k31_i],
					k31_df.format(k31_price[k31_i] * k31_amount1[k31_i]));
			// 상품 가격을 8칸, 수량을 3칸, 합계를 8칸 차지하게 출력형태 지정하고 출력한 뒤 한 줄 넘어가기
			System.out.printf("[%s]\n", k31_itemcode);
			// []안에 상품코드 출력하고 한 줄 넘어가기
			k31_totalprice1 = k31_totalprice1 + k31_price[k31_i] * k31_amount1[k31_i];
			// 총합을 for문을 돌면서 가격*수량을 한 값을 더해서 총 금액에 대입

		}

		double k31_tax_rate = 0.1;// 세율 선언
		double k31_netprice = netprice(k31_totalprice1, k31_tax_rate);// 세전가격을 계산 한 값을 대입
		double k31_tax = k31_totalprice1 - k31_netprice;// 부가세 계산(부가세는 총 가격에 세전가격을 뺀 금액)

		System.out.printf("%17.4s", "과세합계");
		// 17칸을 차지하고 최대 글자 수를 4글자로 출력 형태를 설정하고 오른쪽 정렬해서 출력
		System.out.printf("%20.20s\n", k31_df.format(k31_netprice));
		// 세전가격을 세자리마다 콤마 찍어서 출력
		System.out.printf("%18.3s", "부가세");
		// 18칸을 차지하고 최대 3글자로 출력 형태를 지정
		System.out.printf("%20.20s\n", k31_df.format(k31_tax));
		// 20칸을 차지하고 최대 글자 20자로 출력 형태 지정하고 부가세를 세자리마다 콤마 찍어서 출력한 뒤 다음줄로
		System.out.printf("----------------------------------------- \n");// 출력하고 한줄 넘어가기
		System.out.printf("%-18.4s", "판매합계");
		// 18칸 차지하고 최대 글자 4글자로 출력 형태 지정하고 왼쪽 정렬해서 출력
		System.out.printf("%19.19s\n", k31_df.format(k31_totalprice1));
		// 19칸을 차지하고 최대 글자 19자로 출력 형태 지정하고 부가세를 세자리마다 콤마 찍어서 출력한 뒤 다음줄로
		System.out.printf("========================================= \n");// 출력하고 한줄 넘어가기
		System.out.printf("%-18.4s", "신용카드");
		// 18칸 차지하고 최대 글자 4글자로 출력 형태 지정하고 왼쪽 정렬해서 출력
		System.out.printf("%19.19s\n", k31_df.format(k31_totalprice1));
		// 19칸을 차지하고 최대 글자 19자로 출력 형태 지정하고 부가세를 세자리마다 콤마 찍어서 출력한 뒤 다음줄로
		System.out.printf("----------------------------------------- \n");// 출력하고 한줄 넘어가기
		System.out.printf("%-18.4s", "우리카드");
		// 18칸 차지하고 최대 글자 4글자로 출력 형태 지정하고 왼쪽 정렬해서 출력
		System.out.printf("%19.19s\n", "538720**********");
		// 19칸을 차지하고 최대 글자 19자로 출력 형태 지정하고 부가세를 세자리마다 콤마 찍어서 출력한 뒤 다음줄로
		System.out.printf("%13s", "승인번호 77982843(0)");
		// 13칸 차지하고 승인번호 출력
		System.out.printf("%4s", "  승인금액 ");
		// 4칸 차지하고 승인금액 출력
		System.out.printf("%10s\n", k31_df.format(k31_totalprice1));
		// 10칸 차지하고 총 금액을 3자리마다 콤마 찍어서 출력한 뒤 다음줄로
		System.out.printf("========================================= \n");// 출력하고 한줄 넘어가기
		System.out.printf("%25.16s", k31_today.format(k31_day.getTime()));
		// 25칸 차지하고 최대 16글자로 출력형태 지정하고 시스템의 오늘 날짜를 위에서 지정한 형식에 맞게 출력
		System.out.printf(" 분당서현점\n");// 출력하고 한줄 넘어가기
		System.out.printf("상품 및 기타 문의 : 1522-4400\n");
		// 상품 및 기타 문의 출력하고 한줄 넘어가기
		System.out.printf("멤버십 및 샵다이소 관련 문의 : 1599-2211\n");
		// 멤버십 및 샵다이소 관련 문의 출력하고 한줄 넘어가기
		System.out.printf("            2112820610158231        \n");// 출력하고 한줄 넘어가기
		System.out.printf("----------------------------------------- \n");// 출력하고 한줄 넘어가기
		System.out.printf("◈ 다이소 멤버십 앱 또는 홈페이지에 접속\n" + "   하셔서 회원가입 후 다양한 혜택을 누려\n" +
		"   보세요! ◈");
		// 출력하고 한줄 넘어가기
	}

	// 한글의 경우 2바이트로 인식하여 문자열을 자르기 때문에, 한글이 포함된 문자열을 다룰 때
	public static String k31_cutString2(String k31_str, int k31_len) {
		// k31_str의 길이가 주어진 길이 k31_len보다 길 경우, 주어진 길이까지 문자열을 잘라서 반환하는 함수
		byte[] by = k31_str.getBytes();// 함수는 먼저 입력받은 문자열을 바이트 배열로 변환
		if (by.length <= 22) {
			k31_str = new String(by, 0, by.length);
			// k31_str의 길이가 22보다 작거나 같을 때 실행
			// 이 경우, 입력받은 문자열 k31_str을 바이트 배열 by로 변환한 후,
			// 해당 바이트 배열에서 0부터 바이트 배열의 길이 by.length까지의 바이트를 문자열로 변환하여 다시 k31_str에 할당
			for (int i = by.length; i < 22; i++) {
				k31_str = k31_str + " ";
				// for 루프를 이용하여 문자열 k31_str의 길이를 22로 맞추기 위해 (" ") 문자를 추가
				// 이를 통해, 길이가 22인 문자열을 생성하고, 이 문자열을 반환
			}
			return k31_str;// k31_str 리턴
		} else {
			// 입력받은 문자열 k31_str의 길이가 22보다 클 때 실행
			int count = 0;// count초기화
			try {
				for (int i = 0; i < k31_len; i++) {
					if ((by[i] & 0x80) == 0x80)
						count++;
					// 한글은 2바이트로 표현되기 때문에, 해당 바이트가 0x80과 AND 연산을 수행하여 0x80이 나오면,
					// 해당 바이트가 한글을 표현하는 바이트임을 의미
					// 그래서 count 변수를 1씩 증가시켜 한글 문자가 몇 개인지 계산
				}
				if ((by[k31_len - 1] & 0x80) == 0x80 && (count % 2) == 1) {
					k31_len--;
					String str1 = new String(by, 0, k31_len) + " ";
					return str1;
					// 문자열이 주어진 길이보다 길다면, 한글 문자열이 짤린 경우가 있을 수 있음.
					// 이 경우, 마지막 한글 문자가 반으로 짤렸을 가능성이 있기 때문에,
					// 짤린 한글 문자열의 길이를 하나 줄여서 다시 문자열을 만들어라
				}
			} catch (java.lang.ArrayIndexOutOfBoundsException e) {
				System.out.println(e);
				return "";
				// ArrayIndexOutOfBoundsException 예외가 발생한 경우에 실행됨.
				// 이 경우, 예외 메시지를 출력하고 빈 문자열 ""을 반환
				// 이렇게 함으로써, 입력받은 문자열의 길이보다 주어진 길이가 더 작은 경우에도 예외가 발생하지 않도록 처리
			}
			String str2 = new String(by, 0, k31_len);
			return str2;
		} //바이트 배열에서 주어진 길이까지만 잘라서 문자열을 만들고, 이 문자열을 반환하는 부분

	}

}
