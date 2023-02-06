import 'package:client_core/core/error/exception.dart';
import 'package:client_core/core/network/network.dart';
import 'package:client_core/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:client_core/core/util/return_data_source.dart';
import 'package:client_core/features/data/data_sources/order_remote_data_source.dart';
import 'package:client_core/features/data/models/order_model.dart';
import 'package:client_core/features/domain/repositories/oder_repository.dart';
import 'package:client_core/features/domain/entities/order.dart';

class OrderModelRepository implements OrderRepository {
  final OrderRemoteDataSourceImpl orderRemoteDataSource;
  final NetworkInfo networkInfo;
  OrderModelRepository(this.orderRemoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, List<Orders>>> getAllOrders() async {
    if (await networkInfo.isConnected()) {
      try {
        return Right(await orderRemoteDataSource.getAllOrder());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addOrder({required Orders order}) {
    return ReturnDataSource.getReturnMessage(
        func: () => orderRemoteDataSource.addOrder(
            orderModel: OrderModel(
                userId: order.userId,
                kitchenId: order.kitchenId,
                desc: order.desc,
                addressId: order.addressId,
                cartId: order.cartId,
                status: order.status,
                area: order.area,
                type: order.type,
                couponDiscount: order.couponDiscount,
                price: order.price,
                discount: order.discount,
                deliveryPrice: order.deliveryPrice,
                productsPrice: order.productsPrice,
                totalPrice: order.totalPrice,
                deposit: order.deposit,
                isDeposit: order.isDeposit,
                deliveryMethod: order.deliveryMethod,
                paymentMethod: order.paymentMethod,
                lat: order.lat,
                lng: order.lng
            )),
        networkInfo: networkInfo);
  }

  @override
  Future<Either<Failure, Unit>> deleteOrder({required int orderId}) async {
    return await ReturnDataSource.getReturnMessage(
        func: () => orderRemoteDataSource.deleteOrder(orderId: orderId),
        networkInfo: networkInfo);
  }
}
