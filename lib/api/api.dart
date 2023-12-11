import '../index.dart';

part 'common.dart';
part 'video.dart';

class Api {
  Api._();

  static final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.50.112:8080/api/',
  ));

  static const _codeSuccess = 200;
  static const _msgRespError = '响应异常';

  static bool _illegalResp(Response<dynamic> resp) {
    if (resp.statusCode == null ||
        resp.statusCode != Api._codeSuccess ||
        resp.data == null) {
      return true;
    }
    if (resp.data['code'] != Api._codeSuccess) {
      return true;
    }
    return false;
  }

  // common
  static Future<ApiCommonInfo> commonInfo() => _commonInfo();

  // video
  static Future<List<ApiVideo>> videoFindVideo() => _videoFindVideo();
}
