import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:http/http.dart' as http;
import 'package:client_core/core/error/exception.dart';
import 'package:client_core/core/strings/api/api_url.dart';
import 'package:client_core/core/util/hive_boxes.dart';
import 'package:client_core/core/util/set_notification.dart';
import 'package:client_core/features/data/models/order_model.dart';

abstract class OrderRemoteDataSource {
  Future<List<OrderModel>> getAllOrder();
  Future<Unit> addOrder({required OrderModel orderModel});
  Future<Unit> deleteOrder({required int orderId});
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final http.Client client;
  OrderRemoteDataSourceImpl({required this.client});
  @override
  Future<List<OrderModel>> getAllOrder() async {
    var response = await client.get(Uri.parse("${ApiUrl.ALL_ORDERS_URL}${HiveBoxes.getUserId()}"), headers: ApiUrl.headerAuth);
    // debugPrint("order: ${response.body}");
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      List<OrderModel> orders = body['data'].map<OrderModel>((orderModel) {
        return OrderModel.fromJson(orderModel);
      }).toList();
      return orders;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addOrder({required OrderModel orderModel}) async {
    final body = {
      'user_id': orderModel.userId,
      'seller_id': orderModel.kitchenId,
      'shipping_address': orderModel.area,
      'city': orderModel.addressId,
      'type': orderModel.type,
      'price': orderModel.price,
      'coupon_discount': orderModel.couponDiscount,
      'delivery_price': orderModel.deliveryPrice,
      'products_price': orderModel.productsPrice,
      'grand_total': orderModel.price,
      'desc':orderModel.desc.length>200?orderModel.desc.substring(0,190): orderModel.desc.toString(),
      'payment_status': 'paid',
      'delivery_method': "cash",
      'delivery_status': orderModel.status,
      'payment_type': 'cash',
      'lat': orderModel.lat,
      'lng': orderModel.lng,
    };
    debugPrint(body.toString());
    final response = await client.post(Uri.parse(ApiUrl.SEND_ORDER_URL),
        body: json.encode(body),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${HiveBoxes.getUserToken()}',
        });
     debugPrint("addOrder: ${response.body}");
    if (response.body.contains("successfully")) {
      SetNotification.showNotification(title: "", msg: translate("toast.market_order_send"));
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteOrder({required int orderId}) async {
    final response = await client.delete(
        Uri.parse('${ApiUrl.CANCEL_ORDER_URL}/${orderId.toString()}/delete'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${HiveBoxes.getUserToken()}',
        });
    return _checkStatusCodeForDeleteUpdatePosts(response);
  }

  Future<Unit> _checkStatusCodeForDeleteUpdatePosts(http.Response response) {
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
