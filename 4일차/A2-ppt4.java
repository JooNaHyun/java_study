package daily0323;

import java.util.Scanner;

public class A2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		A2class a2class = new A2class(0);
		Scanner scanner = new Scanner(System.in);
		int money = 0;
		boolean play = true;
		while (play) {
			System.out.println("#Menu");
			System.out.println("1.Deposit");
			System.out.println("2.withdrawal");
			System.out.println("Balance :" + a2class.getBalance());
			int menu = scanner.nextInt();

			switch (menu) {
			case 1:
				money = scanner.nextInt();
				a2class.deposit(money);
				a2class.nowmoney(money);
				break;
			case 2:
				money = scanner.nextInt();
				a2class.withdraw(money);
				a2class.nowmoney(money);
				break;
			case 3:
				break;

			}

		}

	}
}
