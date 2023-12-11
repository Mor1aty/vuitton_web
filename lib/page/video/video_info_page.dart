import '../../index.dart';

class VideoInfoPage extends StatefulWidget {
  const VideoInfoPage({super.key});

  @override
  State<StatefulWidget> createState() => _VideoInfoPageState();
}

class _VideoInfoPageState extends State<VideoInfoPage>
    with TickerProviderStateMixin {
  final double infoHeight = 364.0;
  AnimationController? animationController;
  Animation<double>? animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController!,
        curve: const Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    animationPlay();
    super.initState();
  }

  Future<void> animationPlay() async {
    animationController?.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    ApiVideo video;
    try {
      video = (ModalRoute.of(context)?.settings.arguments
          as Map<String, dynamic>)['video'] as ApiVideo;
    } catch (e) {
      return const SizedBox();
    }

    print(video);
    return const BodyWidget(
      topBar: TopBarWidget(
          title: '视频',
          needBack: true,
          backRouteName: 'video',
          rightIconWidgetList: []),
    );
  }
}
