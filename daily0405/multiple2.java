package daily0405;

public class multiple2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int k31_i = 1;// �ܼ�
		int k31_j;// ���ϴ� ��

		for (k31_j = 1; k31_j < 4; k31_j = k31_j + 1) {
			// 1���� 3���� �ݺ��ϴµ� 1�� �����ϸ鼭 �ݺ�
			System.out.printf("*************** *************** ***************\n");
			// *************���̸� ������ ����.
			System.out.printf("������ %d �� \t������ %d ��\t������ %d ��\t\n", k31_j, k31_j + 3, k31_j + 6);
			// 1�̸� 1��,4��, 7�� ������ �����ϰ� �� �� �Ѿ��
			System.out.printf("*************** *************** ***************\n");
			// *************���̸� ������ ����.
			for (k31_i = 1; k31_i < 10; k31_i++) {
				// 1����9���� 1�� �����ϸ鼭 �ݺ�
				System.out.printf("%d * %d = %d\t", k31_j, k31_i, k31_j * k31_i);
				// 1�̸� 1�� ����ϰ� ��
				System.out.printf("%d * %d = %d\t", k31_j + 3, k31_i, (k31_j + 3) * k31_i);
				// 1�̸� 4�� ����ϰ� ��
				System.out.printf("%d * %d = %d\n", k31_j + 6, k31_i, (k31_j + 6) * k31_i);
				// 1�̸� 7�� ����ϰ� �� �� �Ѿ��

			}

		}

	}

}
