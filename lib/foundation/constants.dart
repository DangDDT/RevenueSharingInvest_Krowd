import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

//Old Krowd UX/UI theme
// const kPrimaryColor = Color(0xFF009834);
// const kBlueSecondaryColor = Color(0xFF2fc7d3);
// const kBackgroundColor = Color(0xFFF2F2F6);

// Santorini Palette
const kPrimaryColor = Color(0xff12A6BA);
const kLightPrimaryColor = Color(0xff63C1E3);
const kSecondaryColor = Color(0xFFFF7F50);
const kHotColor = Color(0xffD73340);
const kBackgroundColor = Color(0xFFFFFFFF);
const kErrorColor = Color(0xffFF1F3D);
const kDarkTextColor = Color(0xFF251E18);
const kLightTextColor = Color(0xFFFAF4EF);
const kYellowSecondaryColor = Color(0xFFFFCC00);
const kGrayButtonColor = Color(0xFFD8E0EE);
const kBlueColor = Color(0xff134A9F);
const kGrayBy6 = Color(0xFFA7A8A9);

//Basic Color
const bRed = Color(0xFFFF3B30);
const bOrange = Color(0xFFFF9500);
const bYellow = Color(0xFFFFCC00);
const bGreen = Color(0xFF34C759);
const bTeal = Color(0xFF5AC8FA);
const bBlue = Color(0xFF007AFF);
const bIndigo = Color(0xFF5856D6);
const bPurple = Color(0xFFAF52DE);
const bPink = Color(0xFFFF2D55);

//Primary Color
const pGreen1 = Color(0xFFE5F9EB);
const pGreen2 = Color(0xFF99D6AE);
const pGreen3 = Color(0xFF66C185);
const pGreen4 = Color(0xFF33AD5D);
const pGreen5 = Color(0xFF009834);
const pGreen6 = Color(0xFF00812C);
const pGreen7 = Color(0xFF006A24);
const pGreen8 = Color(0xFF00541D);

//Secondary Color
const sBlue1 = Color(0xFFE4EDFB);
const sBlue2 = Color(0xFFA1B7D9);
const sBlue3 = Color(0xFF7192C5);
const sBlue4 = Color(0xFF426EB2);
const sBlue5 = Color(0xFF134A9F);
const sBlue6 = Color(0xFF103F87);
const sBlue7 = Color(0xFF0D346F);
const sBlue8 = Color(0xFF0A2957);

//Neutral Color
const nWhite = Color(0xFFFFFFFF);
const nGray0 = Color(0xFFFAFAFA);
const nGray1 = Color(0xFFF2F2F6);
const nGray2 = Color(0xFFE5E5EA);
const nGray3 = Color(0xFFD1D1D6);
const nGray4 = Color(0xFFC7C7CC);
const nGray5 = Color(0xFFAEAEB2);
const nGray6 = Color(0xFF8E8E93);
const nGray7 = Color(0xFF7B7B7F);
const nGray8 = Color(0xFF636366);
const nGray9 = Color(0xFF48484A);
const nGray10 = Color(0xFF3A3A3C);
const nGray11 = Color(0xFF1C1C1E);
const nGray12 = Color(0xFF111112);
const nBlack = Color(0xFF000000);

const double kDefaultPadding = 20.0;
const double kFontSize = 14.0;
const double kBorder = 8.0;
var kBoxShadow = [
  new BoxShadow(
    color: kDarkTextColor.withOpacity(.2),
    blurRadius: 15.0, // soften the shadow
    spreadRadius: .2, //extend the shadow
    offset: Offset(
      5.0, // Move to right 10  horizontally
      5.0, // Move to bottom 10 Vertically
    ),
  )
];
const IconData BACKWARD_ICON = Icons.chevron_left;
const String STAR_ICON = "assets/images/star.png";
const String EMPTY_IMAGE = "assets/images/empty_image.png";
// ignore: non_constant_identifier_names
final Map<String, Style> HTML_STYLE = {
  "h1 *": Style(
    fontSize: FontSize.xLarge,
  ),
  "h2 *": Style(
    fontSize: FontSize.xLarge,
  ),
  ".ql-align-center": Style(
    textAlign: TextAlign.center,
  ),
  ".ql-align-justify": Style(
    textAlign: TextAlign.justify,
  ),
  ".ql-align-right": Style(
    textAlign: TextAlign.right,
  ),
  "p *": Style(
    fontSize: FontSize.xLarge,
  ),
  "p span ": Style(
    fontSize: FontSize.large,
    lineHeight: LineHeight.rem(2),
    textAlign: TextAlign.justify,
  ),
  "p strong": Style(
    fontSize: FontSize.xLarge,
  ),
  'blockquote': Style(
    margin: EdgeInsets.symmetric(
      horizontal: 0,
      vertical: 50,
    ),
  ),
  'blockquote span': Style(
    fontSize: FontSize.large,
  ),
  "li": Style(
    margin: EdgeInsets.only(bottom: 20),
    color: kDarkTextColor.withOpacity(0.6),
    textAlign: TextAlign.justify,
    listStyleType: ListStyleType.fromWidget(Image.asset(
      "assets/images/star.png",
      width: 20,
    )),
    listStylePosition: ListStylePosition.INSIDE,
  )
};
