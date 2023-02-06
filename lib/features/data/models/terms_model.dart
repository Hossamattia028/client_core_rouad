import 'package:client_core/features/domain/entities/terms.dart';

class TermsModel extends Terms {
  const TermsModel({required super.termsAr, required super.termsEn});

  static TermsModel fromJson(Map<String, dynamic> objectJson) {
    return TermsModel(
        termsAr: objectJson['terms_ar'], termsEn: objectJson['terms_en']);
  }
}
