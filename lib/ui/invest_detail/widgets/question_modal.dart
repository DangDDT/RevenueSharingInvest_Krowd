import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:sizer/sizer.dart';

import 'faq_container.dart';

Future<void> showQuestionModal(BuildContext context) {
  return showModalBottomSheet<void>(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
    backgroundColor: Colors.white,
    context: context,
    builder: (context) => QuestionModal(),
  );
}

class QuestionModal extends StatelessWidget {
  const QuestionModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: GestureDetector(
            child: Container(
                height: 80.h,
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding + 10,
                ),
                decoration: new BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(kBorder),
                    topRight: const Radius.circular(kBorder),
                  ),
                ),
                child: new LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  return Column(
                    children: [
                      Container(
                        height: constraints.maxHeight * 0.25,
                        decoration: new BoxDecoration(
                          color: nWhite,
                          borderRadius: BorderRadius.all(
                            Radius.circular(kBorder + 4),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "C??u h???i",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: kFontSize - 2,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Th?????ng g???p",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: kFontSize + 4,
                                    color: kPrimaryColor,
                                  ),
                                )
                              ],
                            ),
                            Image.asset(
                              "assets/images/business_idea.png",
                              width: 170,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: constraints.maxHeight * 0.75,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            FAQ(
                              constraints: constraints,
                              question:
                                  "T??i mu???n tham gia d??? ??n th?? ph???i l??m g???",
                              answer:
                                  "L???a ch???n ???????c d??? ??n m??nh y??u th??ch. Sau ????, ch???n mua g??i ?????u t?? ph?? h???p v???i t??i ch??nh c???a m??nh. ",
                            ),
                            FAQ(
                              constraints: constraints,
                              question:
                                  "Chuy???n ti???n v??o v?? ?????u t?? chung m???t bao l??u?",
                              answer:
                                  "H??? th???ng s??? x??? l?? ti???n c???a b???n ch???m nh???t l?? m???t ng??y. N???u sau m???t ng??y v???n ch??a th???y ti???n ???????c chuy???n v??o th?? h??y li??n h??? ????? ???????c x??? l?? s???m nh???t.",
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }))));
  }
}
