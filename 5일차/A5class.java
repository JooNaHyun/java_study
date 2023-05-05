package java5;

public class A5class {
	public static boolean validateString(String input) {
	    if (input.length() < 5) {
	        return false;
	    }

	    boolean hasDigit = false;
	    boolean hasUpperCase = false;
	    boolean hasLowerCase = false;
	    boolean hasN = false;

	    for (int i = 0; i < input.length(); i++) {
	        char ch = input.charAt(i);

	        if (ch >= '0' && ch <= '9') {
	            hasDigit = true;
	        }
	        if (ch >= 'A' && ch <= 'Z') {
	            hasUpperCase = true;
	        }
	        if (ch >= 'a' && ch <= 'z') {
	            hasLowerCase = true;
	        }
	        if (ch == 'n' || ch == 'N') {
	            hasN = true;
	        }
	    }

	    return hasDigit && hasUpperCase && hasLowerCase && hasN;
	}
}