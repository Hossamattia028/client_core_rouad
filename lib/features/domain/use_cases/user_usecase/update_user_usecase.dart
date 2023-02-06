import 'package:dartz/dartz.dart';
import 'package:client_core/core/error/failure.dart';
import 'package:client_core/features/domain/repositories/user_service_repository.dart';

class UpdateUserServiceUseCase {
  final UserServiceRepository userServiceRepository;

  UpdateUserServiceUseCase({
    required this.userServiceRepository,
  });

  Future<Either<Failure, bool>> call(
      {required Map<String, dynamic> userData}) async {
    return await userServiceRepository.updateUserProfile(userData);
  }
}



