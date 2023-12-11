import '../../../index.dart';

class NovelLocalPage extends StatefulWidget {
  const NovelLocalPage({super.key});

  @override
  State<StatefulWidget> createState() => _NovelLocalPageState();
}

class _NovelLocalPageState extends State<NovelLocalPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const BodyWidget(
      topBar: TopBarWidget(title: '本地小说', needBack: true,backRouteName: '/', rightIconWidgetList: []),
    );
  }
}
