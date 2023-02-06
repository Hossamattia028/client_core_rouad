// ignore_for_file: camel_case_types, constant_identifier_names

import 'package:equatable/equatable.dart';

class Orders extends Equatable {
  int? orderId;
  final int userId;
  // final int couponId;
  final int addressId;
  final int kitchenId;
  final int? driverID;
  int? cartId;
  final String area;
  final String desc;
  final String type;
  final double price;
  final double discount;
  final String couponDiscount;
  final double deliveryPrice;
  final double productsPrice;
  final double totalPrice;
  final double deposit;
  final bool isDeposit;
  final String deliveryMethod;
  String paymentMethod;
  final String lat;
  final String lng;
  String status;
  String? date;

  // final String rejectedReason;

  Orders({
    this.orderId,
    required this.userId,
    required this.kitchenId,
    this.driverID,
    // required this.couponId,
    required this.addressId,
    required this.desc,
    required this.area,
    this.cartId,
    required this.status,
    required this.type,
    required this.price,
    required this.discount,
    required this.couponDiscount,
    required this.deliveryPrice,
    required this.productsPrice,
    required this.totalPrice,
    required this.deposit,
    required this.isDeposit,
    required this.deliveryMethod,
    required this.paymentMethod,
    required this.lat,
    required this.lng,
    this.date ,
    // required this.rejectedReason,
  });

  @override
  List<Object?> get props => [
        userId,
    kitchenId,
        addressId,
        cartId,
        status,
        type,
        price,
        totalPrice,
        discount,
        deliveryPrice,
        totalPrice,
        deposit,
        isDeposit,
        deliveryMethod,
        paymentMethod,
        lat,
        lng,
        // rejectedReason
      ];
}

enum ORDER_STATUS{
  PENDING,
  ONGOING,
  APPROVED,
  ORDER_FINISHED,
  COMPLETED,
  CANCELED
}
