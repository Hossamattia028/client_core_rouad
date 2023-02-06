// ignore_for_file: constant_identifier_names


import 'package:client_core/core/util/hive_boxes.dart';

class ApiUrl {
  static Map<String,String> headerAuth =  {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${HiveBoxes.getUserToken()}',
  };
  // static const String BASE_URL = 'http://10.0.2.2:8000/api/v1/';
  // static const String STORAGE_URL = 'http://10.0.2.2:8000/';
  static const String BASE_URL = 'https://youcooksa.com/youcook/api/v1/';
  static const String STORAGE_URL = 'https://youcooksa.com/youcook/public/';

  //auth
  static const String REGISTER_URL = '${BASE_URL}auth/signup';
  static const String LOGIN_URL = '${BASE_URL}auth/login';
  static const String SOCIAL_LOGIN_URL = '${BASE_URL}auth/social-login';
  //user data
  static const String USER_PROFILE_DATA = '${BASE_URL}user/info/'; //user/info/{userID}
  static const String UPDATE_USER_PROFILE = '${BASE_URL}user/update/'; //user/update/{userID}
  static const String UPDATE_STATUS = '${BASE_URL}user/update/status/'; //user/update/status/{status}/{userID}

  //images
  static const String UPDATE_IMG= '${BASE_URL}user/update/img/'; //user/update/status/{userID}
  static const String UPDATE_SINGLE_IMG= '${BASE_URL}update/img/'; //update/img/{userID}

  static const String PRODUCTS_URL = '${BASE_URL}products';
  static const String OFFERS_URL = '${BASE_URL}products/featured';
  static const String SLIDERS_URL = '${BASE_URL}banners/';
  static const String CITIES_URL = '${BASE_URL}cities/';
  static const String ALL_VENDORS_URL = '${BASE_URL}shops';
  static const String CATEGORIES_URL = '${BASE_URL}categories/featured/';

  //cart
  static const String CART_URL = '${BASE_URL}carts/'; // carts/{user_id}
  static const String ADD_CART = '${BASE_URL}carts/add';
  static const String REMOVE_CART = '${BASE_URL}carts/remove/'; //carts/remove/{product_id}
  static const String FETCH_SUMMARY_CART = '${BASE_URL}cart-summary/'; //cart-summary/{user_id}/{cart_id}


  //wishlists
  static const String FAVOURITES_URL = '${BASE_URL}wishlists/'; // wishlists/{user_id}
  static const String ADD_FAVOURITES_URL = '${BASE_URL}wishlists'; // wishlists
  static const String REMOVE_FAVOURITES_URL = '${BASE_URL}wishlists/remove/'; // wishlists/{product_id}


  //order
  // static const String ORDERS_URL = '${BASE_URL}orders/get_all';
  static const String ALL_DRIVER_ORDERS_URL= '${BASE_URL}driverOrders/';
  static const String ALL_ORDERS_URL = '${BASE_URL}orders/all/';
  static const String SEND_ORDER_URL = '${BASE_URL}orders/store';
  static const String CANCEL_ORDER_URL = '${BASE_URL}orders/cancel/'; //orders/cancel/{orderID}
  static const String UPDATE_ORDER_STATUS = '${BASE_URL}orders/update/status/'; //orders/update/status/{orderID}
  static const String COUPON_APPLY = '${BASE_URL}coupon/apply'; //coupon/apply
  static const String TAX = '${BASE_URL}tax'; //tax
  static const String IS_CASH_ON_DELIVERY = '${BASE_URL}cash_on_delivery'; //tax


  //kitchens
  static const String KITCHENS_URL = '${BASE_URL}shops';
  static const String KITCHEN_Products_URL = '${BASE_URL}shops/products/all/'; //shops/products/all/{vendor_id}
  static const String KITCHEN_AddNewProduct_URL = '${BASE_URL}shops/product/add/';
  static const String KITCHEN_UpdateProduct_URL = '${BASE_URL}shops/product/update/';
  static const String KITCHEN_RemoveProduct_URL = '${BASE_URL}shops/product/remove/'; // shop/product/remove/{userID}/{productID}
  static const String UPDATE_KITCHENS_INFO = '${BASE_URL}shops/update/info/'; //shop/update/info/{userID}

  //drivers
  static const String DRIVERS_URL = '${BASE_URL}delivery-boy/all_drivers';
  static const String DRIVERS_REQUESTS = '${BASE_URL}delivery-boy/all_driver_requests';
  static const String send_drivers_requests = '${BASE_URL}delivery-boy/send_drivers_requests';

  static const String DRIVER_DOCUMENTS = '${BASE_URL}documents/';
  static const String UPLOAD_DRIVER_DOCUMENTS = '${BASE_URL}user/update/document/';

  static const String SAVE_DRIVER_VEHICLE = '${BASE_URL}driver/vehicle/save/';
  static const String RETRIEVE_DRIVER_VEHICLE = '${BASE_URL}driver/vehicle/data/';

  //
  static const String about = '${BASE_URL}about-us';
  static const String privacy = '${BASE_URL}privacy';
  static const String terms = '${BASE_URL}terms';
  static const String users = '${BASE_URL}users';

}
