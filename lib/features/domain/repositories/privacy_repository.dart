import 'package:dartz/dartz.dart';
import 'package:client_core/core/error/failure.dart';
import 'package:client_core/features/domain/entities/privacy.dart';

abstract class PrivacyRepository {
  Future<Either<Failure, List<Privacy>>> getPrivacyData();
}
