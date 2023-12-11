import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ApiModule {
  ApiModule();

  late String imgUrl;
  late int id;
  late String name;
  late String path;

  factory ApiModule.fromJson(Map<String, dynamic> json) => ApiModule()
    ..imgUrl = json['imgUrl'] as String
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..path = json['path'] as String;

  static List<ApiModule> listFromJson(List<dynamic> json) {
    return json
        .map((e) => ApiModule.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'imgUrl': imgUrl,
        'id': id,
        'name': name,
        'path': path,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
