package ppt4;

import java.util.Scanner;

public class A1 {
   static int N;
   static int M;
   static int[] arr;

   public static void main(String[] args) {
      // TODO Auto-generated method stub
      Scanner sc = new Scanner(System.in);
      N = sc.nextInt();//주사위갯수 2
      M = sc.nextInt();//구하고 싶은 합 4

      arr = new int[N];

      dice(0, 0);

   }

   public static void dice(int level, int sum) {
      if (level < N) {
         for (int i = 1; i <= 6; i++) {
            arr[level] = i;
            dice(level + 1, sum + i);
         }
      } else {
         if (sum == M) {
            for (int j = 0; j < N; j++) {
               System.out.print(arr[j] + " ");
            }
            System.out.println("");
         }
      }
   }

}