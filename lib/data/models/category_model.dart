import '../../domain/entities/category_entity.dart';
import 'sub_category_type_model.dart';

class CategoryModel implements CategoryEntity {
  final String? guid;
  final String? background;
  final String photo;
  final String title;
  final List<SubCategoryTypeModel> subCategories;
  CategoryModel({
    required this.guid,
    required this.background,
    required this.photo,
    required this.title,
    required this.subCategories,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      guid: map['guid'],
      background: map['background'],
      photo: map['photo'],
      title: map['title'],
      subCategories: (map['sub_categories'] as List)
          .map((e) => SubCategoryTypeModel.fromMap(e))
          .toList(),
    );
  }

  factory CategoryModel.fromModel(CategoryEntity entity) {
    return CategoryModel(
      guid: entity.guid,
      background: entity.background,
      photo: entity.photo,
      title: entity.title,
      subCategories: entity.subCategories
          .map((e) => SubCategoryTypeModel.fromModel(e))
          .toList(),
    );
  }
}
