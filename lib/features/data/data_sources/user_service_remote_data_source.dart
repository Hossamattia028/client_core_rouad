import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:http/http.dart' as http;
import 'package:client_core/core/error/exception.dart';
import 'package:client_core/core/strings/api/api_url.dart';
import 'package:client_core/core/util/hive_boxes.dart';
import 'package:client_core/core/util/return_data_source.dart';
import 'package:client_core/core/util/set_notification.dart';
import 'package:client_core/features/data/models/user_service_model.dart';

abstract class UserServiceRemoteDataSourceImpl {
  Future<UserServiceModel> getUserData();
  Future<UserServiceModel> registerUser(Map<String, dynamic> userData);
  Future<UserServiceModel> loginUser({required String email, required String password});
  Future<void> logoutUser(String accessToken);
  Future<bool> updateUserProfile({required Map<String, dynamic> userData});
  Future<bool> updateStatus({required bool value});
}

class UserServiceRemoteDataSource implements UserServiceRemoteDataSourceImpl {
  final http.Client client;
  UserServiceRemoteDataSource({required this.client});


  @override
  Future<bool> updateStatus({required bool value}) async{
    var response = await client.post(Uri.parse("${ApiUrl.UPDATE_STATUS}$value"),headers: ApiUrl.headerAuth);
    // debugPrint("removeProduct ${response.body}");
    if (response.statusCode == 200) {
      return true;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserServiceModel> getUserData() async{
    var response = await client.get(Uri.parse("${ApiUrl.USER_PROFILE_DATA}${HiveBoxes.getUserId()}"),
        headers: ApiUrl.headerAuth);
    // debugPrint("getUserData: ${response.body}");
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      return UserServiceModel.fromJson(body['data'][0]);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserServiceModel> loginUser({required String email, required String password}) async {
    String? token =  await FirebaseMessaging.instance.getToken();
    var data = {'phone': email,'password': password,"f_token": token??""};
    var response = await client.post(
      Uri.parse(ApiUrl.LOGIN_URL),
      body: json.encode(data),
      headers: {
        "Content-Type": "application/json",
      },
    );
    debugPrint("loginUser: ${response.body}");
    if (response.statusCode == 200) {
      final Map<String, dynamic> bodyData = json.decode(response.body);
      UserServiceModel user = UserServiceModel.fromJson(bodyData['user']);
      await saveLocalData(bodyData);
      SetNotification.showNotification(title: "", msg: translate("toast.welcome"));
      return user;
    } else {
      throw ServerException();
    }
  }

  saveLocalData(Map<String, dynamic> bodyData)async{
    await HiveBoxes.setUserToken(userToken: bodyData['access_token']);
    ApiUrl.headerAuth = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${HiveBoxes.getUserToken()}',
    };
    UserServiceModel user = UserServiceModel.fromJson(bodyData['user']);

  }

  @override
  Future<Unit> logoutUser(String accessToken) {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }

  @override
  Future<UserServiceModel> registerUser(Map<String, dynamic> userData,{bool social = false,File? storeBanner,File? storeLicense}) async {
    var request = http.MultipartRequest('POST', Uri.parse(ApiUrl.REGISTER_URL));
    var headers = ApiUrl.headerAuth;
    String? token =  await FirebaseMessaging.instance.getToken();
    request.fields['name'] = userData['name'];
    request.fields['email'] = userData['email'];
    request.fields['city'] = userData['city']==null || userData['city']==""?"city":userData['city'];
    request.fields['phone'] = userData['phone'];
    request.fields['country_code'] = userData['country_code']==null || userData['country_code']==""?"+":userData['country_code'];
    request.fields['user_type'] = userData['user_type'];
    request.fields['password'] = userData['password'];
    request.fields['status'] = "offline";
    request.fields['latitude'] = HiveBoxes.getUserLat().toString();
    request.fields['longitude'] = HiveBoxes.getUserLong().toString();
    request.fields['f_token'] = token ?? "";
    if(userData['work_time']!=null)request.fields['work_time'] = userData['work_time'];
    if(storeBanner!=null&&storeLicense!=null){
      var file = await http.MultipartFile.fromPath('logo', storeBanner.path);
      var fileLice = await http.MultipartFile.fromPath('seller_license', storeLicense.path);
      request.files.add(file);
      request.files.add(fileLice);
    }
    request.headers.addAll(headers);
    var streamedResponse = await request.send();
    var res = await http.Response.fromStream(streamedResponse);
    // debugPrint("registerUser: ${res.body}");
    var decodedData = jsonDecode(res.body);
    if(decodedData['status']==true){
      await saveLocalData(decodedData);
      await HiveBoxes.setUserToken(userToken: decodedData['access_token'].toString());
      SetNotification.showNotification(title: "", msg: translate("toast.welcome"));

      return  UserServiceModel.fromJson(decodedData['user']);
    }
    return  UserServiceModel.fromJson(decodedData['user']);
  }

  @override
  Future<bool> updateUserProfile({required Map<String, dynamic> userData}) async {
    var body = {
      if(userData['name']!=null)'name': userData['name']??'',
      if(userData['email']!=null)'email': userData['email'],
      if(userData['phone']!=null)'phone': userData['phone'],
      if(userData['country_code']!=null)'country_code': userData['country_code'],
      if(userData['address']!=null)'address': userData['address'],
      if(userData['area']!=null)'area': userData['area'],
      if(userData['city']!=null)'city': userData['city'],
      if(userData['status']!=null)'status': userData['status'],
      if(userData['bank_account_no']!=null)'bank_account_no': userData['bank_account_no'],
      if(userData['bank_account_name']!=null)'bank_account_name': userData['bank_account_name'],
      if(userData['bank_name']!=null)'bank_name': userData['bank_name'],
      if(userData['bank_iban']!=null)'bank_iban': userData['bank_iban'],
      if(userData['latitude']!=null)'latitude': userData['latitude'],
      if(userData['longitude']!=null)'longitude': userData['longitude'],
      if(userData['remember_token']!=null)'remember_token': userData['remember_token'],
      if(userData['work_time']!=null)'work_time': userData['work_time'],
    };
    var response = await client.post(Uri.parse("${ApiUrl.UPDATE_USER_PROFILE}${HiveBoxes.getUserId()}"),
        body: json.encode(body),
        headers: ApiUrl.headerAuth);
    // debugPrint("updateUserProfile: ${response.body}");
    var decodedData = jsonDecode(response.body);
    if(decodedData['status']==true){
      return true;
    }else{
      return false;
    }
  }


  //providerID if 1 it will be google if 0 it will be facebook
  Future signSocialApi({required String name,required String email,required String providerID})async {
    var data = {
      'email': email,
      'provider_id': providerID,
      'name': name
    };
    var response = await client.post(
      Uri.parse(ApiUrl.SOCIAL_LOGIN_URL),
      body: json.encode(data),
      headers: {"Content-Type": "application/json",},
    );
    debugPrint("signSocialApi: ${response.body}");
    if (response.statusCode == 200) {
      final Map<String, dynamic> bodyData = json.decode(response.body);
      UserServiceModel user = UserServiceModel.fromJson(bodyData['user']);
      await saveLocalData(bodyData);
      return user;
    }
  }
  // Future<UserService> socialSigning({required bool isLogin,required bool isGmail})async{
  //   if(isGmail)return await signInWithGoogle(isLogin: isLogin);
  //   return await signInWithFacebook(isLogin: isLogin);
  // }
  //
  // //UserCredential
  // Future<UserService> signInWithGoogle({required bool isLogin}) async {
  //   try{
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: ['profile', 'email']).signIn();
  //     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken,
  //     );
  //     var user = await FirebaseAuth.instance.signInWithCredential(credential);
  //     return await signSocialApi(email: user.user!.email.toString(),name: user.user!.displayName.toString(),providerID: "1");
  //   }catch(e){
  //     debugPrint("signInWithGoogle $e");
  //     Util.snackBar(msg: "$e", color: redColor);
  //     return UserService(userId: 0,userName: "",phoneNumber: "",email: "",area: "",address: "",status: false,image: "",countryCode: "");
  //   }
  // }
  //
  //
  // Future<UserService> signInWithFacebook({required bool isLogin}) async {
  //  try{
  //    final LoginResult loginResult = await FacebookAuth.instance.login(permissions: ['email', 'public_profile']);
  //    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //    var user = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  //    return await signSocialApi(email: user.user!.email.toString(),name: user.user!.displayName.toString(),providerID: "0");
  //  }catch(e){
  //    debugPrint("signInWithFacebook $e");
  //    Util.snackBar(msg: "$e", color: redColor);
  //    return UserService(userId: 0,userName: "",phoneNumber: "",email: "",area: "",address: "",status: false,image: "",countryCode: "");
  //  }
  // }
}
