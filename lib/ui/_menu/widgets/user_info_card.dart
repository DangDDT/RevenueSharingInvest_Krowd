import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    Key? key,
    this.onPressed,
  }) : super(key: key);
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        final user = state.userProfile!;
        return InkWell(
          onTap: onPressed,
          child: Container(
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    user.image.toString(),
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) =>
                        Image.asset(
                      "assets/images/default_man.png",
                      fit: BoxFit.cover,
                      width: 48,
                      height: 48,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: kDefaultPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${user.firstName.toString().trim()} ${user.lastName.toString().trim()}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: kDarkTextColor,
                            fontSize: kFontSize),
                      ),
                      SizedBox(
                        height: kDefaultPadding - 12,
                      ),
                      Text(
                        user.email.toString(),
                        style: TextStyle(
                          color: kGrayBy6,
                          fontSize: kFontSize - 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
