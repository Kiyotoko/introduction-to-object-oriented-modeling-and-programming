# Types and Variables

1. Which types have the following expressions?
  ```java
  jshell> 1 + 2
  $1 ==> 3 // int
  jshell> 1f + (byte) 2
  $2 ==> 3.0 // float
  jshell> 1f > (byte) 2
  $3 ==> false // boolean
  jshell> 1f + 2.0
  $4 ==> 3.0 // double
  jshell> '1' + 2
  $5 ==> 51 // int
  jshell> 1 + "2"
  $6 ==> "12" // String
  jshell> /vars // Displays all variables with type and value.
|    int $1 = 3
|    float $2 = 3.0
|    boolean $3 = false
|    double $4 = 3.0
|    int $5 = 51
|    String $6 = "12"
  ```

2. Write an expression that for a number $n$ returns the the square number $n^2$.
  ```java
  n * n
  ```
  Multiplying a number with itself is enough here.

3. Write an expression, that returns the string `"Even"` when the number $n$ is even, otherwise it should return `"Odd"`.
  ```java
  (n % 2 == 0) ? "Even" : "Odd"
  ```
  Variations of these are possible. For example, you could negate the condition and switch `"Even"` and `"Odd"`. It is also possible to use bit operations:

  ```java
  (n & 1 == 0) ? "Even" : "Odd"
  ```

  They won't be explained further because bit operations are not covered in the lecture.

4. Write an expression that computes the following function: $f(n)=...$
  ```java
  n % 2 == 0 ? n / 2 : 3 * n + 1
  ```
