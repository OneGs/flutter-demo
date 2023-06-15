import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

class CommonToastType {
  static const loading = 'loading';
  static const error = 'error';
  static const success = 'success';
  static const loadingText = '加载中。。。';
}

class CommonToast {
  static showToast(context, msg, config) {
    if (config['type'] == CommonToastType.loading) {
      return BrnLoadingDialog.show(context);
    }

    if (config['type'] == CommonToastType.error) {
      return BrnToast.show(msg, context,
          preIcon: Image.asset(
            'lib/assets/images/error.png',
            width: 24,
            height: 24,
          ));
    }

    if (config['type'] == CommonToastType.success) {
      return BrnToast.show(msg, context,
          preIcon: Image.asset(
            'lib/assets/images/success.png',
            width: 24,
            height: 24,
          ));
    }

    return BrnToast.show(
      msg,
      context,
    );
  }

  static hideToast(context) {
    BrnLoadingDialog.dismiss(context);
  }
}
