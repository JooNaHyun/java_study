package ppt6;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;

public class P8 {

	public static void main(String[] args) {

		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		while (true) {
			try {
				int count = Integer.parseInt(scanner.nextLine());
				int[] array = new int[count];
//				int num = scanner.nextInt();// 공백이 들었어
//				scanner.nextLine();// 배열에 담으면 공백이 담겨

				List<Integer> list = new ArrayList<>();
				String[] input = scanner.nextLine().split(" ");
				for (String str : input) {
					list.add(Integer.parseInt(str));

				}
				if (list.size() == count) {
					Collections.sort(list);
					System.out.println(list);
				} else {
					throw new Exception();
				}

			} catch (Exception e) {
				System.out.println("error");

			}

		}
		
		

	}

}
