
import 'package:client_core/features/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:client_core/core/error/failure.dart';
import 'package:client_core/features/domain/repositories/user_service_repository.dart';

class RegisterUserServiceUseCase {
  final UserServiceRepository userServiceRepository;

  RegisterUserServiceUseCase({
    required this.userServiceRepository,
  });

  Future<Either<Failure, UserService>> call({required Map<String, dynamic> userData}) async {
    return await userServiceRepository.registerUser(userData);
  }
}



