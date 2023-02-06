import 'package:dartz/dartz.dart';
import 'package:client_core/core/error/failure.dart';
import 'package:client_core/features/domain/repositories/oder_repository.dart';

class DeleteOrderUseCase {
  final OrderRepository orderRepository;

  DeleteOrderUseCase(this.orderRepository);

  // Future<Either<Failure, Unit>> call({required int orderId}) async {
  //   // return await orderRepository.deleteOrder(orderId: orderId);
  // }
}
