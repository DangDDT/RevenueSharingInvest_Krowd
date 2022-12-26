import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:rsi/router/router_constants.dart';
import 'package:rsi/ui/_common/buttons/secondary_button.dart';
import 'package:sizer/sizer.dart';
import 'widgets/setting_menu_item.dart';
import 'widgets/user_info_card.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    context.read<UserCubit>().loadUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final l10n = L10n.useL10n();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                  top: kDefaultPadding * 2,
                  left: kDefaultPadding,
                  right: kDefaultPadding),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(kDefaultPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kBackgroundColor,
                      boxShadow: kBoxShadow,
                    ),
                    child: UserInfoCard(
                      onPressed: () =>
                          Navigator.pushNamed(context, profileRoute),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: kDefaultPadding - 10),
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        l10n.setting.toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: kGrayBy6,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 25.h,
                    decoration: BoxDecoration(
                      color: nWhite,
                      borderRadius: BorderRadius.circular(kBorder),
                      boxShadow: kBoxShadow,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SettingMenuItem(
                          size: size,
                          imageLink: 'assets/images/user_icon.png',
                          title: l10n.linkedAccount,
                          onPressed: () {},
                        ),
                        SettingMenuItem(
                          size: size,
                          imageLink: 'assets/images/invite_friend.png',
                          title: l10n.inviteFriend,
                          onPressed: () {},
                        ),
                        SettingMenuItem(
                          size: size,
                          imageLink: 'assets/images/setting.png',
                          title: l10n.setting,
                          onPressed: () {},
                        ),
                        SettingMenuItem(
                          size: size,
                          imageLink: 'assets/images/message_question.png',
                          title: l10n.qna,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: kDefaultPadding - 10),
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        l10n.contactUs.toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: kGrayBy6,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: nWhite,
                      borderRadius: BorderRadius.circular(kBorder),
                      boxShadow: kBoxShadow,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SettingMenuItem(
                          size: size,
                          imageLink: 'assets/images/facebook_green.png',
                          title: l10n.officialFanpage,
                          onPressed: () {},
                        ),
                        SettingMenuItem(
                          size: size,
                          imageLink: 'assets/images/profile_2user.png',
                          title: l10n.facebookCommunity,
                          onPressed: () {},
                        ),
                        SettingMenuItem(
                          size: size,
                          imageLink: 'assets/images/phone.png',
                          title: '0972279977',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: SecondaryButton(
                      title: "Đăng xuất",
                      onPress: () async {
                        context.read<AuthBloc>().add(LogOutRequested());
                      },
                      contentColor: kHotColor,
                      backgroundColor: nWhite,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
