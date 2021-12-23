import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/theme.dart';
import '../../../components/components.dart';

class ReportService extends StatefulWidget {
  final ScrollController scrollController;
  final Function() onSend;
  const ReportService({
    Key? key,
    required this.onSend,
    required this.scrollController,
  }) : super(key: key);

  @override
  _ReportServiceState createState() => _ReportServiceState();
}

class _ReportServiceState extends State<ReportService> {
  late bool loadSend;
  @override
  void initState() {
    loadSend = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            Container(
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
                controller: widget.scrollController,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CaupeTitleWidget(title: 'Whats is problem?')
                          .withBottomPadding(),
                      TextFormField(
                        maxLines: 4,
                        maxLength: 500,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Let me know what problems you had!',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                      ),
                      onPressed: () {
                        widget.onSend.call();
                        Get.back();
                      },
                      child: Text('Report problem'),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
