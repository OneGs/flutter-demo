import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:untitled/widgets/common_toast.dart';

class InterceptorError extends Interceptor {
  late BuildContext _context;

  InterceptorError(BuildContext context) {
    _context = context;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Map<String, dynamic> responseData = response.data;
    if (responseData['code'] != '00000') {
      EasyLoading.dismiss();
      CommonToast.showToast(_context, responseData['msg'] ?? '内部错误',
          {'type': CommonToastType.error});
      return;
    }
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Map<String, dynamic> responseData = err.response?.data;
    EasyLoading.dismiss();
    CommonToast.showToast(_context, responseData['msg'] ?? '内部错误',
        {'type': CommonToastType.error});
    return handler.next(err);
  }
}
