package java5;

import java.util.Scanner;

public class A8 {
	 public static void main(String[] args) {
	      // TODO Auto-generated method stub
	      Scanner scanner = new Scanner(System.in);
	      
	      System.out.println("#Menu");
	      System.out.println("1.Encoder");
	      System.out.println("2.Decoder");
	      System.out.println("3.Exit");
	      while(true) {
	      int choice = scanner.nextInt();

	      switch (choice) {
	      case 1:
	         String word = scanner.next();
	         System.out.println(encode(word));
	         break;
	      case 2:
	         String word1 = scanner.next();
	         System.out.println(decode(word1));
	         break;
	      case 3:
	    	  break; 
	      
	      }
	      
	      
	      }
	      
	   }
	   

	   public static String encode(String word) {
	       String encodedStr = "";
	       for (int i = 0; i < word.length(); i++) {
	           char ch = word.charAt(i);
	           switch (ch) {
	               case '0':
	                   encodedStr += "a";
	                   break;
	               case '1':
	                   encodedStr += "b";
	                   break;
	               case '2':
	                   encodedStr += "c";
	                   break;
	               case '3':
	                   encodedStr += "d";
	                   break;
	               case '4':
	                   encodedStr += "e";
	                   break;
	               case '5':
	                   encodedStr += "f";
	                   break;
	               case '6':
	                   encodedStr += "g";
	                   break;
	               case '7':
	                   encodedStr += "h";
	                   break;
	               case '8':
	                   encodedStr += "i";
	                   break;
	               case '9':
	                   encodedStr += "j";
	                   break;
	               default:
	                  break;
	           }
	       }
	       return encodedStr;
	   }
	   public static String decode(String word1) {
	       String str = "";
	       for (int i = 0; i < word1.length(); i++) {
	           char ch = word1.charAt(i);
	           switch (ch) {
	               case 'a':
	                   str += "0";
	                   break;
	               case 'b':
	                   str += "1";
	                   break;
	               case 'c':
	                   str += "2";
	                   break;
	               case 'd':
	                   str += "3";
	                   break;
	               case 'e':
	                   str += "4";
	                   break;
	               case 'f':
	                   str += "5";
	                   break;
	               case 'g':
	                   str += "6";
	                   break;
	               case 'h':
	                   str += "7";
	                   break;
	               case 'i':
	                   str += "8";
	                   break;
	               case 'j':
	                   str += "9";
	                   break;
	               default:
	                break;
	           }
	       }
	       return str;
	   }

}
