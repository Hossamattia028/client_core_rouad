import 'package:client_core/features/domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel(
      {required super.categoryId,
      required super.categoryName,
      required super.icon});

  static CategoryModel fromJson(Map<String, dynamic> jsonObject) {
    return CategoryModel(
      categoryId: jsonObject['id'],
      categoryName: jsonObject['name'],
      icon: jsonObject['icon'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': categoryId,
      'name': categoryName,
      'icon': icon
    };
  }
}
