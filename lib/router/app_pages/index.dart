import 'package:get/get.dart'; // -------------------routes-------------------------------
import 'package:untitled/pages/home/home_binding.dart';
import 'package:untitled/pages/home/home_view.dart';
import 'package:untitled/pages/login/login_binding.dart';
import 'package:untitled/pages/login/login_view.dart';
import 'package:untitled/router/app_routes/index.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
        name: AppRoutes.home, page: () => HomePage(), binding: HomeBinding()),
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginPage(),
        binding: LoginBinding()),
  ];
}
