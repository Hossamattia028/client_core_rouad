
import 'package:hive/hive.dart';


class HiveBoxes {
  static final _userId = Hive.box<int>('userId');
  static final _userToken = Hive.box<String>('userToken');
  static final _userLng = Hive.box<String>('userLng');
  static final _userLat = Hive.box<String>('userLat');
  static final _userLong = Hive.box<String>('userLong');



  static removeDataForLogout() async{
    setUserToken(userToken: '');
    setUserLng(userLng: 'ar');
  }


  static setUserId({required int userId}) {
    _userId.put('userId', userId);
  }
  static setUserToken({required String userToken}) {
    _userToken.put('userToken', userToken);
  }

  static setUserLng({required String userLng}) {
    _userLng.put('userLng', userLng);
  }

  static setUserLat({required String userLat}) {
    _userLat.put('userLat', userLat);
  }
  static setUserLong({required String userLng}) {
    _userLong.put('userLong', userLng);
  }

  static int? getUserId() => _userId.get('userId');
  static String? getUserToken() => _userToken.get('userToken')==''?null:_userToken.get('userToken');
  static String? getUserLng() => _userLng.get('userLng')??"ar";
  static String? getUserLat() => _userLat.get('userLat');
  static String? getUserLong() => _userLong.get('userLong');
}
