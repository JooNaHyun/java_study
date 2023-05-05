package daily0321;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Scanner;

public class P7 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

	      System.out.print("Enter the first date (yyyy-mm-dd): ");
	      String input1 = scanner.nextLine();
	      LocalDate date1 = LocalDate.parse(input1);

	      System.out.print("Enter the second date (yyyy-mm-dd): ");
	      String input2 = scanner.nextLine();
	      LocalDate date2 = LocalDate.parse(input2);



	      long daysBetween = ChronoUnit.DAYS.between(date1, date2);
	      
	      System.out.println(daysBetween-1);

	}
}
