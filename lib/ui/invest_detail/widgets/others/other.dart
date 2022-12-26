import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';
import 'documents/document.dart';
import 'members/member_view.dart';

class OtherTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [documentsView(), memberWidget()],
        ),
      ),
    );
  }
}

Widget documentsView() => Document();

Widget memberWidget() => MemberViewWidget();
