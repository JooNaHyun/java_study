package daily0405;

public class calendar1 {

	public static void main(String[] args) {
		int k31_iWeekday = 5;// ���� �ʱ�ȭ
		int[] k31_iEnd = { 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };// ���� ����¥ �迭 ����
		boolean k31_yd_flag = true;// ���� �˻�

		for (int k31_iMon = 0; k31_iMon < 12; k31_iMon++) {// 0���� 11���� �ݺ�(��)
			System.out.printf("\n\n         %d��\n", k31_iMon + 1);// �� �������� ���
			System.out.printf("=====================\n");// ����ϰ� �� �� �Ѿ��
			System.out.printf(" �� �� ȭ �� �� �� ��\n");// ����ϰ� �� �� �Ѿ��

			if (k31_yd_flag == true) {// ������ true��
				k31_iEnd[1] = 29;// ����¥�� 29���̰�
			} else {
				k31_iEnd[1] = 28;// �ƴϸ� ����¥�� 28���̴�.
			}

			for (int k31_i = 1; k31_i <= k31_iEnd[k31_iMon]; k31_i++) {
				// 1���� k31_End[k31_iMon]�� �迭�� �ε��� ����ŭ �ݺ����鼭 1�� ������Ų��.(�ϼ�)
				if (k31_i == 1) {// 1���� ��
					for (int k31_j = 0; k31_j < k31_iWeekday; k31_j++) {
						// 0���� k31_dayOfWeek �� ������ �ݺ��ض�.
						System.out.printf("%3s", " ");
					} // k31_iWeekday��ŭ ��ĭ ���(���۳�¥ ���߱� ���ؼ�)
				}

				System.out.printf("%3d", k31_i);// ĭ�� ���缭 ������ ���ķ� ���(�ϼ� ���)
				k31_iWeekday++;// ���� ����

				if (k31_iWeekday == 7) {// ������ �Ͽ����̸�
					k31_iWeekday = 0;// 0���� �ٲ���
					System.out.printf("\n");// ���� �ٷ�
				}
			}

		}
	}

}