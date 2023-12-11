export 'home_page.dart';
export 'video/video_page.dart';
export 'novel/local/novel_local_page.dart';
export 'novel/network/novel_network_page.dart';

import '../index.dart';

Map<String, WidgetBuilder> routes = {
  "/": (context) => const HomePage(),
  "video": (context) => const VideoPage(),
  "novel/local": (context) => const NovelLocalPage(),
  "novel/network": (context) => const NovelNetworkPage(),
};
