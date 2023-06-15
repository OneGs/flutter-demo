import 'package:flutter/cupertino.dart';

class LoginState {
  final TextEditingController usernameCtr = TextEditingController();
  final TextEditingController passwordCtr = TextEditingController();

  get username {
    return usernameCtr.text;
  }

  get password {
    return passwordCtr.text;
  }
}
