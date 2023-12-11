import '../../index.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<StatefulWidget> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> with TickerProviderStateMixin {
  AnimationController? animationController;
  final ScrollController _scrollController = ScrollController();
  final String fsServerUrl = Global.commonInfo.fileServerUrl;
  final TextEditingController _searchTextEditingController =
      TextEditingController();

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BodyWidget(
      topBar: const TopBarWidget(
          title: '视频',
          needBack: true,
          backRouteName: '/',
          rightIconWidgetList: []),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SearchBarWidget(
              context: context,
              textEditingController: _searchTextEditingController,
              searchCallback: () {

              },
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: FutureBuilder(
            future: Api.videoFindVideo(),
            builder:
                (BuildContext context, AsyncSnapshot<List<ApiVideo>> snapshot) {
              if (snapshot.hasError || !snapshot.hasData) {
                return const SizedBox();
              } else {
                return GridView(
                  padding: const EdgeInsets.all(8),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 32.0,
                    crossAxisSpacing: 32.0,
                    childAspectRatio: 0.8,
                  ),
                  children: List<Widget>.generate(
                    snapshot.data!.length,
                    (int index) {
                      final int count = snapshot.data!.length;
                      final Animation<double> animation =
                          Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: animationController!,
                          curve: Interval((1 / count) * index, 1.0,
                              curve: Curves.fastOutSlowIn),
                        ),
                      );
                      animationController?.forward();
                      return VerticalCardWidget(
                        callback: () {
                          print(snapshot.data![index].name);
                        },
                        animation: animation,
                        animationController: animationController!,
                        videoName: snapshot.data![index].name,
                        videoImage: snapshot.data![index].coverImg,
                        fsServerUrl: fsServerUrl,
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
