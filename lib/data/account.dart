/// Represents a user account in the EAN-DB system.
///
/// Contains information about the user's primary email and account balance.
class Account {
  /// Creates a new Account instance.
  ///
  /// [primaryEmail] is the user's primary email address.
  /// [balance] is the current account balance.
  Account({required this.primaryEmail, required this.balance});

  /// The user's primary email address.
  String primaryEmail;

  /// The current account balance.
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
