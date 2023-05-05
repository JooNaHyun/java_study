package java5;

public class A4class {

	String word = null;

	public A4class(String word) {



	}

	public String Encryption(String m) {
		StringBuilder encryptedMessage = new StringBuilder();
		for (int i = 0; i < m.length(); i++) {
			char c = m.charAt(i);
			char shifted = (char) ((c - 'a' + 3) % 26 + 'a');
			encryptedMessage.append(shifted);
		}
		return encryptedMessage.toString();
	}

	public static String decrypt(String m) {
		StringBuilder decryptedMessage = new StringBuilder();
		for (int i = 0; i < m.length(); i++) {
			char c = m.charAt(i);
			char shifted = (char) ((c - 'a' - 3 + 26) % 26 + 'a');
			decryptedMessage.append(shifted);
		}
		return decryptedMessage.toString();
	}

}
