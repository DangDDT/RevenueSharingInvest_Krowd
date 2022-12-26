import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:rsi/ui/_invest/invest.dart';
import 'package:rsi/ui/_management/management.dart';
import 'package:rsi/ui/_menu/menu.dart';
import 'package:rsi/ui/_wallet/wallet.dart';
import 'package:sizer/sizer.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({Key? key}) : super(key: key);

  @override
  _ClientScreenState createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  List<Map<String, String>> _listNavBar = [];
  int _selectedIndex = 0;
  late Timer _timer;
  void _useL10n() {
    var localeProvider = context.read<LocaleProvider>();
    _listNavBar = L10n.getListNavBar(localeProvider);
  }

  @override
  void initState() {
    _useL10n();
    _timer = Timer.periodic(new Duration(seconds: 3), (timer) {
      context.read<NotificationCubit>()..fetchNotifications(false);
    });
    super.initState();
  }

  void _changeScreen(int index) => setState(() => {_selectedIndex = index});
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      InvestScreen(),
      WalletsScreen(),
      ManagementScreen(),
      // NewsScreen(),
      MenuPage(),
    ];
    var currentScreen =
        SafeArea(child: _widgetOptions.elementAt(_selectedIndex));
    var bottomNavigationBarItem = _listNavBar
        .map(
          (nav) => BottomNavigationBarItem(
            label: nav["label"],
            activeIcon: ImageIcon(
              AssetImage(nav["activeIcon"]!),
            ),
            icon: ImageIcon(
              AssetImage(nav["inActiveIcon"]!),
            ),
          ),
        )
        .toList();
    return Scaffold(
      backgroundColor: kBackgroundColor,
      bottomNavigationBar: Container(
        height: 10.h,
        child: BottomNavigationBar(
          iconSize: kFontSize + 10,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: kDarkTextColor,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          selectedIconTheme: IconThemeData(color: kLightPrimaryColor),
          selectedFontSize: kFontSize - 2,
          unselectedItemColor: kGrayBy6,
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          unselectedIconTheme: IconThemeData(color: kGrayBy6),
          unselectedFontSize: kFontSize - 4,
          items: bottomNavigationBarItem,
          onTap: _changeScreen,
        ),
      ),
      body: currentScreen,
    );
  }
}
