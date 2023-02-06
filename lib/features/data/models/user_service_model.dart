import 'package:client_core/features/domain/entities/user_entity.dart';

class UserServiceModel extends UserService {
  const UserServiceModel({
    required super.userId,
    required super.userName,
    required super.email,
    required super.phoneNumber,
    required super.area,
    required super.address,
    required super.status,
    required super.countryCode,
    required super.bankAccountDetails,
    required super.isApproved,
  });

  static UserServiceModel fromJson(Map<String, dynamic> fromJson) {
    return UserServiceModel(
      userId: fromJson['id'],
      userName: fromJson['name'],
      email: fromJson['email'],
      phoneNumber: fromJson['phone'] ?? '',
      countryCode: fromJson['country_code'] ?? '',
      area: fromJson['city'] ?? '',
      address: fromJson['address'] ?? '',
      status: fromJson['status'].toString().trim() == "offline" ? false : true,
      isApproved: fromJson['is_approved'].toString().trim() == "false" ? false : true,
      bankAccountDetails: BankAccountDetails.fromJson(
          fromJson['bank_details'] ??
              {
                'bank_account_no': '',
                'bank_account_name': '',
                'bank_name': '',
                'bank_iban': ''
              }),
    );
  }
}
