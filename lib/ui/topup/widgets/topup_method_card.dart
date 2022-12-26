import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:sizer/sizer.dart';

class TopupMethodCard extends StatelessWidget {
  const TopupMethodCard({
    Key? key,
    required this.methodName,
    required this.methodLogo,
    required this.topupMethodTypeValue,
  }) : super(key: key);
  final String methodName;
  final String methodLogo;
  final TopupMethodType topupMethodTypeValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: kDefaultPadding),
      decoration: BoxDecoration(
        color: nWhite,
        borderRadius: BorderRadius.circular(kBorder),
        boxShadow: kBoxShadow,
      ),
      child: Row(
        children: [
          Container(
            width: 10.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kBorder),
              child: Image.asset(
                methodLogo,
                width: 30,
                height: 30,
              ),
            ),
          ),
          Container(
            width: 70.w,
            child: BlocBuilder<TopupCubit, TopupState>(
              builder: (context, state) {
                return RadioListTile(
                  activeColor: kSecondaryColor,
                  contentPadding: EdgeInsets.only(left: 10),
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: Text(
                    methodName,
                  ),
                  value: topupMethodTypeValue,
                  groupValue: state.topupMethod,
                  onChanged: (TopupMethodType? value) =>
                      context.read<TopupCubit>().onTopupMethodChange(value),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
