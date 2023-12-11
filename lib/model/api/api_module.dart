import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ApiModule {
  ApiModule();

  late String name;
  late String path;
  late String imgUrl;
  late num id;

  factory ApiModule.fromJson(Map<String, dynamic> json) => ApiModule()
    ..name = json['name'] as String
    ..path = json['path'] as String
    ..imgUrl = json['imgUrl'] as String
    ..id = json['id'] as num;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'path': path,
        'imgUrl': imgUrl,
        'id': id,
      };
}
