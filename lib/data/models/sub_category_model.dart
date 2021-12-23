class SubCategoryModel {
  final String guid;
  final String title;
  final double? price;
  final DateTime? hours;
  SubCategoryModel({
    required this.guid,
    required this.title,
    this.price,
    this.hours,
  });
}
