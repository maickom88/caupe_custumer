import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/constants/constants.dart';
import 'core/routes/routes.dart';
import 'core/theme/theme_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  await GetStorage.init();
  await Firebase.initializeApp();
  final initialRoute = await RoutesConsts.initialRoute;
  runApp(CaupeCustumerApp(initialRoute));
}

class CaupeCustumerApp extends StatelessWidget {
  final String initialRoute;
  const CaupeCustumerApp(this.initialRoute);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Caupe Custumer',
      theme: ThemeApp.theme(),
      initialRoute: initialRoute,
      getPages: Routers.pages,
    );
  }
}
