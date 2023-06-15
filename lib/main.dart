import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled/router/app_pages/index.dart';
import 'package:untitled/router/app_routes/index.dart';
import 'package:untitled/translations.dart';
import 'package:untitled/utils/storage.dart';

final GlobalKey<NavigatorState> globalKey = GlobalKey();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  // ----------------------
  runApp(
    GetMaterialApp(
      navigatorKey: globalKey,
      initialRoute: AppRoutes.login,
      getPages: AppPages.routes,
      translations: CustomTranslations(),
      locale: const Locale('en', 'CH'),
      builder: EasyLoading.init(),
    ),
  );
  // ----------------------
}
