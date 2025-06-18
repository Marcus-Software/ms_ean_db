import 'dart:convert';

import 'package:ms_ean_db/data/account.dart';

class AccountDto extends Account {
  AccountDto({required super.primaryEmail, required super.balance});

  factory AccountDto.fromMap(Map<String, dynamic> map) {
    return AccountDto(
      primaryEmail: map['primaryEmail'] as String,
      balance: map['balance'] as int,
    );
  }

  factory AccountDto.fromJson(String json) {
    final map = Map<String, dynamic>.from(jsonDecode(json));
    return AccountDto.fromMap(map);
  }

  Account toAccount() {
    return Account(primaryEmail: primaryEmail, balance: balance);
  }
}
