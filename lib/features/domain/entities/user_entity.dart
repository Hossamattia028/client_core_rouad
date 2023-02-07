import 'package:equatable/equatable.dart';

class UserService extends Equatable {
  final int userId;
  final String userName;
  final String phoneNumber;
  final String email;
  final String area;
  final String address;
  final String countryCode;
  final bool? status;

  /// if false then user is offline
  final bool? isApproved;

  /// if false then user is disApproved
  final BankAccountDetails? bankAccountDetails;

  const UserService({
    required this.userId,
    required this.userName,
    required this.phoneNumber,
    required this.email,
    required this.area,
    required this.address,
    required this.countryCode,
    this.bankAccountDetails,
    this.status,
    this.isApproved,
  });

  @override
  List<Object?> get props =>
      [userId, userName, email, area, address, countryCode];
}

class BankAccountDetails {
  final String? bankAccountNo;
  final String? bankAccountName;
  final String? bankName;
  final String? bankIban;

  const BankAccountDetails(
      {required this.bankAccountNo,
      required this.bankAccountName,
      required this.bankName,
      required this.bankIban});

  static BankAccountDetails fromJson(Map<String, dynamic> jsonObject) {
    return BankAccountDetails(
      bankAccountNo: jsonObject['bank_account_no'] ?? '',
      bankAccountName: jsonObject['bank_account_name'] ?? '',
      bankName: jsonObject['bank_name'] ?? '',
      bankIban: jsonObject['bank_iban'] ?? '',
    );
  }
}
