# State and Statements

1. Factorial:
  ```java
  public class Main {
    public static void main(String[] args) {
      int n = 5;
      int factorial = 1;

      for (int i = 1; i <= n; i++) {
          factorial = factorial * i;
      }

      System.out.println(factorial);
    }
  }
  ```

2. Stars:
  ```java
  public class Main {
    public static void main(String[] args) {
      int n = 4;

      // Going up
      for (int i = 1; i <= n; i++) {
        // Spaces
        for (int j = 1; j <= n - i; j++) {
          System.out.print(" ");
        }
        // Stars
        for (int j = 1; j <= i; j++) {
          System.out.print("* ");
        }
        // Continue on next line
        System.out.println();
      }

      // Going down
      for (int i = n - 1; i >= 1; i--) {
        // Spaces
        for (int j = 1; j <= n - i; j++) {
          System.out.print(" ");
        }
        // Stars
        for (int j = 1; j <= i; j++) {
          System.out.print("* ");
        }
        // Continue on next line
        System.out.println();
      }
    }
  }
  ```

3. Pascal's triangle:
  ```java
  public class Main {
    public static void main(String[] args) {
      int n = 5;
      for (int row = 0; row <= n; row++) {
        // Spaces
        for (int j = 0; j < n - row; j++) {
          System.out.print(" ");
        }

        int number = 1;
        for (int j = 0; j <= row; j++) {
          System.out.print(number + " ");
          // Compute next number
          // https://en.wikipedia.org/wiki/Pascal's_triangle#Rows
          number = number * (row - j) / (j + 1);
        }
        // New line
        System.out.println();
      }
    }
  }
  ```