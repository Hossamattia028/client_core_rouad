import 'package:dartz/dartz.dart';
import 'package:client_core/core/error/failure.dart';
import 'package:client_core/features/domain/entities/terms.dart';
import 'package:client_core/features/domain/repositories/terms_repository.dart';

class GetTermsUseCase {
  final TermsRepository termsRepository;

  GetTermsUseCase(this.termsRepository);

  Future<Either<Failure, List<Terms>>> call() async {
    return await termsRepository.getTermsData();
  }
}
