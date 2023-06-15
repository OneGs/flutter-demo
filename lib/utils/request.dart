import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/response_bean.dart';
import 'package:untitled/utils/interceptor_error.dart';

import '../interface/map_any.dart';

class RequestRoot {
  Dio? _instance;

  late BuildContext _context;

  static RequestRoot of(BuildContext context) {
    return RequestRoot._internal(context);
  }

  RequestRoot._internal(BuildContext context) {
    if (_instance == null || _context != context) {
      _context = context;
      _instance = Dio(BaseOptions(
        baseUrl: 'http://192.168.110.206:8181',
        connectTimeout: const Duration(minutes: 10),
        receiveTimeout: const Duration(minutes: 10),
        extra: {'context': _context},
      ));

      // _instance!.interceptors.add(LogInterceptor(responseBody: true));
      _instance!.interceptors.add(InterceptorError(_context));
    }
  }

  ResponseBean<T> _transformResponse2Bean<T>(MapAny info) {
    return ResponseBean<T>.fromJson(info, info['data']);
  }

  Future<ResponseBean<T>> get<T>(
    String path, {
    MapAny? params,
    Options? options,
  }) async {
    Response<MapAny> service = await _instance!.get(
      path,
      queryParameters: params,
      options: options,
    );

    return _transformResponse2Bean<T>(service.data!);
  }

  Future<ResponseBean<T>> post<T>(
    String path, {
    MapAny? params,
    Options? options,
  }) async {
    Response<MapAny> service = await _instance!.post(
      path,
      data: params,
      options: options,
    );

    return _transformResponse2Bean<T>(service.data!);
  }
}
