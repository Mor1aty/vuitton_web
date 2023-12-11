import '../../../index.dart';

class NovelNetworkPage extends StatefulWidget {
  const NovelNetworkPage({super.key});

  @override
  State<StatefulWidget> createState() => _NovelNetworkState();
}

class _NovelNetworkState extends State<NovelNetworkPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const BodyWidget(
      topBar: TopBarWidget(title: '网络小说', needBack: true,backRouteName: '/', rightIconWidgetList: []),
    );
  }
}
