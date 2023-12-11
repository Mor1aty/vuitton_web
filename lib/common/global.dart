import '../index.dart';

class Global {
  static late SharedPreferences _pref;

  static bool get isRelease => const bool.fromEnvironment('dart.vm.product');

  static late ApiCommonInfo _commonInfo;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _pref = await SharedPreferences.getInstance();
    _commonInfo = await Api.commonInfo();
  }

  static ApiCommonInfo get commonInfo => _commonInfo;
}
