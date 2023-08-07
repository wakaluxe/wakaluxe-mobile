import 'package:wakaluxe/src/generated/assets.dart';

extension LocUtilsX on String {
  String get langIcon {
    switch (this) {
      case 'en':
        return Assets.assetsIconsLangsEn;
      case 'fr':
        return Assets.assetsIconsLangsFr;
      case 'es':
        return Assets.assetsIconsLangsEs;
      case 'de':
        return Assets.assetsIconsLangsDe;
      case 'ar':
        return Assets.assetsIconsLangsAr;
      case 'zh':
        return Assets.assetsIconsLangsZh;
      default:
        return Assets.assetsIconsLangsEn;
    }
  }

  String get language {
    switch (this) {
      case 'en':
        return 'English';
      case 'fr':
        return 'Français';
      case 'es':
        return 'Spanish';
      case 'de':
        return 'Deutsch';
      case 'ar':
        return 'Arabic';
      case 'zh':
        return 'Chinese';
      default:
        return 'English';
    }
  }
}
