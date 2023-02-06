import 'dart:io';

import 'package:client_core/core/error/exception.dart';
import 'package:client_core/core/network/network.dart';
import 'package:client_core/core/util/return_data_source.dart';
import 'package:client_core/features/data/data_sources/user_service_remote_data_source.dart';
import 'package:client_core/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:client_core/features/data/models/user_service_model.dart';
import 'package:client_core/features/domain/entities/user_entity.dart';
import 'package:client_core/features/domain/repositories/user_service_repository.dart';

class UserServiceModelRepository implements UserServiceRepository {
  final UserServiceRemoteDataSource userServiceRemoteDataSource;
  final NetworkInfo networkInfo;
  UserServiceModelRepository({required this.userServiceRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, UserService>> getUserData() async {
    if (await networkInfo.isConnected()) {
      try {
        return Right(await userServiceRemoteDataSource.getUserData());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, UserServiceModel>> loginUser(
      String email, String password) async {
    if (await networkInfo.isConnected()) {
      try {
        return Right(await userServiceRemoteDataSource.loginUser(
            email: email, password: password));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> logoutUser(String accessToken) {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserServiceModel>> registerUser(
      Map<String, dynamic> userData,{File? storeBanner,File? storeLicense}) async {
    return Right(await userServiceRemoteDataSource.registerUser(userData,storeLicense: storeLicense,storeBanner: storeBanner));
  }

  @override
  Future<Either<Failure, bool>> updateUserProfile(
      Map<String, dynamic> userData) async {
    if (await networkInfo.isConnected()) {
      try {
        return Right(await userServiceRemoteDataSource.updateUserProfile(
            userData: userData));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  // @override
  // Future<Either<Failure, UserService>> socialSign({required bool isLogin,required bool isGmail}) async{
  //   if (await networkInfo.isConnected()) {
  //     try {
  //       return Right(await userServiceRemoteDataSource.socialSigning(isLogin: isLogin, isGmail: isGmail));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //     }
  //   } else {
  //   return Left(OfflineFailure());
  //   }
  // }
}
