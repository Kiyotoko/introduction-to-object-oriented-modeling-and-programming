# Class Chaos

1. Student:
  ```java
  public class Student {
    private String name;
    private long campusCard;

    public Student(String name, long campusCard) {
      this.name = name;
      this.campusCard = campusCard;
    }

    public String getName() {
      return name;
    }

    public long getCampusCard() {
      return campusCard;
    }

    public static void main(String[] args) {
      Student alice = new Student("Alice", 3727001);
      System.out.println(alice.getName()); // Alice
      System.out.println(alice.getCampusCard()); // 3727001
    }
  }
  ```

2. Bank Account:
  ```java
  public class BankAccount {
    private float balance;

    public BankAccount(float balance) {
      this.balance = balance;
    }

    public void transfer(BankAccount target, float amount) {
      if (balance >= amount) {
        balance -= amount;
        target.balance += amount;
      }
    }

    @Override
    public String toString() {
      return String.valueOf(balance);
    }

    public static void main(String[] args) {
      BankAccount a = new BankAccount(100);
      BankAccount b = new BankAccount(0);
      a.transfer(b, 200);
      System.out.println(a); // 100, nichts wurde überwiesen
      a.transfer(b, 60);
      System.out.println(a); // 40
      System.out.println(b); // 60
    }
  }
  ```
