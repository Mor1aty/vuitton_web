import '../index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController? animationController;
  ApiCommonInfo? commonInfo;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    commonInfo = Global.commonInfo;
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
          title: '首页', needBack: false, rightIconWidgetList: []),
      body: Builder(
        builder: (BuildContext context) {
          if (commonInfo == null ||
              commonInfo?.fileServerUrl == null ||
              commonInfo!.fileServerUrl.isEmpty ||
              commonInfo?.moduleList == null ||
              commonInfo!.moduleList.isEmpty) {
            return const SizedBox();
          }
          return GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
              childAspectRatio: 1.5,
            ),
            padding: const EdgeInsets.only(left: 12, right: 12),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: List<Widget>.generate(
              commonInfo!.moduleList.length,
              (int index) {
                final Animation<double> animation =
                    Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: animationController!,
                    curve: Interval(
                        (1 / commonInfo!.moduleList.length) * index, 1.0,
                        curve: Curves.fastOutSlowIn),
                  ),
                );
                animationController?.forward();
                return ModuleListView(
                  fsServerUrl: commonInfo!.fileServerUrl,
                  module: commonInfo!.moduleList[index],
                  animation: animation,
                  animationController: animationController,
                  callback: () {
                    Navigator.pushNamed(
                        context, commonInfo!.moduleList[index].path);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ModuleListView extends StatelessWidget {
  const ModuleListView({
    Key? key,
    this.fsServerUrl,
    this.module,
    this.callback,
    this.animationController,
    this.animation,
  }) : super(key: key);

  final String? fsServerUrl;
  final ApiModule? module;
  final VoidCallback? callback;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 2,
                        child: Image.network(
                          fsServerUrl! + module!.imgUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: AppColor.backgroundLight,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.0),
                              bottomRight: Radius.circular(16.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, top: 14, bottom: 14),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            module!.name,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 22,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 16),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Text(
                                                module!.path,
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.grey
                                                        .withOpacity(0.8)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.grey.withOpacity(0.2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                      onTap: callback,
                    ),
                  )
                ],
              ),
            ),
          ),
          // ),
        );
      },
    );
  }
}
