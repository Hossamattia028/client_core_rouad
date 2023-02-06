import 'package:dartz/dartz.dart';
import 'package:client_core/core/error/failure.dart';
import 'package:client_core/features/domain/entities/terms.dart';

abstract class TermsRepository {
  Future<Either<Failure, List<Terms>>> getTermsData();
}
