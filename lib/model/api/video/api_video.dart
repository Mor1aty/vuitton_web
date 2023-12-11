import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ApiVideo {
  ApiVideo();

  late String id;
  late String name;
  late String description;
  late String coverImg;

  factory ApiVideo.fromJson(Map<String, dynamic> json) => ApiVideo()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..coverImg = json['coverImg'] as String;

  static List<ApiVideo> listFromJson(List<dynamic> json) {
    return json
        .map((e) => ApiVideo.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'description': description,
        'coverImg': coverImg,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
