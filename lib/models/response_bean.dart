import 'package:untitled/interface/map_any.dart';

class ResponseBean<T> {
  String code;
  String? msg;
  T data;

  Map<String, dynamic>? extra;

  ResponseBean({required this.code, this.msg, required this.data, this.extra});

  factory ResponseBean.fromJson(Map<String, dynamic> json, T data) {
    return ResponseBean<T>(
      code: json['code'],
      msg: json['msg'],
      extra: json['extra'],
      data: data,
    );
  }

  MapAny toJson() {
    final MapAny data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    data['data'] = data;

    return data;
  }
}
