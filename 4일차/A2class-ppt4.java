package daily0323;

public class A2class {

	int balance = 0;

	public A2class(int balance) {

		this.balance = balance;

	}

	public int deposit(int money) {
		this.balance = this.balance + money;
		return balance;
	}

	public int withdraw(int money) {
		this.balance = this.balance - money;
		return balance;

	}

	public int nowmoney(int money) {
		return balance;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

}
