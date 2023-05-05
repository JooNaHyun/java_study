package ppt6;

import java.util.Scanner;
import java.util.Stack;

public class A2 {

	public static void main(String[] args) {
		Stack<Integer> stack = new Stack<>();
		Scanner scanner = new Scanner(System.in);
		while (true) {
			try {
				System.out.print("숫자를 입력하세요 : ");
				String[] input = scanner.nextLine().split(" ");
				for (String str : input) {
					stack.add(Integer.parseInt(str));
				}

				System.out.print("스택에서 찾을 숫자를 입력하세요: ");
				int target = scanner.nextInt();

				int index = 0;
				int outputIndex = 0;
				while (!stack.isEmpty()) {
					int num = stack.pop();
					index++;
					if (num == target) {
						outputIndex = index;
						break;
					}
				}

				if (outputIndex != 0) {
					System.out.println(outputIndex);
					break;
				} else {
					System.out.println(target + "는 스택에 없습니다.");

				}
			} catch (Exception e) {
				System.out.println("다시 입력하세요.");
			}
		}
	}

}
