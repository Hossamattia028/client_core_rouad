import 'package:dartz/dartz.dart';
import 'package:client_core/core/error/failure.dart';
import 'package:client_core/features/domain/entities/privacy.dart';
import 'package:client_core/features/domain/repositories/privacy_repository.dart';

class GetPrivacyUsecase {
  final PrivacyRepository privacyRepository;

  GetPrivacyUsecase(this.privacyRepository);

  Future<Either<Failure, List<Privacy>>> call() async {
    return await privacyRepository.getPrivacyData();
  }
}
