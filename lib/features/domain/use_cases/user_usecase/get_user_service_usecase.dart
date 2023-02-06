import 'package:dartz/dartz.dart';
import 'package:client_core/core/error/failure.dart';
import 'package:client_core/features/domain/entities/user_entity.dart';
import 'package:client_core/features/domain/repositories/user_service_repository.dart';

class GetUserServiceUseCase {
  final UserServiceRepository userServiceRepository;

  GetUserServiceUseCase({
    required this.userServiceRepository,
  });

  Future<Either<Failure, UserService>> call() async {
    return await userServiceRepository.getUserData();
  }
}
