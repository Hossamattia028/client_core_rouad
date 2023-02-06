import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int categoryId;
  final String categoryName;
  final String icon;

  const Category(
      {required this.categoryId,
      required this.categoryName,
      required this.icon,
      });

  @override
  List<Object?> get props => [categoryId, categoryName,icon];
}
