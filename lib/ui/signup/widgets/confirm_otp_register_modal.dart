import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:rsi/ui/_common/buttons/primary_button.dart';
import 'package:rsi/ui/_common/textfields/required_textfield.dart';
import 'package:sizer/sizer.dart';

Future<void> showOtpRegisterModal(BuildContext context, Size size,
    VoidCallback onConfirm, String title, String userEmail) {
  return showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => ConfirmOTPModal(
            onConfirm: onConfirm,
            title: title,
            userEmail: userEmail,
          ));
}

class ConfirmOTPModal extends StatelessWidget {
  final VoidCallback onConfirm;
  final String title;
  final String userEmail;
  const ConfirmOTPModal({
    Key? key,
    required this.onConfirm,
    required this.title,
    required this.userEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.useL10n();
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: GestureDetector(
        child: Container(
          height: 60.h,
          decoration: new BoxDecoration(
            color: kBackgroundColor,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(kBorder),
              topRight: const Radius.circular(kBorder),
            ),
          ),
          child: new LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                height: constraints.maxHeight,
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: constraints.maxHeight * .25,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: kFontSize + 2,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      height: constraints.maxHeight * .1,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: RichText(
                          text: new TextSpan(
                            style: new TextStyle(
                              fontSize: kFontSize - 2,
                              color: kDarkTextColor,
                            ),
                            children: <TextSpan>[
                              new TextSpan(
                                  text: '${l10n.otpWillBeSentToYourPhoneNum} '),
                              new TextSpan(
                                  text: userEmail,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: kDefaultPadding),
                      child: RequiredTextField(
                        obscureText: false,
                        title: l10n.enterCode,
                        onChangedString: (text) {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: kDefaultPadding),
                      child: PrimaryButton(
                          title: l10n.confirm, onPressed: onConfirm),
                    ),
                    Container(
                      height: constraints.maxHeight * .15,
                      child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("${l10n.otpNotReceived} "),
                              InkWell(
                                onTap: () => {},
                                child: Text(l10n.resend,
                                    style: TextStyle(color: kPrimaryColor)),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
