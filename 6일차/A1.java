package PPt5;

public class A1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String[][] scores = { { "Jeong", "70", "80", "100" }, { "Pyo", "60", "70", "86" },
				{ "Choi", "54", "100", "82" }, { "Mike", "87", "95", "79" } };

		// Calculate the summation, average, minimum, and maximum scores for each
		// subject and person
		int numPeople = scores.length;
		int numSubjects = scores[0].length - 1;
		int[] subjectSums = new int[numSubjects];
		int[] subjectMins = new int[numSubjects];
		int[] subjectMaxs = new int[numSubjects];

		for (int i = 0; i < numSubjects; i++) {
			int subjectSum = 0;
			int subjectMin = Integer.parseInt(scores[0][i + 1]);
			int subjectMax = Integer.parseInt(scores[0][i + 1]);

			for (int j = 0; j < numPeople; j++) {
				int score = Integer.parseInt(scores[j][i + 1]);

				subjectSum += score;
				subjectMin = Math.min(subjectMin, score);
				subjectMax = Math.max(subjectMax, score);
			}

			subjectSums[i] = subjectSum;
			subjectMins[i] = subjectMin;
			subjectMaxs[i] = subjectMax;
		}

		for (int i = 0; i < numPeople; i++) {
			int personSum = 0;

			for (int j = 1; j < scores[i].length; j++) {
				personSum += Integer.parseInt(scores[i][j]);
			}

			double personAvg = personSum / (double) numSubjects;

			System.out.println(scores[i][0] + " - Sum: " + personSum + ", Avg: " + personAvg);
		}

		for (int i = 0; i < numSubjects; i++) {
			double subjectAvg = subjectSums[i] / (double) numPeople;

			System.out.println("Subject " + (i + 1) + " - Sum: " + subjectSums[i] + ", Avg: " + subjectAvg + ", Min: "
					+ subjectMins[i] + ", Max: " + subjectMaxs[i]);
		}
	}

}
