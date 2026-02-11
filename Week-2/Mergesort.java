import java.util.ArrayList;
import java.util.List;

public class Mergesort {

  static int[] A = {8, 6, 0, 7, 5, 3, 1};

  public static void main(String[] args) {
    System.out.print("Original: ");
    printArray(A);

    int[] sorted = sortmerge(A);

    System.out.print("Sorted:   ");
    printArray(sorted);
  }

  static int[] sortmerge(int[] b) {
    // base case
    if (b.length <= 1) {
      return b;
    }

    int c = b.length / 2;

    int[] b1 = new int[c];
    int[] b2 = new int[b.length - c];

    for (int i = 0; i < c; i++) {
      b1[i] = b[i];
    }

    for (int i = c; i < b.length; i++) {
      b2[i - c] = b[i];
    }

    int[] sorted1 = sortmerge(b1);
    int[] sorted2 = sortmerge(b2);

    return merge(sorted1, sorted2);
  }

  static int[] merge(int[] left, int[] right) {
    List<Integer> result = new ArrayList<>();

    int i = 0;
    int j = 0;

    while (i < left.length && j < right.length) {
      if (left[i] < right[j]) {
        result.add(left[i]);
        i++;
      } else {
        result.add(right[j]);
        j++;
      }
    }

    while (i < left.length) {
      result.add(left[i]);
      i++;
    }

    while (j < right.length) {
      result.add(right[j]);
      j++;
    }

    // convert List<Integer> → int[]
    int[] out = new int[result.size()];
    for (int k = 0; k < result.size(); k++) {
      out[k] = result.get(k);
    }
    return out;
  }

  static void printArray(int[] arr) {
    System.out.print("[");
    for (int i = 0; i < arr.length; i++) {
      System.out.print(arr[i]);
      if (i < arr.length - 1) {
        System.out.print(", ");
      }
    }
    System.out.println("]");
  }
}
