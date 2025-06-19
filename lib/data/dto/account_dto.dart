import 'dart:convert';

import 'package:ms_ean_db/data/account.dart';

/// Data Transfer Object for [Account].
///
/// Extends [Account] and adds serialization/deserialization functionality.
class AccountDto extends Account {
  /// Creates a new AccountDto instance.
  ///
  /// [primaryEmail] is the user's primary email address.
  /// [balance] is the current account balance.
  AccountDto({required super.primaryEmail, required super.balance});

  /// Creates an AccountDto from a map.
  ///
  /// [map] is a map containing the account data with keys 'primaryEmail' and 'balance'.
  ///
  /// Returns a new AccountDto instance.
  factory AccountDto.fromMap(Map<String, dynamic> map) {
    return AccountDto(
      primaryEmail: map['primaryEmail'] as String,
      balance: map['balance'] as int,
    );
  }

  /// Creates an AccountDto from a JSON string.
  ///
  /// [json] is a JSON string containing the account data.
  ///
  /// Returns a new AccountDto instance.
  factory AccountDto.fromJson(String json) {
    final map = Map<String, dynamic>.from(jsonDecode(json));
    return AccountDto.fromMap(map);
  }

  /// Converts this AccountDto to an Account.
  ///
  /// Returns a new Account instance with the same data.
  Account toAccount() {
    return Account(primaryEmail: primaryEmail, balance: balance);
  }
}
