package daily0328;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class P6 {

    public static void main(String[] args) {
        // 현재 시간 출력
    	SimpleDateFormat foramt = new SimpleDateFormat("HH:mm:ss");
		Date time = new Date();
		String dateAndTime = foramt.format(time);
		System.out.println(dateAndTime);

        // 입력 시간 받기
        Scanner scanner = new Scanner(System.in);
        int timeInSeconds = scanner.nextInt();

        // 일정 시간 대기 후 "time is over" 출력
        try {
            Thread.sleep(timeInSeconds * 1000);
            time = new Date();
            dateAndTime = foramt.format(time);
            System.out.println("time is over(" + dateAndTime + ")");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

}
