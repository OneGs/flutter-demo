import 'package:untitled/interface/map_any.dart';
import 'package:untitled/models/login_bean.dart';
import 'package:untitled/models/response_bean.dart';
import 'package:untitled/utils/request.dart';

class ApiLogin {
  static Future<String> encryption(context, MapAny params) async {
    ResponseBean serviceRes = await RequestRoot.of(context)
        .get<String>('/api/auth/encryption', params: params);
    return serviceRes.data ?? '';
  }

  static Future<LoginBean> login(context, MapAny params) async {
    ResponseBean serviceRes = await RequestRoot.of(context)
        .post<MapAny>('/api/auth/login', params: params);

    return LoginBean.fromJson(serviceRes.data);
  }
}
