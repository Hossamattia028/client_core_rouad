import 'package:hive/hive.dart';

class InitHiveBoxesConfiguration {
  static Future initHiveBoxes() async {
    await Hive.openBox<int>('userId');
    await Hive.openBox<String>('userToken');
    await Hive.openBox<String>('userLng');
    await Hive.openBox<String>('userLat');
    await Hive.openBox<String>('userLong');
  }
}
