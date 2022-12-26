import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:rsi/router/router_constants.dart';
import 'package:sizer/sizer.dart';

class InvestScreenNavBar extends StatelessWidget {
  const InvestScreenNavBar({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final l10n = L10n.useL10n();
    return Container(
      width: 100.w,
      child: ListTile(
        contentPadding: EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding - 15,
          top: kDefaultPadding - 10,
          bottom: kDefaultPadding - 10,
        ),
        minLeadingWidth: 0,
        leading: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            var imageString = "assets/images/default_man.png";
            if (state.status == UserStatus.success &&
                state.userProfile != null) {
              imageString = state.userProfile!.image.toString();
            }
            return Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  imageString,
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) =>
                      Image.asset(
                    "assets/images/default_man.png",
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            );
          },
        ),
        title: Text(
          "${l10n.hello},",
          style: TextStyle(
            color: kLightTextColor,
            fontSize: kFontSize - 4,
            fontWeight: FontWeight.w700,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            var firstName = "Họ", lastName = "Tên";
            if (state.status == UserStatus.success &&
                state.userProfile != null) {
              firstName = state.userProfile!.firstName.toString().trim();
              lastName = state.userProfile!.lastName.toString().trim();
            }
            return Text(
              "$firstName $lastName",
              style: TextStyle(
                  fontSize: kFontSize - 2, fontWeight: FontWeight.w700),
            );
          },
        ),
        trailing: Wrap(
          spacing: -kDefaultPadding + 10,
          children: <Widget>[
            BlocBuilder<NotificationCubit, NotificationState>(
              builder: (context, state) {
                return TextButton.icon(
                  icon: Builder(builder: (context) {
                    if (state.newNotification == 0)
                      return Image.asset("assets/icons/notification.png");
                    else
                      return Image.asset(
                        "assets/icons/notification-bing.png",
                      );
                  }),
                  label: Text(
                    "(${state.newNotification.toString()} thông báo mới)",
                    style: TextStyle(
                      color: kLightTextColor,
                      fontSize: kFontSize - 4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, notificationRoute),
                );
              },
            ), // icon-2
          ],
        ),
      ),
    );
  }
}
