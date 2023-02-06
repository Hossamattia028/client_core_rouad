import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:client_core/core/error/exception.dart';
import 'package:client_core/core/strings/api/api_url.dart';
import 'package:client_core/core/util/hive_boxes.dart';
import 'package:client_core/features/data/models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getAllCategory();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final http.Client client;
  CategoryRemoteDataSourceImpl({required this.client});
  @override
  Future<List<CategoryModel>> getAllCategory() async {
    var response = await client.get(Uri.parse("${ApiUrl.CATEGORIES_URL}${HiveBoxes.getUserLng()}"));
    // debugPrint("getAllCategory ${response.body}");
    if (response.statusCode == 200) {
      final body = json.decode(response.body);

      List<CategoryModel> categories =
          body['data'].map<CategoryModel>((categoryModel) {
        return CategoryModel.fromJson(categoryModel);
      }).toList();
      return categories;
    } else {
      throw ServerException();
    }
  }
}
