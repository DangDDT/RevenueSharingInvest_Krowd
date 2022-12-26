import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:sizer/sizer.dart';

class ChangeLanguageTabBar extends StatefulWidget {
  const ChangeLanguageTabBar({
    Key? key,
  }) : super(key: key);

  @override
  State<ChangeLanguageTabBar> createState() => _ChangeLanguageTabBarState();
}

class _ChangeLanguageTabBarState extends State<ChangeLanguageTabBar> {
  var localeProvider;
  @override
  void initState() {
    localeProvider = context.read<LocaleProvider>();
    super.initState();
  }

  void onChanged(index) {
    Locale locale =
        L10n.support.entries.singleWhere((e) => e.key == index).value;
    localeProvider.setLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    var initialIndex = L10n.support.entries
        .singleWhere((e) => e.value == localeProvider.locale)
        .key;

    return Container(
      width: 55.w,
      child: DefaultTabController(
        initialIndex: initialIndex,
        length: 2,
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: kPrimaryColor,
          labelStyle: TextStyle(
              fontSize: kFontSize - 2,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: nGray6,
                  offset: Offset(-5.0, 5),
                  blurRadius: 15.0,
                )
              ]),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          tabs: [
            Tab(child: Text('Tiếng Việt')),
            Tab(child: Text('English')),
          ],
          onTap: onChanged,
        ),
      ),
    );
  }
}
