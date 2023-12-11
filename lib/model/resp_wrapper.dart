class RespWrapper {
  RespWrapper();

  late int code;
  late String msg;
  late dynamic data;

  factory RespWrapper.fromJson(Map<String, dynamic> json) => RespWrapper()
    ..code = json['code'] as int
    ..msg = json['msg'] as String
    ..data = json['data'] as dynamic;

  Map<String, dynamic> toJson(RespWrapper instance) => <String, dynamic>{
        'code': instance.code,
        'msg': instance.msg,
        'data': instance.data,
      };
}
