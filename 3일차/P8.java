package daily0321;

//import java.text.ParseException;
import java.text.SimpleDateFormat;
//import java.util.Date;
import java.util.Scanner;
import java.util.Calendar;

public class P8 {

	public static void main(StrinSg[] args) {
	      // TODO Auto-generated method stub
	      Calendar cal = Calendar.getInstance();
	      
	      Scanner scanner = new Scanner (System.in);
	      
	      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
	      
	      String A = scanner.nextLine();
	      int B = scanner.nextInt();
	      
	      try {
	         cal.setTime(dateFormat.parse(A));
	      } catch (Exception e) {
	         e.printStackTrace();
	      }

	      cal.add(Calendar.DATE, B);
	      
	        String result = dateFormat.format(cal.getTime());
	        System.out.println(result);
	      
	   }


}
