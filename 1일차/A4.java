package dailyPKG;

public class A4 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		final int Month = 3;
		final int Hour;
		Hour = 24;
		//Month = 13;
		System.out.println(Hour);
		System.out.println(Month);
		   
		int age1 = 30;
		double weight = 68.5;
		String name = "John";
		        
		System.out.println(name + "의 나이는 " + age1 + "세이고, 체중은 " + weight + "kg입니다.");
		
		  byte b = 127;
	      short s = 32767;
	      int i = 2147483647;
	      long l = 9223372036854775807L;
	        
	      // 실수형
	      float f = 3.141592F;
	      double d = 3.141592653589793;
	        
	       // 문자형
	      char c = 'A';
	      String str = "Hello, world!";
	        
	      System.out.println("byte: " + b);
	      System.out.println("short: " + s);
	      System.out.println("int: " + i);
	      System.out.println("long: " + l);
	      System.out.println("float: " + f);
	      System.out.println("double: " + d);
	      System.out.println("char: " + c);
	      System.out.println("String: " + str);
	      
	      int age2 = 30;
	        
	        // if 예제
	        if (age2 >= 20) {
	            System.out.println("성인입니다.");
	        } else {
	            System.out.println("미성년자입니다.");
	        }
	        
	        // switch 예제
	        int score = 85;
	        switch (score / 10) {
	            case 10:
	            case 9:
	                System.out.println("A학점입니다.");
	                break;
	            case 8:
	                System.out.println("B학점입니다.");
	                break;
	            case 7:
	                System.out.println("C학점입니다.");
	                break;
	            case 6:
	                System.out.println("D학점입니다.");
	                break;
	            default:
	                System.out.println("F학점입니다.");
	                break;
	        }
	}
}
