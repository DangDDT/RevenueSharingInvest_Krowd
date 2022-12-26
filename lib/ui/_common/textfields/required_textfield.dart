import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:sizer/sizer.dart';

class RequiredTextField extends StatefulWidget {
  const RequiredTextField({
    Key? key,
    required this.title,
    this.obscureText = false,
    required this.onChangedString,
    this.keyboardType = TextInputType.multiline,
    this.errorText,
    this.currentText,
    this.hintText,
    this.endIcon,
    this.inputFormatters,
    this.enabled = true,
  }) : super(key: key);
  final Widget? endIcon;
  final String title;
  final bool obscureText;
  final TextInputType keyboardType;
  final Function(String) onChangedString;
  final String? errorText;
  final String? currentText;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  @override
  State<RequiredTextField> createState() => _RequiredTextFieldState();
}

class _RequiredTextFieldState extends State<RequiredTextField> {
  FocusNode _focus = new FocusNode();
  bool _isObscure = true;
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
    var obscureIcon = widget.obscureText && _focus.hasPrimaryFocus
        ? IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility_off : Icons.visibility_sharp,
              color: kDarkTextColor,
            ),
            onPressed: () => setState(() {
              _isObscure = !_isObscure;
            }),
          )
        : SizedBox.shrink();
    var errorIcon = (widget.errorText != null)
        ? Icon(Icons.error_outline, color: kErrorColor)
        : SizedBox.shrink();
    var endIcon = widget.endIcon ?? SizedBox.shrink();
    var suffixIcon = Container(
      width: (widget.errorText != null) ? 20.w : 10.w,
      alignment: Alignment.centerRight,
      margin: (widget.errorText != null)
          ? EdgeInsets.only(right: kDefaultPadding)
          : EdgeInsets.only(right: kDefaultPadding - 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[obscureIcon, errorIcon, endIcon],
      ),
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding - 10),
      child: TextFormField(
        inputFormatters: widget.inputFormatters,
        focusNode: _focus,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChangedString,
        obscureText: widget.obscureText && _isObscure,
        initialValue: widget.currentText,
        autofocus: false,
        style: TextStyle(color: kDarkTextColor, fontSize: kFontSize - 2),
        textAlignVertical: TextAlignVertical.center,
        enabled: widget.enabled,
        decoration: InputDecoration(
          hintText: widget.hintText,
          errorText: widget.errorText,
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
            borderSide: BorderSide(color: nGray4, width: 1.0),
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
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: nGray3, width: 1.0),
            borderRadius: BorderRadius.circular(kBorder),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
