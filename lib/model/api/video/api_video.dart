import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ApiVideo {
  ApiVideo();

  late String name;
  late String description;
  late String coverImg;
  late num id;

  factory ApiVideo.fromJson(Map<String, dynamic> json) => ApiVideo()
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..coverImg = json['coverImg'] as String
    ..id = json['id'] as num;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'description': description,
        'coverImg': coverImg,
        'id': id,
      };
}
