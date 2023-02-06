import 'package:dartz/dartz.dart';
import 'package:client_core/core/error/failure.dart';
import 'package:client_core/features/domain/entities/user_entity.dart';
import 'package:client_core/features/domain/repositories/user_service_repository.dart';

class LoginUserServiceUseCase {
  final UserServiceRepository userServiceRepository;

  LoginUserServiceUseCase({
    required this.userServiceRepository,
  });

  Future<Either<Failure, UserService>> call(
      {required String email, required String password}) async {
    return await userServiceRepository.loginUser(email, password);
  }
}
