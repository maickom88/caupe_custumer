import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/theme.dart';
import '../../../../domain/entities/category_entity.dart';

class TypeService extends StatefulWidget {
  final List<CategoryEntity> categories;
  final Function(CategoryEntity) onService;
  final String? uid;
  const TypeService({
    Key? key,
    required this.onService,
    required this.categories,
    this.uid,
  }) : super(key: key);

  @override
  _TypeServiceState createState() => _TypeServiceState();
}

class _TypeServiceState extends State<TypeService> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 140,
      child: ListView.builder(
        clipBehavior: Clip.none,
        itemCount: widget.categories.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, index) => Column(
          children: [
            InkWell(
              onTap: () => widget.onService(widget.categories[index]),
              onLongPress: () => HapticFeedback.vibrate(),
              child: AnimatedContainer(
                width: widget.uid != null
                    ? widget.uid == widget.categories[index].guid
                        ? 110
                        : 100
                    : 100,
                height: widget.uid != null
                    ? widget.uid == widget.categories[index].guid
                        ? 110
                        : 100
                    : 100,
                margin: EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  boxShadow: widget.uid != null
                      ? widget.uid == widget.categories[index].guid
                          ? AppDefault.defaultBoxShadow(
                              y: 2, x: 1, color: Colors.black45, blur: 5)
                          : []
                      : [],
                  borderRadius: AppDefault.defaultBorderRadius(radius: 10),
                ),
                duration: Duration(milliseconds: 270),
                curve: Curves.bounceInOut,
                child: ClipRRect(
                  borderRadius: AppDefault.defaultBorderRadius(radius: 10),
                  child: ColorFiltered(
                    colorFilter: widget.uid != null
                        ? widget.uid == widget.categories[index].guid
                            ? ColorFilter.mode(
                                Colors.transparent,
                                BlendMode.saturation,
                              )
                            : ColorFilter.mode(
                                Colors.grey,
                                BlendMode.saturation,
                              )
                        : ColorFilter.mode(
                            Colors.grey,
                            BlendMode.saturation,
                          ),
                    child: ExtendedImage.network(
                      widget.categories[index].photo,
                      cache: true,
                      fit: BoxFit.cover,
                      timeLimit: Duration(days: 15),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 100),
              child: Text(
                widget.categories[index].title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
