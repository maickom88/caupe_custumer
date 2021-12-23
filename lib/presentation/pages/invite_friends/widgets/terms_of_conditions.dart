import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

class TermsOfConditions extends StatelessWidget {
  final String terms;
  final ScrollController scrollController;

  const TermsOfConditions({
    Key? key,
    required this.terms,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: 20, horizontal: AppDefault.hPadding),
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            controller: scrollController,
            children: [
              Center(
                child: Container(
                  width: 120,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey[300],
                  ),
                ),
              ),
              AppDefault.defaultSpaceHeight(),
              Text(
                'Qui dolore culpa laboris proident et fugiat ipsum velit. Ipsum esse in do quis do esse duis adipisicing id. Et do reprehenderit reprehenderit anim velit quis. In enim occaecat aliqua et in reprehenderit anim duis quis.',
              )
            ],
          ),
        ),
      ),
    );
  }
}
