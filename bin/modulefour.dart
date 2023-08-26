abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
    print('Deposited: $amount');
    print('New balance: $balance');
  }

  void withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (balance >= amount) {
      balance -= amount;
      balance += balance * interestRate;
      print('Withdrawn: $amount');
      print('New balance: $balance');
    } else {
      print('Insufficient funds for withdrawal.');
    }
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (balance + overdraftLimit >= amount) {
      balance -= amount;
      print('Withdrawn: $amount');
      print('New balance: $balance');
    } else {
      print('Insufficient funds for withdrawal.');
    }
  }
}

void main() {
  SavingsAccount savingsAccount = SavingsAccount(101, 1000, 0.05);
  savingsAccount.deposit(500);
  savingsAccount.withdraw(2000);
  savingsAccount.withdraw(300);

  CurrentAccount currentAccount = CurrentAccount(201, 2000, 1500);
  currentAccount.deposit(1000);
  currentAccount.withdraw(2500);
  currentAccount.withdraw(800);
}
