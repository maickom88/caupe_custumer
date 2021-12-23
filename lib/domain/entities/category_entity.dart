import 'sub_category_type_entity.dart';

class CategoryEntity {
  final String? guid;
  final String? background;
  final String photo;
  final String title;
  final List<SubCategoryTypeEntity> subCategories;
  CategoryEntity({
    required this.guid,
    required this.background,
    required this.title,
    required this.photo,
    required this.subCategories,
  });
}
