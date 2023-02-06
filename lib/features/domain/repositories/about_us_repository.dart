import 'package:client_core/core/error/failure.dart';
import 'package:client_core/features/domain/entities/about_us.dart';
import 'package:dartz/dartz.dart';

abstract class AboutUsRepository {
  Future<Either<Failure, List<AboutUs>>> getAboutUsData();
}
