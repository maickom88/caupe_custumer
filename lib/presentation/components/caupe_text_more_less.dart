import '../../core/theme/app_%20typography.dart';
import '../../core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CaupeTextMoreLess extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  const CaupeTextMoreLess({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  _CaupeTextMoreLessState createState() => _CaupeTextMoreLessState();
}

class _CaupeTextMoreLessState extends State<CaupeTextMoreLess> {
  late bool showFlag;
  late String text;
  @override
  void initState() {
    showFlag = false;
    if (widget.text.length > 50) {
      showFlag = true;
      text = widget.text.substring(0, 50);
    } else {
      showFlag = false;
      text = widget.text;
    }
    super.initState();
  }

  verifyIfText() {}
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(
          text: text,
        ),
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.only(right: 6),
            child: InkWell(
              onTap: widget.onTap,
              child: Text(
                '... Show more',
                style:
                    AppTypography.t14().copyWith(color: AppColor.primaryColor),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
