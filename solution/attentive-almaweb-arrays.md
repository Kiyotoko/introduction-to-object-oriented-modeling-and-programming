# Attentive Almaweb Arrays

```java
public class Grades {
  static double best(double[] grades) {
    double best = grades[0];
    // Go through every element. If it is better then
    // the current best value, set it to the new best.
    for (int i = 1; i < grades.length; i++) {
      if (grades[i] < best) {
        best = grades[i];
      }
    }
    return best;
  }

  static double worst(double[] grades) {
    // Same like best, but with another comparator
    double worst = grades[0];
    for (int i = 1; i < grades.length; i++) {
      if (grades[i] > worst) {
        worst = grades[i];
      }
    }
    return worst;
  }

  static double average(double[] grades) {
    // First add all values
    double sum = 0;
    for (int i = 0; i < grades.length; i++) {
      sum += grades[i];
    }
    // Then divide by the count (length)
    return sum / grades.length;
  }

  static double[] sorted(double[] grades) {
    // Copy value to result
    // It's also ok to directly write to the old array
    double[] result = new double[grades.length];
    for (int i = 0; i < grades.length; i++) {
      result[i] = grades[i];
    }

    // Selection Sort, you can use any sorting algorithm
    for (int i = 0; i < result.length - 1; i++) {
      int smallest = i;

      for (int j = i + 1; j < result.length; j++) {
        if (result[j] < result[smallest]) {
          smallest = j;
        }
      }

      // Move smallest element to the correct location
      double temp = result[i];
      result[i] = result[smallest];
      result[smallest] = temp;
    }
    return result;
  }

  static String toString(double[] grades) {
    String result = "";
    for (int i = 0; i < grades.length; i++) {
      // The first element has no preceding comma
      if (i > 0) {
        result += ", ";
      }
      result += grades[i];
    }
    return result;
  }

  static String stats(double[] grades) {
    double[] sortedGrades = sorted(grades);
    String result = "";
    int count = 1;
    for (int i = 1; i < sortedGrades.length; i++) {
      if (sortedGrades[i] == sortedGrades[i - 1]) {
        count++;
      } else {
        if (!result.isEmpty()) {
          result += ", ";
        }
        result += count + "x " + sortedGrades[i - 1];
        count = 1;
      }
    }

    if (!result.isEmpty()) {
      result += ", ";
    }
    result += count + "x " + sortedGrades[sortedGrades.length - 1];
    return result;
  }

  public static void main(String[] args) {
    double[] grades = {
      1.3, 2.3, 4.0, 3.3, 1.7, 2.3, 1.3, 1.7, 2.3
    };

    System.out.println(average(grades)); // 2.244...
    System.out.println(best(grades));    // 1.3
    System.out.println(worst(grades));   // 4.0

    System.out.println(toString(sorted(grades)));
    // 1.3, 1.3, 1.7, 1.7, 2.3, 2.3, 2.3, 3.3, 4.0

    System.out.println(stats(grades));
    // 2x 1.3, 2x 1.7, 3x 2.3, 1x 3.3, 1x 4.0
  }
}
```
