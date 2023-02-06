
import 'package:client_core/features/domain/entities/order.dart';

class OrderModel extends Orders {
  OrderModel(
      {super.orderId,
      required super.userId,
      required super.kitchenId,
        super.driverID,
      required super.desc,
      required super.area,
      required super.addressId,
      super.cartId,
      required super.status,
      required super.type,
      required super.price,
      required super.discount,
      required super.couponDiscount,
      required super.deliveryPrice,
      required super.productsPrice,
      required super.totalPrice,
      required super.deposit,
      required super.isDeposit,
      required super.deliveryMethod,
      required super.paymentMethod,
      required super.lat,
      required super.lng,
        super.date,
      });

  static OrderModel fromJson(Map<String, dynamic> jsonObject) {
    return OrderModel(
      orderId: jsonObject['id'],
      userId: int.parse(jsonObject['user_id'].toString().replaceAll("null", "")==""?"0":jsonObject['user_id'].toString()),
      kitchenId: jsonObject['seller_id'],
      driverID: int.parse(jsonObject['driver_id'].toString()),
      desc: jsonObject['desc']??'',
      addressId: jsonObject['address']??0,
      area: jsonObject['area']??'',
      // cartId: jsonObject['cart_id']??'',
      status: jsonObject['delivery_status']??'',
      type: jsonObject['type']??'',
      couponDiscount: jsonObject['coupon_discount'].toString().replaceAll("null", ""),
      price: double.parse(jsonObject['price'].toString().replaceAll("null", "")==""?"0.0":jsonObject['price'].toString()),
      discount: double.parse(jsonObject['discount'].toString().replaceAll("null", "")==""?"0.0":jsonObject['discount'].toString()),
      deliveryPrice: double.parse(jsonObject['delivery_price'].toString().replaceAll("null", "")==""?"0.0":jsonObject['delivery_price'].toString()),
      productsPrice: jsonObject['products_price']!=null && jsonObject['products_price']!=""?double.parse(jsonObject['products_price']):0.0,
      totalPrice: double.parse(jsonObject['grand_total'].toString().replaceAll("null", "")==""?"0.0":jsonObject['grand_total'].toString()),
      deposit: jsonObject['deposit']??0.0,
      isDeposit: jsonObject['is_deposit']??false,
      deliveryMethod: jsonObject['delivery_method']??'cash',
      paymentMethod: jsonObject['payment_method']??'cash',
      lat: jsonObject['lat']??'',
      lng: jsonObject['lng']??'',
      date: jsonObject['created_at']??'',
    );
  }
  static getStatus(String val){
    if(val == "PENDING"){
      return ORDER_STATUS.PENDING;
    }else if(val == "ONGOING"){
      return ORDER_STATUS.ONGOING;
    }else if(val == "APPROVED"){
      return ORDER_STATUS.APPROVED;
    }else if(val == "ORDER_FINISHED"){
      return ORDER_STATUS.ORDER_FINISHED;
    }else if(val == "COMPLETED"){
      return ORDER_STATUS.COMPLETED;
    }else if(val == "CANCELED"){
      return ORDER_STATUS.CANCELED;
    }
  }
}
