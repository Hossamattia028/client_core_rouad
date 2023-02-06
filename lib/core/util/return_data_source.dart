import 'package:client_core/core/error/exception.dart';
import 'package:client_core/core/error/failure.dart';
import 'package:client_core/core/network/network.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

typedef AddOrUpdateOrDeleteData = Future<Unit> Function();

class ReturnDataSource {
  //get return message while(right or left)
  static Future<Either<Failure, Unit>> getReturnMessage(
      {required AddOrUpdateOrDeleteData func,
      required NetworkInfo networkInfo}) async {
    if (await networkInfo.isConnected()) {
      try {
        await func();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  //check status code for response
  static Future<Unit> checkStatusCodeForDeleteUpdateData(
      {required http.Response response, required int statusCode}) {
    if (response.statusCode == statusCode) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
