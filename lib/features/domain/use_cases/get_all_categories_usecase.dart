import 'package:dartz/dartz.dart';
import 'package:client_core/core/error/failure.dart';
import 'package:client_core/features/domain/entities/category.dart';
import 'package:client_core/features/domain/repositories/category_repository.dart';

class GetAllCategoryUseCase {
  final CategoryRepository categoryRepository;

  GetAllCategoryUseCase(this.categoryRepository);

  Future<Either<Failure, List<Category>>> call() async {
    return await categoryRepository.getAllCategories();
  }
}
