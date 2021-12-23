
import 'package:flutter/material.dart';

class RowDividerText extends StatelessWidget {
  const RowDividerText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Divider(
          endIndent: 10,
          thickness: 1,
          color: Colors.grey,
        ),
      ),
      Text("or sign in with"),
      Expanded(
        child: Divider(
          indent: 10,
          thickness: 1,
          color: Colors.grey,
        ),
      ),
    ]);
  }
}
