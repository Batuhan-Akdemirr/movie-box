import 'package:movie_box_application/core/data/local/shared_keys.dart';
import 'package:movie_box_application/core/data/local/shared_manager.dart';

class IsLogin {
  static final String _isLogin =
      SharedManager.instance.getStringValue(SharedKeys.isLoginControl) ??
          'false';

  static String get isLogin => _isLogin;
}
