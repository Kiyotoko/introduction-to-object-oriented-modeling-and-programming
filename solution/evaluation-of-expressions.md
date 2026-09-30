# Evaluation of Expressions

```java
jshell> 3 + (1 + 4) / 2 * 5
$1 ==> 13
```

We first evaluate the expressions inside the brackets, then we follow the order of operations. This means that we first evaluate multiplication and division, and then
addition and subtraction. If multiple operators have the same precedence, we evaluate them from left to right.

1 + 4 is 5. 5 divided by 2 with integer division is 2. 2 times 5 equals 10, and 3 plus 10 equals 13.

```java
jshell> 5 * (5 - 4 / 3)
$2 ==> 20
```

Same concept as before. We first evaluate the brackets and the integer division. 4 divided by 3 is 1, 5 minus 1 is 4. Therefore 5 times 4 equals 20.

```java
jshell> 0 / 0.0 == 0 / 0.0
$3 ==> false
```

This one is a bit tricky. Because we divide by an floating number, we also use floating point division. Dividing 0 by 0 is here nan (not a number). Because nan is never equal to anything, the result is still nan.

What exactly even is nan? nan is a value that we use to represent expressions that shouldn't have a value without needing to panic. Dividing by zero or computing the square root of a negative number returns for example nan.

```java
jshell> 1 / 0.0 == 1 / 0.0
$4 ==> true
```

Similar problem as above. The difference here is that 1 divided by 0 returns infinity. Additionally, infinity is equals infinity.

```java
jshell> (2 + 2 == 5) || (1 / 0 == 0)
|  Exception java.lang.ArithmeticException: / by zero
|        at (#6:1)
```

This and the latter one focus on lazy evaluation. Lazy evaluation means, that we don't need to evaluate both sides of an boolean expression. Hopefully obviously, 2 + 2 is 4 and not 5. Therefore the left side is false and we still need to evaluate the right side because we use or `||` here. The or operator returns true when at least one side is true. During evaluation of the right side a division by zero error is thrown, because we use integer division.

```java
jshell> !(2 + 2 < 5) && (1 / 0 == 0) ? "B" : "A"
$6 ==> "A"
```

2 + 2 is 4 and therefore lover than 5. The true expression is negated with `!` and becomes false. Because we use and `&&` here, the expression can only be false.

The ternary expression consists of the condition, followed by `?` for the true value and `:` for the false value. Because the expression is false here, we take the second value, which is A.
