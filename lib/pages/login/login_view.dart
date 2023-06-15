import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/common/config_colors.dart';
import 'package:untitled/widgets/common_button.dart';
import 'package:untitled/widgets/common_image.dart';

import 'login_logic.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  _generateInputForm(
      {required hintText,
      required iconSrc,
      required controller,
      bool obscureText = false}) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFffffff), width: 1),
          borderRadius: BorderRadius.circular((25)), // 圆角
          color: Colors.white),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        style: const TextStyle(fontSize: 16, height: 1.4),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: Container(
            width: 30,
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: CommonImage(
              iconSrc,
              width: 20,
              height: 20,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  _generateDividerBar({double height = 20.0}) {
    return SizedBox(height: height);
  }

  _generateConfirmBtn(BuildContext context, LoginLogic logic) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CommonButton(
        width: MediaQuery.of(context).size.width,
        onPressed: () => logic.handleLogin(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<LoginLogic>();
    final state = Get.find<LoginLogic>().state;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: ConfigColors.color_E8F9FF,
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: ConfigColors.color_E8F9FF,
              appBar: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 0),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
              ),
            ),
            SizedBox(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: const CommonImage(
                'lib/assets/images/head_bg.png',
                height: 80,
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 200, 0, 0),
                alignment: Alignment.topCenter,
                child: const Text(
                  '引江补汉工程数字化建管系统',
                  style: TextStyle(
                      fontSize: 20,
                      color: ConfigColors.color_36C6D9,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
                height: 300,
                margin: const EdgeInsets.fromLTRB(0, 290, 0, 0),
                alignment: Alignment.center,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Column(
                    children: [
                      _generateInputForm(
                          hintText: '请输入账号',
                          iconSrc: 'lib/assets/images/login_account.png',
                          controller: state.usernameCtr),
                      _generateDividerBar(),
                      _generateInputForm(
                          hintText: '请输入密码',
                          obscureText: true,
                          iconSrc: 'lib/assets/images/login_pwd.png',
                          controller: state.passwordCtr),
                      _generateDividerBar(),
                      _generateConfirmBtn(context, logic)
                    ],
                  ),
                ))),
          ],
        ),
      ),
    );
  }
}
