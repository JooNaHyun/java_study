package daily0405;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class paper31 {

	public static int netprice(int price2, double tax_rate) {
		return (int) (price2 / (1 + tax_rate));// k31_price와 k31_rate값을 받아서 세전가격을 return
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Calendar k31_day = Calendar.getInstance();
		Calendar k31_day2 = Calendar.getInstance();

		Date date = new Date();

		DecimalFormat k31_df = new DecimalFormat("###,###,###,###,###");
		k31_day2.setTime(date);
		k31_day2.add(Calendar.HOUR, -2);

		k31_day.setTime(date);

		SimpleDateFormat k31_today = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		SimpleDateFormat k31_today1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat k31_today2 = new SimpleDateFormat("yyyyMMdd");

		String[] itemname = { "대추방울 토마토", "코카 콜라 제로 1.5LX2", "피코크 정통 꿔바로우500g", "[농심]육개장 사발면(86gX6입)",
				"한우 채끝 구이용 1등급(100g)(팩)", "콩이가득두부찌개용300g", "[농심]안성탕면 5입 625g(125g5입)", "양념 소불고기(800g)",
				"피코크 모짜렐라 비프라자냐350g", "[풀무원]국산콩 콩나물 340g", "노브랜드 키친타올 200매*6롤", "[노브랜드]한입쏙쏙비엔나550g",
				"피코크 에이클래스 시그니처 그릭요거트 450g", "앱솔루트 유기농 궁 2 800g", "CJ 비비고 사골 곰탕 500g", "[칠레산]청포도 900g/팩",
				"켈로그 콘푸로스트 600g", "크리넥스 3겹 데코 &소프트 30m*30롤", "[목우촌]주부9단 비엔나소시지1kg", "[서울우유]저지방 우유(1L2개)",
				"[청우]참깨스틱220g", "피코크 새우볶음밥6입(210g*6)", "[CJ]햇반(210g*12입)", "필라델피아 크림치즈 싱글컵(200g)", "땅끝농협 햇 깐마늘 300g",
				"[노브랜드]도시락 김 100g(5g*20)", "윌 오리지날 150mlX5개", "하우스 햇감자(1kg/봉)", "노브랜드 꽉찬 종합어묵 10000g",
				"필리핀산 과즙팡팡 컷파인애플 1kg" };// 상품명(총 32품목)

		int[] price = { 1980, 4580, 6780, 5040, 11880, 1480, 3700, 15980, 4780, 2600, 5480, 6980, 4960, 28000, 1980,
				8980, 4680, 25900, 9980, 4980, 4880, 8380, 13980, 9280, 4980, 5480, 8000, 6480, 4980, 9000 }; // 상품별
																														// 가격(단가)

		int[] num = { 1, 1, 3, 4, 5, 2, 1, 2, 1, 2, 5, 6, 1, 3, 1, 2, 1, 3, 1, 2, 3, 1, 5, 2, 3, 4, 1, 1, 2, 3 }; // 수량
		boolean[] taxfree = { true, false, false, false, false, false, false, false, false, false, true, false, true,
				false, false, false, false, true, false, false, false, false, false, false, false, false, false, false,
				false, true };

		int totalprice1 = 0;
		int totalprice2 = 0;

		System.out.printf("emart");
		System.out.printf("         이마트 죽전점 (031)888-1234\n");
		System.out.printf("              206-86-50913 강희석\n");
		System.out.printf("              용인 수지구 포은대로 552\n\n");
		System.out.printf("영수증 미지참시 교환/환불 불가\n");
		System.out.printf("정상상품에 한함. 30일 이내(신선 7일)\n");
		System.out.printf("※일부 브랜드매장 제외(매장 고지물참조)\n");
		System.out.printf("교환/환불 구매점에서 가능(결제카드 지참)\n\n");
		System.out.printf("[구 매]%-21.21s", k31_today.format(k31_day.getTime()));
		System.out.printf("%13.13s\n", "POS:0011-9861");
		System.out.printf("----------------------------------------- \n");
		System.out.printf("   상 품 명        단  가   수량   금  액 \n");

		for (int i = 0; i < itemname.length; i++) {

			String cc = cutString2(itemname[i], 14); // bb을 잘라서 cc에 대입

			if (i % 5 == 0) {
				System.out.printf("----------------------------------------- \n");

			}
			if (taxfree[i] == true) {
				System.out.printf("* %s%11s%3d%11s\n", cc, k31_df.format(price[i]), num[i],
						k31_df.format(price[i] * num[i]));
				totalprice1 = totalprice1 + price[i] * num[i];

			} else {

				System.out.printf("  %s%11s%3d%11s\n", cc, k31_df.format(price[i]), num[i],
						k31_df.format(price[i] * num[i]));
				totalprice2 = totalprice2 + price[i] * num[i];
			}

		}

		double tax_rate = 0.1;// 세율 선언
		double netprice = netprice(totalprice2, tax_rate);// 세전가격을 계산 한 값을 대입
		double tax = totalprice2 - netprice;// 부가세 계산
		double totalprice = totalprice1 + netprice + tax;
		int havepoint = 5637;
		double point = totalprice / 1000;

		System.out.printf("\n");
		System.out.printf("               총 품목 수량");
		System.out.printf("%14s\n", itemname.length);
		System.out.printf("            (*)면 세  물 품");
		System.out.printf("%14s\n", k31_df.format(totalprice1));
		System.out.printf("               과 세  물 품");
		System.out.printf("%14s\n", k31_df.format(netprice));
		System.out.printf("               부   가   세");
		System.out.printf("%14s\n", k31_df.format(tax));
		System.out.printf("               합        계");
		System.out.printf("%14s\n", k31_df.format(totalprice));
		System.out.printf("결 제 대 상 금 액");
		System.out.printf("%24s\n", k31_df.format(totalprice));
		System.out.printf("----------------------------------------- \n");
		System.out.printf("%-18s", "0012 KEB 하나");
		System.out.printf("%18s\n", "541707**0484/35860658");
		System.out.printf("%-18s", "카드결제(IC)");
		System.out.printf("%-5s", "일시불 / ");
		System.out.printf("%10s\n", k31_df.format(totalprice));
		System.out.printf("----------------------------------------- \n");
		System.out.printf("            [신세계포인트 적립]        \n");
		System.out.printf("주*현 고객님의 포인트 현황입니다.\n");
		System.out.printf("금회발생포인트      9350**9995 %10s\n", k31_df.format((int)point));
		System.out.printf("누계(가용)포인트         %7s(%7s)\n", k31_df.format(havepoint + (int)point), k31_df.format(havepoint));
		System.out.printf("*신세계포인트 유효기간은 2년입니다.\n");
		System.out.printf("----------------------------------------- \n");
		System.out.printf("   구매금액기준 무료주차시간 자동부여     \n");
		System.out.printf("%-18s", "차량번호 : ");
		System.out.printf("%18s\n", "32저****");
		System.out.printf("%-18s", "입차시간 : ");
		System.out.printf("%18s\n", k31_today1.format(k31_day2.getTime()));
		System.out.printf("----------------------------------------- \n");
		System.out.printf("%-20s", "캐셔:084599 양00");
		System.out.printf("%18s\n", "1150");
		System.out.printf("     %s/00119861/00164980/31\n", k31_today2.format(k31_day.getTime()));

	}

	public static String cutString2(String str, int len) {

		byte[] by = str.getBytes();
		if (by.length <= 14) {
			str = new String(by, 0, by.length);
			for (int i = by.length; i < 14; i++) {
				str = str + " ";
			}
			return str;
		} else {
			int count = 0;
			try {
				for (int i = 0; i < len; i++) {
					if ((by[i] & 0x80) == 0x80)
						count++; // 핵심 코드
				}
				if ((by[len - 1] & 0x80) == 0x80 && (count % 2) == 1) {
					len--; // 핵심코드
					String str1 = new String(by, 0, len) + " ";
					return str1;
				}
			} catch (java.lang.ArrayIndexOutOfBoundsException e) {
				System.out.println(e);
				return "";
			}
			String str2 = new String(by, 0, len);
			return str2;
		}
	}

}