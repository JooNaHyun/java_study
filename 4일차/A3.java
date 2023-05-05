package daily0322;

public class A3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String text = "I go to school";
		text = text.toUpperCase();

		for (int i = 65; i < 91; i++) {
			int count = 0;
			for (int j = 0; j < text.length(); j++) {
				char a = text.charAt(j);
				if (i == (int) a) {
					count++;
					
				}
			}
			if(count > 0)
			System.out.println((char) i + " - " + count);
		}

	}

}
