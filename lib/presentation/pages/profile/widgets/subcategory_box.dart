import 'package:caupe_custumer/domain/entities/category_entity.dart';
import 'package:caupe_custumer/domain/entities/service_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../../data/models/models.dart';
import 'widgets.dart';

class SubCategoryBox extends StatefulWidget {
  final CategoryEntity category;
  final ServiceEntity? service;
  final Function(List<SubCategoryModel>) onCategory;

  const SubCategoryBox({
    Key? key,
    required this.category,
    required this.service,
    required this.onCategory,
  }) : super(key: key);

  @override
  _SubCategoriesState createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategoryBox> {
  late List<SubCategoryModel> categories;

  @override
  void initState() {
    categories = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: double.infinity,
      padding:
          EdgeInsets.symmetric(horizontal: AppDefault.hPadding, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: AppDefault.defaultBorderRadius(),
        color: Colors.white,
        boxShadow: AppDefault.defaultBoxShadow(),
      ),
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInBack,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.category.subCategories.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) => SubCategory(
          prices: widget.service?.value,
          onCategory: (category) {
            if (category != null) {
              categories
                  .removeWhere((element) => element.guid == category.guid);
              categories.add(category);
              widget.onCategory(categories);
            } else {
              widget.onCategory([]);
            }
          },
          title: widget.category.subCategories[index].title,
          guid: widget.category.subCategories[index].guid,
        ),
      ),
    );
  }
}
