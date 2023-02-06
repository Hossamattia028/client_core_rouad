import 'package:dartz/dartz.dart';
import 'package:client_core/core/error/failure.dart';
import 'package:client_core/features/domain/entities/about_us.dart';
import 'package:client_core/features/domain/repositories/about_us_repository.dart';

class GetAboutUsUsecase {
  final AboutUsRepository aboutUsRepository;

  GetAboutUsUsecase(this.aboutUsRepository);

  Future<Either<Failure, List<AboutUs>>> call() async {
    return await aboutUsRepository.getAboutUsData();
  }
}
