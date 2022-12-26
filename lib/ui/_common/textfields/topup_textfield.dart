import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:sizer/sizer.dart';

class TopupTextField extends StatefulWidget {
  const TopupTextField({
    Key? key,
    required this.title,
    required this.onChangedString,
    this.keyboardType = TextInputType.multiline,
    this.currentText,
    this.hintText,
    this.endIcon,
    this.inputFormatters,
    this.errorText,
  }) : super(key: key);
  final Widget? endIcon;
  final String title;
  final TextInputType keyboardType;
  final Function(String) onChangedString;
  final String? currentText;
  final String? errorText;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  @override
  State<TopupTextField> createState() => _TopupTextFieldState();
}

class _TopupTextFieldState extends State<TopupTextField> {
  FocusNode _focus = new FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _focus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var endIcon = widget.endIcon ?? SizedBox.shrink();
    var suffixIcon = Container(
      width: 20.w,
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(right: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[endIcon],
      ),
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding - 10),
      child: TextFormField(
        inputFormatters: widget.inputFormatters,
        focusNode: _focus,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChangedString,
        textAlignVertical: TextAlignVertical.center,
        initialValue: widget.currentText,
        style: TextStyle(
            color: kDarkTextColor,
            fontWeight: FontWeight.bold,
            fontSize: kFontSize),
        decoration: InputDecoration(
          errorText: widget.errorText,
          hintText: widget.hintText,
          filled: true,
          fillColor: nWhite,
          labelText: widget.title,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          floatingLabelStyle:
              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            final Color color =
                states.contains(MaterialState.focused) ? kPrimaryColor : nGray5;
            return TextStyle(
                color: color,
                letterSpacing: 1.3,
                fontWeight: FontWeight.bold,
                fontSize: kFontSize);
          }),
          labelStyle: TextStyle(
              color: nGray5, fontSize: kFontSize, fontWeight: FontWeight.bold),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: nGray3, width: 1.0),
            borderRadius: BorderRadius.circular(kBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 2.5),
            borderRadius: BorderRadius.circular(kBorder),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kErrorColor),
            borderRadius: BorderRadius.circular(kBorder),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kErrorColor, width: 0.0),
            borderRadius: BorderRadius.circular(kBorder),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
