import 'package:client_core/core/error/failure.dart';
import 'package:client_core/features/domain/entities/order.dart';
import 'package:dartz/dartz.dart';


abstract class OrderRepository {
  Future<Either<Failure, List<Orders>>> getAllOrders();
  Future<Either<Failure, Unit>> addOrder({required Orders order});
}
