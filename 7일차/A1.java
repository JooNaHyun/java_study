package ppt6;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

public class A1 {

	public static void main(String[] args) {
		Queue<Integer> queue = new LinkedList<>();
		Scanner scanner = new Scanner(System.in);
		while (true) {
			try {
				System.out.print("숫자를 입력하세요 : ");
				String[] input = scanner.nextLine().split(" ");
				for (String str : input) {
					queue.add(Integer.parseInt(str));
				}

				System.out.print("큐에서 찾을 숫자를 입력하세요: ");
				int target = scanner.nextInt();

				int index = 0;
				int outputIndex = 0;
				while (!queue.isEmpty()) {
					int num = queue.poll();
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
					System.out.println(target + "는 큐에 없습니다.");

				}
			} catch (Exception e) {
				System.out.println("다시 입력하세요.");
			}
		}
	}

}
