import 'package:dartz/dartz.dart';
import 'package:client_core/core/error/failure.dart';
import 'package:client_core/features/domain/repositories/user_service_repository.dart';

class LogoutUserServiceUseCase {
  final UserServiceRepository userServiceRepository;

  LogoutUserServiceUseCase({
    required this.userServiceRepository,
  });

  Future<Either<Failure, Unit>> call({required String accessToken}) async {
    return await userServiceRepository.logoutUser(accessToken);
  }
}
