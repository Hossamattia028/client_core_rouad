import 'package:dartz/dartz.dart';
import 'package:client_core/core/error/failure.dart';
import 'package:client_core/features/domain/entities/user_entity.dart';
import 'package:client_core/features/domain/repositories/user_service_repository.dart';

class SocialUserServiceUseCase {
  final UserServiceRepository userServiceRepository;

  SocialUserServiceUseCase({
    required this.userServiceRepository,
  });

  // Future<Either<Failure, UserService>> call(
  //     {required bool isLogin,required bool isGmail}) async {
  //   return await userServiceRepository.socialSign(isLogin: isLogin,isGmail: isGmail);
  // }
}
