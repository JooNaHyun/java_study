package daily0405;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class paper12 {

	public static double k31_netprice(int k31_price, double k31_rate) {
		return (k31_price / (1 + k31_rate));
		// �� ���ݰ� ����(0.1)�� �޾Ƽ� �� ���ݿ� 1.1�� ���� ������ ���������̴�.
		// �� Ŭ�������� ���������� ����ؼ� main�Լ��� �������ش�.
	}

	public static void main(String[] args) {

		int k31_price = 80000;// ��ǰ����
		double k31_tax_rate = 0.1;// ����
		double k31_netprice = k31_netprice(k31_price, k31_tax_rate);
		// ���������� ��� �� ���� ����
		double k31_tax = k31_price - k31_netprice;
		// �ΰ��� ���(�ΰ����� �� ���ݿ� ���������� �� �ݾ�)
		Calendar k31_day = Calendar.getInstance();
		// �ý��ۿ��� ���� �ð� ��������

		DecimalFormat k31_df = new DecimalFormat("###,###,###,###,###");
		// 3�ڸ����� �޸� ���
		SimpleDateFormat k31_today = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		// ��� ���� ����

		// �� 41ĭ
		System.out.printf("�ſ����\n");
		// �ſ���� ����ϰ� �����ٷ� �Ѿ��
		System.out.printf("%-16s", "�ܸ��� : 2N68665898");
		// 16ĭ�� �����ϰ� ���� �����ؼ� ���
		System.out.printf("%18s\n", "��ǥ��ȣ : 041218");
		// 18ĭ�� �����ϰ� ������ �����ؼ� ���
		System.out.printf("������ : �Ѿ��ġ�\n");
		// ������ ����ϰ� �����ٷ� �Ѿ��
		System.out.printf("�ּ� : ��� ������ �д籸 Ȳ�����351���� 10 ,1��\n");
		// �ּ� ����ϰ� �����ٷ� �Ѿ��
		System.out.printf("��ǥ�� : ��â��\n");
		// ��ǥ�� ����ϰ� �����ٷ� �Ѿ��
		System.out.printf("����� : 752-53-00558");
		// ����� ���
		System.out.printf("%21s", "TEL : 7055695\n");
		// 21ĭ�� �����ϰ� TEL ����ϱ�
		System.out.printf("- - - - - - - - - - - - - - - - - - - - - \n");// ����ϰ� ���� �Ѿ��
		System.out.printf("��  ��");// �ݾ� ���
		System.out.printf("%32.10s ��\n", k31_df.format(k31_netprice));
		// 32ĭ�� �����ϰ� �ִ� 10���� ���� �� �� �ְ� ��� ���¸� �����ϰ� ���������� ���ڸ����� �޸� �� ����ϰ� �����ٷ�
		System.out.printf("�ΰ���");// �ΰ��� ���
		System.out.printf("%32.10s ��\n", k31_df.format(k31_tax));
		// 32ĭ�� �����ϰ� �ִ� 10���� ���� �� �� �ְ� ��� ���¸� �����ϰ� ���������� ���ڸ����� �޸� �� ����ϰ� �����ٷ�
		System.out.printf("��  ��");// �հ� ���
		System.out.printf("%32.10s ��\n", k31_df.format(k31_price));
		// 32ĭ�� �����ϰ� �ִ� 10���� ���� �� �� �ְ� ��� ���¸� �����ϰ� ���������� ���ڸ����� �޸� �� ����ϰ� �����ٷ�
		System.out.printf("- - - - - - - - - - - - - - - - - - - - - \n");// ����ϰ� ���� �Ѿ��
		System.out.printf("�츮ī��\n");// ����ϰ� ���� �Ѿ��
		System.out.printf("%-35s\n", "ī���ȣ : 5387-20**-****-4613(S)  �Ͻú�");// 35ĭ �����ϰ� ���� �����ؼ� ���
		System.out.printf("�ŷ��Ͻ� : %s\n", k31_today.format(k31_day.getTime()));
		// ���� �ý��� �ð��� ���� �������� ���Ĵ�� ����ϰ� �����ٷ�
		System.out.printf("���ι�ȣ : 70404427\n");// ���ι�ȣ ����ϰ� ���� �Ѿ��
		System.out.printf("�ŷ���ȣ : 357734873739\n");// �ŷ���ȣ ����ϰ� ���� �Ѿ��
		System.out.printf("���� : ��ī���");// ���� ����ϱ�
		System.out.printf("%18s\n", "���� : 720068568");// 18ĭ�� �����ϰ� ��������ϰ� �����ٷ�
		System.out.printf("�˸� : EDC����ǥ\n");// �˸� ����ϰ� ���� �Ѿ��
		System.out.printf("���� : TEL)1544-4700\n");// ���� ����ϰ� ���� �Ѿ��
		System.out.printf("- - - - - - - - - - - - - - - - - - - - - \n");// ����ϰ� ���� �Ѿ��
		System.out.printf("          * �����մϴ� *            \n");// ����ϰ� ���� �Ѿ��
		System.out.printf("%39s\n", "ǥ��V2.08_20200212");// 39ĭ�� �����ϰ� ����ϱ�

	}

}