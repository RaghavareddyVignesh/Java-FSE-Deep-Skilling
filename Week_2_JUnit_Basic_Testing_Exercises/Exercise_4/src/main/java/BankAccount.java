public class BankAccount {
    private double balance;

    public BankAccount() {
        this.balance = 0.0;
    }

    public void deposit(double amount) {
        if (amount > 0)
            this.balance += amount;
    }

    public void withdraw(double amount) {
        if (amount > 0 && amount <= balance)
            this.balance -= amount;
    }

    public double getBalance() {
        return balance;
    }

    public void reset() {
        balance = 0.0;
    }
}
