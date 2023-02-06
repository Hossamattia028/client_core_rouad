import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:client_core/core/error/failure.dart';
import 'package:client_core/features/domain/entities/user_entity.dart';

abstract class UserServiceRepository {
  Future<Either<Failure, UserService>> getUserData();
  Future<Either<Failure, UserService>> registerUser(Map<String, dynamic> userData);
  Future<Either<Failure, UserService>> loginUser(String email, String password);
  // Future<Either<Failure, UserService>> socialSign({required bool isLogin,required bool isGmail});
  Future<Either<Failure, Unit>> logoutUser(String accessToken);
  Future<Either<Failure, bool>> updateUserProfile(Map<String, dynamic> userData);
}
