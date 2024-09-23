# Formulas

## Basic Exponents and Logarithms

$2^5 = 32$

$\log_2(32) = 5$

## Summation Formulas

### Arithmetic Series: $\sum_{i=1}^n i = \frac{n(n+1)}{2}$

This formula calculates the sum of consecutive integers from 1 to n.

Examples:

1. Sum of integers from 1 to 5:
   $\sum_{i=1}^5 i = \frac{5(5+1)}{2} = \frac{5(6)}{2} = 15$  
   Verification: 1 + 2 + 3 + 4 + 5 = 15

2. Sum of integers from 1 to 10:
   $\sum_{i=1}^{10} i = \frac{10(10+1)}{2} = \frac{10(11)}{2} = 55$  
   Verification: 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 = 55

### Geometric Series: $\sum_{i=0}^n b^i = \frac{b^{n+1}-1}{b-1}$

This formula calculates the sum of a geometric sequence with first term 1 and
common ratio b.

Examples:

1. Sum of powers of 2 from $2^0$ to $2^4$:
   $\sum_{i=0}^4 2^i = \frac{2^{4+1}-1}{2-1} = \frac{2^5-1}{1} = 31$  
   Verification: 1 + 2 + 4 + 8 + 16 = 31

2. Sum of powers of 3 from $3^0$ to $3^3$:
   $\sum_{i=0}^3 3^i = \frac{3^{3+1}-1}{3-1} = \frac{3^4-1}{2} = \frac{81-1}{2} = 40$  
   Verification: 1 + 3 + 9 + 27 = 40

## Fibonacci Relation

$F(n)^2 = F(n) \cdot F(n+1)$

## Linear Growth Equations

General form: $y = cx + b$

Where:

- $c$ is the slope (constant)
- $b$ is the y-intercept

To find the slope using two points $(x_1, y_1)$ and $(x_0, y_0)$:

$c = \frac{y_1 - y_0}{x_1 - x_0}$

Example: $c = \frac{10 - 0}{2 - 0}$

## Exponential Growth Equations (not to be confused with power-law)

General form: $y = b \cdot r^x$

Where:

- $b$ is the initial value
- $r$ is the growth rate (where $r > 1$ for increase, $0 < r < 1$ for decrease)

Example: $y = 4(1.05)^x$

Verifying points:

- When $x = 0$: $y = 4(1.05)^0 = 4$
- When $x = 14$: $y = 4(1.05)^{14} \approx 7.92$
