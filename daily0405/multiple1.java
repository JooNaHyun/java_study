package daily0405;

public class multiple1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int k31_i = 1;// ���ϴ� ��
		int k31_j;// ��

		for (k31_j = 1; k31_j < 10; k31_j = k31_j + 3) {
			// 1���� 9���� �ݺ��ϴµ� �ܼ��� 3�ܾ� �ø�
			System.out.printf("*************** *************** ***************\n");
			// *************���̸� ������ ����.
			System.out.printf("������ %d �� \t������ %d ��\t������ %d ��\t\n", k31_j, k31_j + 1, k31_j + 2);
			// �ܼ��� ���� 1�̸� 1,2,3�� ����ϰ� ����������

			System.out.printf("*************** *************** ***************\n");
			// *************���̸� ������ ����.
			for (k31_i = 1; k31_i < 10; k31_i++) {
				// 1���� 9���� 1�� �����ϸ鼭 �ݺ�
				System.out.printf("%d * %d = %d\t", k31_j, k31_i, k31_j * k31_i);
				// 1�̸� 1�� ����ϰ� ��
				System.out.printf("%d * %d = %d\t", k31_j + 1, k31_i, (k31_j + 1) * k31_i);
				// 1���� 1�� ���� 2�� ��� ��
				System.out.printf("%d * %d = %d\n", k31_j + 2, k31_i, (k31_j + 2) * k31_i);
				// 1���� 2�� ���� 3�� ����ϰ� �� �� �Ѿ��.

			}

		}

	}

}
