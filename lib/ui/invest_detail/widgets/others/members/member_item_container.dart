import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';

class MemberContainerItem extends StatelessWidget {
  const MemberContainerItem({
    Key? key,
    required this.memberImageLink,
    required this.memberName,
  }) : super(key: key);
  final String memberImageLink;
  final String memberName;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 5),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(kBorder * 3),
              child: Image.network(
                memberImageLink,
                width: 45,
                height: 45,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) =>
                    Image.asset("assets/images/default_man.png"),
              ),
            ),
            title: Text(
              memberName,
              style: TextStyle(
                  color: kDarkTextColor,
                  fontSize: kFontSize,
                  fontWeight: FontWeight.w700),
            ),
            subtitle: Text(
              "Nhà đầu tư",
              style: TextStyle(
                color: nGray6,
                fontSize: kFontSize - 4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
