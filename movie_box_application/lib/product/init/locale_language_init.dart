import 'package:movie_box_application/core/data/network/services/service_library.dart';
import 'package:movie_box_application/core/utils/extensions/locale_device_language_extension.dart';

class InitLocaleLanguage {
  InitLocaleLanguage._() {
    _localeLanguege = _deviceLocale();
  }

  late final String _localeLanguege;

  
  static InitLocaleLanguage instance = InitLocaleLanguage._();

  String _deviceLocale() {
    if (Platform.localeName == LocaleDeviceLanguage.tr_TR.name) {
      return LocaleDeviceLanguage.tr_TR.getLocaleLanguage();
    } else {
      return LocaleDeviceLanguage.en_US.getLocaleLanguage();
    }
  }

  String get localeLanguage => _localeLanguege;
}

enum LocaleDeviceLanguage { tr_TR, en_US }

