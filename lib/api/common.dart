part of 'api.dart';

String _commonPrefix = 'common';

Future<ApiCommonInfo> _commonInfo() async {
  var resp = await Api._dio.get('$_commonPrefix/info');
  if (Api._illegalResp(resp)) {
    return Future.error(Api._msgRespError);
  }
  return ApiCommonInfo.fromJson(resp.data['data']);
}
