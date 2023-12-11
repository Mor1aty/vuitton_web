part of 'api.dart';

String _videoPrefix = 'video';

Future<List<ApiVideo>> _videoFindVideo(String videoId, String videoName) async {
  Map<String, dynamic> paramMap = {};
  if (videoId.isNotEmpty) {
    paramMap['id'] = videoId;
  }
  if (videoName.isNotEmpty) {
    paramMap['name'] = videoName;
  }

  var resp = await Api._dio
      .post('$_videoPrefix/findVideo', data: json.encode(paramMap));

  if (Api._illegalResp(resp)) {
    return Future.error(Api._msgRespError);
  }
  return ApiVideo.listFromJson(resp.data['data']);
}
