import 'package:client_core/core/error/exception.dart';
import 'package:client_core/core/network/network.dart';
import 'package:client_core/features/data/data_sources/category_remote_data_source.dart';
import 'package:client_core/features/domain/entities/category.dart';
import 'package:client_core/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:client_core/features/domain/repositories/category_repository.dart';

class CategoryModelRepository implements CategoryRepository {
  final CategoryRemoteDataSourceImpl categoryRemoteDataSource;
  final NetworkInfo networkInfo;
  CategoryModelRepository(
      {required this.categoryRemoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, List<Category>>> getAllCategories() async {
    if (await networkInfo.isConnected()) {
      try {
        return Right(await categoryRemoteDataSource.getAllCategory());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
