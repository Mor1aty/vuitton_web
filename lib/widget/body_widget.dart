import '../index.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
    required this.topBar,
    this.body,
  }) : super(key: key);
  final TopBarWidget topBar;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColor.backgroundHeavy,
              AppColor.backgroundLight,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              topBar,
              Expanded(child: body != null ? body! : const SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
