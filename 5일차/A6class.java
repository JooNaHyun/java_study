package java5;

public class A6class {

	public static String consonant(String ch) {
		int ccount = 0;
		int vcount = 0;

		for (int i = 0; i < ch.length(); i++) {
			char oneword = ch.charAt(i);
			if(oneword != ' ') {
				if (oneword == ('a') || oneword == ('e') || oneword == ('i') || oneword == ('o')
						|| oneword == ('u') || oneword == ('A') || oneword == ('E') || oneword == ('I') || oneword == ('O')
								|| oneword == ('U') == true) {
					vcount++;
				} else {
					ccount++;
				}
			}


		}
		System.out.println("Num.of Consonant :" + ccount);
		System.out.println("Num.of Vowels :" + vcount);
		return ch;
	}

}
