import java.util.*;

public class fib {
    // Static HashMap to store previously calculated Fibonacci values (key: n, value: fib(n))
    static Map<Integer, Integer> memo = new HashMap<>();
    
    public static int fib(int n) {
        if (n <= 1) return n;
        // Check if we've already calculated fib(n) and stored it in memo
        if (memo.containsKey(n)) {
            // If yes, retrieve and return the cached value instead of recalculating
            return memo.get(n);
        }
        // If not cached, recursively calculate fib(n-1) + fib(n-2)
        int result = fib(n - 1) + fib(n - 2);
        // Store the calculated result in the memo HashMap for future use
        memo.put(n, result);
        return result;
        // Space complexity: O(n) due to the memoization storage

    }

    public static void main(String[] args) {
        int n = 30;
        int result = fib(n);
        System.out.println("Fibonacci of " + n + " is " + result);
        System.out.println("Memoization Map: " + memo);
    }
}
