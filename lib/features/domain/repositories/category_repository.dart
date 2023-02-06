import 'package:client_core/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:client_core/features/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getAllCategories();
}
