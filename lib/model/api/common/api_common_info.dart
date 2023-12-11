import 'package:json_annotation/json_annotation.dart';
import '../api_module.dart';

@JsonSerializable()
class ApiCommonInfo {
  ApiCommonInfo();

  late String lastAccess;
  late String fileServerUrl;
  late List<ApiModule> moduleList;

  factory ApiCommonInfo.fromJson(Map<String, dynamic> json) => ApiCommonInfo()
    ..lastAccess = json['lastAccess'] as String
    ..fileServerUrl = json['fileServerUrl'] as String
    ..moduleList = (json['moduleList'] as List<dynamic>)
        .map((e) => ApiModule.fromJson(e as Map<String, dynamic>))
        .toList();

  static List<ApiCommonInfo> listFromJson(List<dynamic> json) {
    return json
        .map((e) => ApiCommonInfo.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'lastAccess': lastAccess,
        'fileServerUrl': fileServerUrl,
        'moduleList': moduleList,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
