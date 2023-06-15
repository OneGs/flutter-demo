import 'package:to_string_pretty/to_string_pretty.dart';
import 'package:untitled/utils/judge.dart';

class LoginBean {
  late String token;
  String? tokenType;
  String? theme;
  DefaultProject? defaultProject;

  LoginBean({
    required this.token,
    this.tokenType,
    this.theme,
    this.defaultProject,
  });

  LoginBean.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    tokenType = json['tokenType'];
    theme = json['theme'];
    defaultProject = isEmpty(json['defaultProject'])
        ? DefaultProject.fromJson(json['defaultProject'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['tokenType'] = tokenType;
    data['theme'] = theme;
    if (defaultProject != null) {
      data['defaultProject'] = defaultProject!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return toStringPretty(toJson());
  }
}

class DefaultProject {
  String? projectId;

  DefaultProject({this.projectId});

  DefaultProject.fromJson(Map<String, dynamic> json) {
    projectId = json['projectId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['projectId'] = projectId;
    return data;
  }
}
