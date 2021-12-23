import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/theme/theme.dart';
import 'components.dart';

class CaupeCardDetails extends StatelessWidget {
  const CaupeCardDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 5, right: AppDefault.hPadding, top: 5, bottom: 5),
      child: Container(
        width: 230,
        padding: EdgeInsets.symmetric(
            vertical: AppDefault.vPadding, horizontal: AppDefault.hPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppDefault.defaultBorderRadius(),
          boxShadow: AppDefault.defaultBoxShadow(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CaupeHeaderAvatar(
                  radius: 25,
                  onTap: () {},
                  url:
                      'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?cs=srgb&dl=pexels-chloe-1043471.jpg&fm=jpg',
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mary Does',
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.t16WithW800(),
                      ),
                      Text(
                        'Jardim paulista',
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.t14(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(color: Colors.grey),
            Text(
              'Manicure',
              overflow: TextOverflow.ellipsis,
              style: AppTypography.t16WithW800(),
            ),
            Text(
              'Qui, 14 de Nov - 23:00',
              overflow: TextOverflow.ellipsis,
              style: AppTypography.t14(),
            ),
            Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green[400],
                      ),
                      child: Text(
                        '\$',
                        style:
                            AppTypography.t14().copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  TextSpan(
                    text: ' R\$32,00',
                    style: AppTypography.t16WithW800().copyWith(
                      color: Colors.green[400],
                    ),
                  ),
                ],
              ),
            ).withBottomPadding(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                onLongPress: () => HapticFeedback.vibrate(),
                child: Text('Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
