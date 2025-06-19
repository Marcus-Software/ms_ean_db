class Account {
  Account({required this.primaryEmail, required this.balance});

  String primaryEmail;
  int balance;

  @override
  String toString() {
    return 'Account(primaryEmail: $primaryEmail, balance: $balance)';
  }

  Map<String, dynamic> toMap() {
    return {
      'primaryEmail': primaryEmail,
      'balance': balance,
    };
  }
}
