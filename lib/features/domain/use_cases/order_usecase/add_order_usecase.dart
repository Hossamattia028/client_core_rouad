import 'package:dartz/dartz.dart';
import 'package:client_core/core/error/failure.dart';
import 'package:client_core/features/domain/entities/order.dart';
import 'package:client_core/features/domain/repositories/oder_repository.dart';

class AddOrderUseCase {
  final OrderRepository orderRepository;

  AddOrderUseCase(this.orderRepository);

  Future<Either<Failure, Unit>> call({required Orders order}) async {
    return await orderRepository.addOrder(order: order);
  }
}
