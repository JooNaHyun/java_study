package ppt3;

import java.util.Scanner;

public class P15 {

	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);
		while (true) {
			String equation = scanner.nextLine();

			int operatorIndex = -1;
			if (equation.contains("+")) {
				operatorIndex = equation.indexOf("+");
			} else if (equation.contains("-")) {
				operatorIndex = equation.indexOf("-");
			} else if (equation.contains("*")) {
				operatorIndex = equation.indexOf("*");
			} else if (equation.contains("/")) {
				operatorIndex = equation.indexOf("/");
			} else {
				System.out.println("Invalid equation");
				return;
			}

			String operator = equation.substring(operatorIndex, operatorIndex + 1);
			String operand1 = equation.substring(0, operatorIndex);
			String operand2 = equation.substring(operatorIndex + 1);

			double result = 0.0;
			switch (operator) {
			case "+":
				result = Double.parseDouble(operand1) + Double.parseDouble(operand2);
				break;
			case "-":
				result = Double.parseDouble(operand1) - Double.parseDouble(operand2);
				break;
			case "*":
				result = Double.parseDouble(operand1) * Double.parseDouble(operand2);
				break;
			case "/":
				result = Double.parseDouble(operand1) / Double.parseDouble(operand2);
				break;
			}

			System.out.println(result);
		}
	}
}