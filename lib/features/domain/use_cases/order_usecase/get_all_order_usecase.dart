import 'package:dartz/dartz.dart';
import 'package:client_core/core/error/failure.dart';
import 'package:client_core/features/domain/entities/order.dart';
import 'package:client_core/features/domain/repositories/oder_repository.dart';

class GetAllOrderUseCase {
  final OrderRepository orderRepository;

  GetAllOrderUseCase(this.orderRepository);

  Future<Either<Failure, List<Orders>>> call() async {
    return await orderRepository.getAllOrders();
  }
}
