part of 'api.dart';


String _videoPrefix = 'video';

Future<List<ApiVideo>> _videoFindVideo() async {
  var resp = await Api._dio.post('$_videoPrefix/findVideo', data: '{}');
  if (Api._illegalResp(resp)) {
    return Future.error(Api._msgRespError);
  }
  List<ApiVideo> list = [];
  for (Map<String, dynamic> video in resp.data['data']){
    list.add(ApiVideo.fromJson(video));
  }
  return list;
}