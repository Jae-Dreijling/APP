import java.util.*;

public class fib {
    public static int fib(int n) {
        if (n <= 1) return n;
        return fib(n - 1) + fib(n - 2);
    }

    public static void main(String[] args) {
        int n = 8;
        int result = fib(n);
        System.out.println("Fibonacci of " + n + " is " + result);
    }
}
