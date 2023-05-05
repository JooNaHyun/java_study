package java5;

import java.util.Scanner;

public class A7 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
	      int subject = scanner.nextInt(); 
	 
	      double totalgu = 0;
	      double totals = 0;
	      double result = 0;
	      for(int j = 0; j < subject; j++) {
	         double num = scanner.nextDouble();
	         String score = scanner.next();
	         double grade = gradecal(score);
	         totals = totals + num;
	         totalgu = totalgu + grade * num;
	         
	      
	      }   
	      result = totalgu / totals;
	      System.out.println(result);
	      

	
	}
	  public static double gradecal(String score) {
	      double grade;
	      switch (score) {
	        case "A+":
	            grade = 4.5;
	            break;
	        case "A":
	           grade = 4.0;
	            break;
	        case "B+":
	           grade = 3.5;
	            break;
	        case "B":
	           grade = 3.0;
	            break;
	        case "C+":
	           grade = 2.5;
	            break;
	        case "C":
	           grade = 2.0;
	            break;
	        case "D+":
	           grade = 1.5;
	            break;
	        case "D":
	           grade = 1.0;
	            break;
	        default:
	           grade = 0.0;
	            break;
	    }
	      return grade;
	   }


}
