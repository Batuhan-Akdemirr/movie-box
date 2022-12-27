

import 'package:movie_box_application/product/init/locale_language_init.dart';

extension LocalDeviceLanguageExtension on LocaleDeviceLanguage {
  String getLocaleLanguage() {
    switch (this) {
      case LocaleDeviceLanguage.tr_TR:
        return 'tr-TR';
      case LocaleDeviceLanguage.en_US:
        return 'en-US';
    }
  }
}
