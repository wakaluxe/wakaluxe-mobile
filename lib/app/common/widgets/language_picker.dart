import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/app/extensions/langx.dart';
import 'package:wakaluxe/app/i18n/translations.g.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/onboarding/language/cubit/language_cubit.dart';

class WakaluxeLangPicker extends StatelessWidget {
  const WakaluxeLangPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, String>(
      builder: (context, state) {
        return DropdownButton<String>(
          underline: const SizedBox.shrink(),
          value: state,
          onChanged: (locale) {
            context.read<LanguageCubit>().setLocale(locale ?? 'en');
            LocaleSettings.setLocaleRaw(
              locale ?? 'en',
              listenToDeviceLocale: true,
            );
          },
          items: <String>['en', 'fr', 'es', 'de', 'ar', 'zh']
              .map<DropdownMenuItem<String>>((String lang) {
            return DropdownMenuItem<String>(
              value: lang,
              child: Row(
                children: [
                  Image.asset(
                    lang.langIcon,
                    width: 24.w,
                  ),
                  8.hGap,
                  Text(lang.language),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
