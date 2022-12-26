import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:rsi/ui/_common/buttons/primary_button.dart';
import 'package:rsi/ui/_common/textfields/required_textfield.dart';
import 'package:sizer/sizer.dart';

class FullNameForm extends StatefulWidget {
  const FullNameForm({Key? key, required this.onNext}) : super(key: key);
  final VoidCallback onNext;

  @override
  State<FullNameForm> createState() => _FullNameFormState();
}

class _FullNameFormState extends State<FullNameForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.useL10n();
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              height: 20.h,
              child: Image.asset(
                "assets/images/say_hello.png",
              )),
          Container(
            height: 10.h,
            child: Column(
              children: [
                Container(
                  height: 5.h,
                  child: Text(
                    l10n.registerAnAccount,
                    style: TextStyle(
                        fontSize: kFontSize + 2, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 5.h,
                  child: Text(
                    l10n.enterYourFullNameOnTheIDCard,
                    style: TextStyle(
                      fontSize: kFontSize - 2,
                      color: kDarkTextColor.withOpacity(.4),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 2.5.h),
            child: Column(
              children: <Widget>[
                firstNameField(l10n.firstname),
                lastNameField(l10n.lastname),
              ],
            ),
          ),
          Container(
            height: 15.h,
            child: Theme(
              data: ThemeData(
                  unselectedWidgetColor: kDarkTextColor.withOpacity(.4)),
              child: termOfKrowdCheckBox(
                {
                  "title": l10n.agreeToKrowdTermsOfUse,
                  "seeMore": l10n.seeMore,
                },
              ),
            ),
          ),
          onNextButton(l10n.continueTitle)
        ],
      ),
    );
  }

  Widget firstNameField(title) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return RequiredTextField(
          onChangedString: context.read<SignUpCubit>().onFirstNameChanged,
          title: title,
          errorText: state.status == SignUpStatus.invalid
              ? state.firstnameInvalidMessage
              : null,
          currentText: state.firstname,
        );
      },
    );
  }

  Widget lastNameField(title) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return RequiredTextField(
          onChangedString: context.read<SignUpCubit>().onLastNameChanged,
          title: title,
          errorText: state.status == SignUpStatus.invalid
              ? state.lastnameInvalidMessage
              : null,
          currentText: state.lastname,
        );
      },
    );
  }

  Widget termOfKrowdCheckBox(Map<String, String> text) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return CheckboxListTile(
          title: Container(
            width: 60.w,
            child: RichText(
              text: new TextSpan(
                children: [
                  new TextSpan(
                    text: "${text["title"]} ",
                    style: new TextStyle(
                        color: kDarkTextColor, fontSize: kFontSize - 2),
                  ),
                  new TextSpan(
                    text: "${text["seeMore"]}",
                    style: new TextStyle(
                        color: Color(0xff134A9F),
                        fontSize: kFontSize - 2,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold),
                    recognizer: new TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
            ),
          ),
          value: state.isAgreeTermOfKrowd,
          onChanged: (value) =>
              context.read<SignUpCubit>().onIsAgreeTermOfKrowdChanged(value),
          activeColor: kPrimaryColor,
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        );
      },
    );
  }

  Widget onNextButton(title) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return PrimaryButton(
          title: title,
          enable: state.isAgreeTermOfKrowd,
          onPressed: () => context.read<SignUpCubit>().isValidFullnameForm()
              ? widget.onNext()
              : null,
        );
      },
    );
  }
}
