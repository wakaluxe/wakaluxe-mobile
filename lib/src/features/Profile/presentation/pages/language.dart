import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

<<<<<<< HEAD
@RoutePage(name: 'Language')
=======
@RoutePage()    
>>>>>>> 5c430bba86ac8f925b88c0faa991c8679432bf5b
class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  void _handleRadioValueChanged(int? value) {
    setState(() {
      _selectedValue = value!;
    });
  }

  int _selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          'Language',
          style: theme.title,
        ),
      ),
      body: Container(
        width: context.width,
        padding: EdgeInsets.symmetric(
          horizontal: 20.0.w,
          vertical: 30.0.h,
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Text('English', style: theme.body1),
                const Spacer(),
                Radio(
                  value: 1,
                  activeColor: context.theme.primaryColor,
                  groupValue: _selectedValue,
                  onChanged: _handleRadioValueChanged,
                )
              ],
            ),
            40.vGap,
            Row(
              children: [
                Text('French', style: theme.body1),
                const Spacer(),
                Radio(
                  activeColor: context.theme.primaryColor,
                  value: 2,
                  groupValue: _selectedValue,
                  onChanged: _handleRadioValueChanged,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
