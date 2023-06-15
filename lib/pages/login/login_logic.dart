import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled/interface/map_any.dart';
import 'package:untitled/models/login_bean.dart';
import 'package:untitled/router/app_routes/index.dart';
import 'package:untitled/services/login.dart';
import 'package:untitled/utils/judge.dart';
import 'package:untitled/utils/storage.dart';
import 'package:untitled/widgets/common_toast.dart';

import 'login_state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  Future<String> _getEncryption() async {
    if (isEmpty(state.username) || isEmpty(state.password)) return '';

    String encryption = await ApiLogin.encryption(
      Get.context,
      {'password': state.password},
    );

    return encryption;
  }

  Future<LoginBean> _getLoginInfo(String encryption) async {
    MapAny info = {'password': encryption, 'username': state.username};

    return await ApiLogin.login(Get.context, info);
  }

  bool _validateForm() {
    if (isEmpty(state.username)) {
      CommonToast.showToast(
          Get.context, '账号不能为空', {'type': CommonToastType.error});
      return false;
    }

    if (isEmpty(state.password)) {
      CommonToast.showToast(
          Get.context, '密码不能为空', {'type': CommonToastType.error});
      return false;
    }

    return true;
  }

  _setGlobalLocalStorage({required String token}) async {
    !isEmpty(token) && await LocalStorageTools.setToken('xxx');
  }

  Future<void> handleLogin() async {
    if (!_validateForm()) return;

    EasyLoading.show(status: '正在登录...');
    String encryption = await _getEncryption();

    if (isEmpty(encryption)) return;

    LoginBean loginInfo = await _getLoginInfo(encryption);
    await _setGlobalLocalStorage(token: loginInfo.token);
    Future.delayed(const Duration(seconds: 1), () {
      EasyLoading.dismiss();
      Get.offNamed(AppRoutes.home);
    });
  }
}
